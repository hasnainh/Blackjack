//
//  BlackjackViewController.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/2/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "BlackjackViewController.h"
#import "Deck.h"

@interface BlackjackViewController ()

@end

@implementation BlackjackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Deck *aDeck = [[Deck alloc] init];
    
    NSLog( @"%@", [aDeck display]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
