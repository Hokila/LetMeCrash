//
//  ViewController.m
//  LetMeCrash
//
//  Created by Hokila on 2013/10/24.
//  Copyright (c) 2013年 Hokila. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCrash:(id)sender {
    [self performSelector:@selector(LetMeCrash)];
}
@end
