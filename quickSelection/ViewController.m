//
//  ViewController.m
//  quickSelection
//
//  Created by ShihKuo-Hsun on 2015/2/21.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "ViewController.h"
#import "LOCircleProgressView.h"
#import "LOCircleLabel.h"

@interface ViewController () <LOCircleProgressViewDelegate> {
	IBOutlet LOCircleProgressView *progress;
	IBOutlet UIImageView *circle;
	IBOutlet UILabel *numberLabel;

	IBOutlet UIButton *OXBtn;
	IBOutlet UIButton *numbersBtn;
	IBOutlet UIButton *quickSelectionBtn;

	IBOutlet UISlider *rangeSlider;
    
    int times;
    NSTimer *randomAnimateTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    times = 0;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];

	progress.delegate = self;
}

#pragma mark - ib action
- (IBAction)pushMePressed:(UIButton *)sender {
}

- (IBAction)viewPressed:(UIButton *)sender {
	CGRect frame = circle.frame;

	CGFloat a = -10;
	CGFloat b = 20;
	CGFloat c = 5;

	if (quickSelectionBtn.selected) {
        [self numberLabelChangeWithRandom];


    }else{
        if (randomAnimateTimer == nil) {
            randomAnimateTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(numberLabelChangeWithRandom) userInfo:nil repeats:YES];
        }
        
        [UIView animateWithDuration:0.5 animations: ^{
            circle.frame = CGRectMake(frame.origin.x + a, frame.origin.y + a, frame.size.width - 2 * a, frame.size.height - 2 * a);
        } completion: ^(BOOL finished) {
            [progress setProgressValue:0 withAnimate:YES];
            
            [UIView animateWithDuration:0.5 animations: ^{
                circle.frame = CGRectMake(frame.origin.x + b, frame.origin.y + b, frame.size.width - 2 * b, frame.size.height - 2 * b);
            } completion: ^(BOOL finished) {
                [UIView animateWithDuration:0.3 animations: ^{
                    circle.frame = CGRectMake(frame.origin.x + a, frame.origin.y + a, frame.size.width - 2 * a, frame.size.height - 2 * a);
                } completion: ^(BOOL finished) {
                    [UIView animateWithDuration:0.25 animations: ^{
                        [progress setProgressValue:1 withAnimate:YES];
                        circle.frame = CGRectMake(frame.origin.x + c, frame.origin.y + c, frame.size.width - 2 * c, frame.size.height - 2 * c);
                    } completion: ^(BOOL finished) {
                        [UIView animateWithDuration:0.25 animations: ^{
                            circle.frame = frame;
                        } completion: ^(BOOL finished) {
                        }];
                    }];
                }];
            }];
        }];
    }
}

- (IBAction)sliderSlided:(UISlider *)sender {
	numberLabel.text = [NSString stringWithFormat:@"%.0f", sender.value];
}

- (IBAction)O_or_X_BtnPressed:(UIButton *)sender {
	sender.selected = YES;
	numbersBtn.selected = NO;

	[self numberLabelChangeWithRandom];
}

- (IBAction)numbersBtnPressed:(UIButton *)sender {
	sender.selected = YES;
	OXBtn.selected = NO;

	[self sliderSlided:rangeSlider];
}

- (IBAction)quickSelectionBtnPressed:(UIButton *)sender {
	sender.selected = !sender.selected;
}

#pragma mark - number changing

/**
 *
 *
 *  @param number show  number or O X
 */
- (void)numberLabelChangeWithRandom{
	if (numbersBtn.selected) {
        int uper = (int)rangeSlider.value;
        numberLabel.text = [NSString stringWithFormat:@"%d",arc4random()%uper];
	}
	else {
		numberLabel.text = arc4random() % 2 ? @"O" : @"X";
	}
    
    if (times < 36 && !quickSelectionBtn.selected) {
        times++;
    }else{
        [randomAnimateTimer invalidate];
        randomAnimateTimer = nil;
        times = 0;
    }
}

#pragma mark - delegate

- (void)LOCircleProgressViewDidEndAnimate {
}

@end
