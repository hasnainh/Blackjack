//
//  Blackjack.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Blackjack.h"

@implementation Blackjack

-(void) setup
{
    [_playerHand draw:_deck];
    [_playerHand draw:_deck];
    
}

@end
