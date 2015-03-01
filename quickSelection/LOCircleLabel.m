//
//  LOCircleLabel.m
//  quickSelection
//
//  Created by ShihKuo-Hsun on 2015/2/22.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOCircleLabel.h"

@interface LOCircleLabel () {
}

@end


@implementation LOCircleLabel

#define a 10
#define b 30
#define c 0
#define d 10

- (void)breathe {
	CGRect frame = self.frame;


	[self breatheWithFrame:CGRectMake(frame.origin.x - a, frame.origin.y - a, frame.size.width + 2 * a, frame.size.height + 2 * a) completion: ^{
	}];
}

- (void)breatheWithFrame:(CGRect)frame completion:(void (^)(void))completion {
	[UIView animateWithDuration:0.3 animations: ^{
	    self.frame = frame;
	} completion: ^(BOOL finished) {
	    completion();
	}];
}

@end
