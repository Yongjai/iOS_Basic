//
//  GoView.m
//  Week4
//
//  Created by YongJai on 2017. 4. 5..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "GoView.h"

@implementation GoView

- (void)awakeFromNib {
    self.backImage = [UIImage imageNamed:@"goImage.png"];
    self.blackStone = [UIImage imageNamed:@"black.png"];
    self.whiteStone = [UIImage imageNamed:@"white.png"];
    isBlackStoneTurn = YES;
    [self resetStonePlace];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    UITouch *viewTouch = [touches anyObject];
    CGPoint touch = [viewTouch locationInView:viewTouch.view];
    [self setStonPlace:touch];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self.backImage drawInRect:rect];
    [self drawLine];
    [self drawStone];
    [self drawBar];
}

- (void)drawLine {
    UIBezierPath *path = [UIBezierPath bezierPath];
    for(int i=0; i<=300; i+=30) {
        [path moveToPoint:CGPointMake(10+i, 20)];
        [path addLineToPoint:CGPointMake(10+i, 320)];
        [path moveToPoint:CGPointMake(10, 20+i)];
        [path addLineToPoint:CGPointMake(320, 20+i)];
        [path setLineWidth:2.0];
        [path stroke];
    }
}

- (void)setStonPlace:(CGPoint)touch {
    int x = floor((touch.x)/30);
    int y = floor((touch.y)/30);

    if(stonePlace[x][y]){
        return;
    }

    if(isBlackStoneTurn){
        stonePlace[x][y] = 1;
        isBlackStoneTurn = NO;
    } else {
        stonePlace[x][y] = 2;
        isBlackStoneTurn = YES;
    }
}

- (void)resetStonePlace {
    for(int x=0; x<11; x++){
        for(int y=0; y<11; y++){
            stonePlace[x][y] = 0;
        }
    }
}

- (void)drawStone {
    for(int x=0; x<11; x++){
        for(int y=0; y<11; y++){
            CGRect position = CGRectMake(x*30, y*30+10, 20, 20);
            if(stonePlace[x][y] == 1) {
                [self.blackStone drawInRect:position];
            } else if(stonePlace[x][y] == 2) {
                [self.whiteStone drawInRect:position];
            }
        }
    }
}

- (void)drawBar {
    for(int x=0 ; x<11 ; x++){
        int black=0, white = 0;
        
        for(int y=0 ; y<11 ; y++){
            if(stonePlace[x][y]==1){
                black++;
            }
            else if(stonePlace[x][y]==2){
                white++;
            }
        }
        if(black < white) {
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x*30, 450, 20, white*20)];
            [[UIColor whiteColor] setFill];
            [path fill];
        }
        else if (black > white) {
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x*30, 450, 20, black*20)];
            [[UIColor blackColor] setFill];
            [path fill];
        }
    }
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if(event.type == UIEventSubtypeMotionShake) {
        [self awakeFromNib];
    }
}

@end
