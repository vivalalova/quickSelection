//
//  TodayViewController.m
//  quick selection
//
//  Created by ShihKuo-Hsun on 2015/3/1.
//  Copyright (c) 2015年 LO. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "LOCircleProgressView.h"

@interface TodayViewController () <NCWidgetProviding>{
    IBOutlet LOCircleProgressView *progress;
    IBOutlet UIImageView *circle;
    IBOutlet UILabel *numberLabel;
    
    int times;
    NSTimer *randomAnimateTimer;
}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    progress.progressValue = 1;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setPreferredContentSize:CGSizeMake(9999, 120)];
}


- (IBAction)viewPressed:(UIButton *)sender {
    
    NSLog(@"view tapped");
    
    CGRect frame = circle.frame;
    
    CGFloat a = -5;
    CGFloat b = 10;
    CGFloat c = 3;

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



- (IBAction)goBtn:(UIButton *)sender {
    NSLog(@"tapped!");
    NSURL *customURL = [NSURL URLWithString:@"quickSelection://"];
    [self.extensionContext openURL:customURL completionHandler:nil];
}


- (void)numberLabelChangeWithRandom{
    
        numberLabel.text = [NSString stringWithFormat:@"%d",arc4random()%42 +1];
    
    if (times < 36) {
        times++;
    }else{
        [randomAnimateTimer invalidate];
        randomAnimateTimer = nil;
        times = 0;
    }
}

































- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
