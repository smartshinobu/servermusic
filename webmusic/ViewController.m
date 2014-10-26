//
//  ViewController.m
//  webmusic
//
//  Created by ビザンコムマック０７ on 2014/10/24.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@property AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //サーバーにおいてある音楽ファイルのURLを生成
    NSURL *url = [NSURL URLWithString:@"http://bizanshinobu.miraiserver.com/example.caf"];
    //urlをもとにNSDataを生成
    NSData *sounddata = [NSData dataWithContentsOfURL:url];
    NSLog(@"データサイズ%ld",sounddata.length);
    //sounddataをもとにplayer初期化
    self.player = [[AVAudioPlayer alloc]initWithData:sounddata error:NULL];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//再生ボタンを押すと呼ばれるメソッド
- (IBAction)music:(id)sender {
    if (self.player.playing) {
        self.player.currentTime = 0.0;
    }else{
        [self.player play];
    }
}
@end
