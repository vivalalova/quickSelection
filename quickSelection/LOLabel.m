//
//  LOLabel.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/19.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOLabel.h"

IB_DESIGNABLE

@implementation LOLabel {
	IBInspectable CGFloat cornerRadius;
	IBInspectable BOOL masksToBounds;
	IBInspectable CGRect padding;
}


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

- (void)drawTextInRect:(CGRect)rect {
	UIEdgeInsets insets = { padding.origin.x, padding.origin.y, padding.size.width, padding.size.height };
	return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
