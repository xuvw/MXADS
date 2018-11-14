//
//  ADSViewController.m
//  MXADS_Example
//
//  Created by heke on 2018/11/14.
//  Copyright © 2018 xuvw. All rights reserved.
//

#import "ADSViewController.h"

@interface ADSViewController ()

@end

@implementation ADSViewController

- (void)dealloc {
    NSLog(@"ADSViewController dealloc...");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)close:(id)sender {
    self.adsClose(nil);
}

@end
