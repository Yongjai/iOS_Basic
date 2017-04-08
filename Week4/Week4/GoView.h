//
//  GoView.h
//  Week4
//
//  Created by YongJai on 2017. 4. 5..
//  Copyright © 2017년 YongJai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoView : UIView {
    int stonePlace[11][11];
    BOOL isBlackStoneTurn;
}

@property UIImage *backImage;
@property UIImage *blackStone;
@property UIImage *whiteStone;

@end

