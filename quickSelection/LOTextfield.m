//
//  LOTextfield.m
//  FPG
//
//  Created by ShihKuo-Hsun on 2015/1/12.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "LOTextfield.h"

IB_DESIGNABLE

@interface LOTextfield () {
	IBInspectable CGFloat cornerRadius;
	IBInspectable BOOL masksToBounds;

	IBInspectable CGRect padding;
	IBInspectable UIColor *placeHolderColor;
}

@end
@implementation LOTextfield

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

	//padding
	UIView *paddingView = [[UIView alloc] initWithFrame:padding];
	self.leftView = paddingView;
	self.leftViewMode = UITextFieldViewModeAlways;

	//place holder color
	if (placeHolderColor) {
		[self setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
	}
}

- (void)prepareForInterfaceBuilder {
	[self setup];
}

@end
