//
//  Card.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithValue: (NSInteger) value cardSuit:(NSString*) suit {
    self = [super init];
    if (self) {
        _cardSuit = suit;
        _cardNumber = value;
        if (value == 11 || value == 12 || value == 13) {
            _cardValue = 10;
        }
        else {
            _cardValue = value;
        }
        
    }
    return self;
}


-(NSString *) display {
    //NSLog(@"%d of %@", [self cardValue], [self cardSuit]);
    if ([self cardNumber] == 1) {
        return [NSString stringWithFormat:@"Ace of %@", [self cardSuit]];
    }
    if ([self cardNumber] == 11) {
        return [NSString stringWithFormat:@"Jack of %@", [self cardSuit]];
    }
    if ([self cardNumber] == 12) {
        return [NSString stringWithFormat:@"Queen of %@", [self cardSuit]];
    }
    if ([self cardNumber] == 13) {
        return [NSString stringWithFormat:@"King of %@", [self cardSuit]];
    }
    else {
        return [NSString stringWithFormat:@"%ld of %@", (long)[self cardNumber], [self cardSuit]];
    }
}


@end
