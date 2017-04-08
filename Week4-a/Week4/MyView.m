//
//  MyView.m
//  Week4
//
//  Created by YongJai on 2017. 4. 3..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import "MyView.h"

@implementation MyView



- (void) drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGGradientRef gradient = [self gradient];
    CGPoint startPoint
    = CGPointMake(CGRectGetMidX(self.bounds), 0.0);
    CGPoint endPoint
    = CGPointMake(CGRectGetMidX(self.bounds),
                  CGRectGetMaxY(self.bounds));
    
    CGContextDrawLinearGradient(context, gradient,
                                startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    [self drawRandomLines];
    [self drawRandomArcs];
}

- (CGGradientRef) gradient {
    UIColor *firstColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.7 alpha:1.0];
    UIColor *secondColor = [UIColor colorWithRed:0.8 green:0.2 blue:0.4 alpha:1.0];
    
    CGFloat locations[2] = {0.0 , 1.0};
    CFArrayRef cfArr = (__bridge CFArrayRef) [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
    CGColorSpaceRef cgRef = CGColorSpaceCreateDeviceRGB();
    return CGGradientCreateWithColors(cgRef, cfArr, locations);
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

- (void) drawRandomLines {
    [self randomPointLine];
    for(int i=0 ; i<20 ; i=i+2){
        UIBezierPath *path = [UIBezierPath bezierPath];
        NSValue *start = [self.randomPoints objectAtIndex:i];
        NSValue *end = [self.randomPoints objectAtIndex:i+1];
        [path moveToPoint:[start CGPointValue]];
        [path addLineToPoint:[end CGPointValue]];
        [path setLineWidth:8.0];
        UIColor *strokeColor = [UIColor colorWithRed:0.1 green:0.2 blue:0.3 alpha:1.0];
        [strokeColor setStroke];
        [path closePath];
        [path stroke];
    }
}

- (void) randomPointLine {
    self.randomPoints = [NSMutableArray array];
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    
    for (int i=0; i<20; i++) {
        CGFloat X = [[NSNumber numberWithFloat:((float)rand()/RAND_MAX * width)] floatValue];
        CGFloat Y = [[NSNumber numberWithFloat:((float)rand()/RAND_MAX * height)] floatValue];
        [self.randomPoints addObject:[NSValue valueWithCGPoint:CGPointMake(X, Y)]];
    }
}

- (void) drawRandomArcs {
    [self radomPointArc];
    for(int i=0 ; i<10 ; i++){
        UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:[[self.randomCenters objectAtIndex:i] CGPointValue]
                                                             radius:[[self.randomRadius objectAtIndex:i] floatValue]
                                                         startAngle:0.0
                                                           endAngle:((M_PI*360.0)/90.0)
                                                          clockwise:YES];
        [path setLineWidth:10.0];
        UIColor *fillColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.2 alpha:0.8];
        [fillColor setFill];
        UIColor *strokeColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.1 alpha:0.6];
        [strokeColor setStroke];
        [path closePath];
        [path fill];
        [path stroke];
    }
}

- (void) radomPointArc {
    self.randomCenters = [NSMutableArray array];
    self.randomRadius = [NSMutableArray array];
    float width = [UIScreen mainScreen].bounds.size.width;
    float height = [UIScreen mainScreen].bounds.size.height;
    for (int i=0 ; i<20 ; i++){
        CGFloat X = [[NSNumber numberWithFloat:((float)rand()/RAND_MAX*width)] floatValue];
        CGFloat Y = [[NSNumber numberWithFloat:((float)rand()/RAND_MAX*height)] floatValue];
        [self.randomCenters addObject:[NSValue valueWithCGPoint:CGPointMake(X, Y)]];
        
    }
    for (int i=0 ; i<20 ; i++){
        [self.randomRadius addObject:[NSNumber numberWithFloat:((float)rand()/RAND_MAX*77)]];
    }
}


@end
