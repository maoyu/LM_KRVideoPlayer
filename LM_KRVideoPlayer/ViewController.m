//
//  ViewController.m
//  LM_KRVideoPlayer
//
//  Created by maoyu on 15/7/9.
//  Copyright (c) 2015年 maoyu. All rights reserved.
//

#import "ViewController.h"
#import "LMVideoPlayerController.h"

@interface ViewController ()

@property (nonatomic, strong) LMVideoPlayerController *videoController;


@end

@implementation ViewController

- (IBAction)playLocalVideo:(id)sender {
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"150511_JiveBike" withExtension:@"mov"];
    [self playVideoWithURL:videoURL];
}

- (void)playVideoWithURL:(NSURL *)url
{
    if (!self.videoController) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.videoController = [[LMVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, width, width*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController showInWindow];
    }
    self.videoController.contentURL = url;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
