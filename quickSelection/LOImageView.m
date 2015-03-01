//
//  LOImageView.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOImageView.h"

IB_DESIGNABLE
@interface LOImageView () {
	IBInspectable CGFloat cornerRadius;
	IBInspectable BOOL masksToBounds;
}

@end
@implementation LOImageView

//from code
- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];

	if (self) {
		[self setup];
	}
	return self;
}

//from storyboard
- (void)awakeFromNib {
	[super awakeFromNib];
	[self setup];
}

- (void)setup {
	self.layer.cornerRadius = cornerRadius;
	self.clipsToBounds = YES;
	self.layer.masksToBounds = masksToBounds;
}

- (void)prepareForInterfaceBuilder {
	[self setup];
}

@end
