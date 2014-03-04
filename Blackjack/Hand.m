//
//  Hand.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (id)init: (Deck*) deck
{
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
        [self draw: deck];
        [self draw: deck];
    }
    return self;
}

- (void)draw: (Deck*) deck
{
    Card* card = [deck drawFromDeck];
    [_cards addObject:card];
}

- (int)total
{
    int total = 0;
    bool ace=NO;
    for (Card* card in _cards)
    {
        if ([card value]==11)
        {
            ace=YES;
        }
        total += [card value];
    }
    
    if (total <= 11 && ace)
    {
        total += 10;
    }
    return total;
}

@end
