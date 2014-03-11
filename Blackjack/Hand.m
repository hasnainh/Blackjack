//
//  Hand.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Hand.h"

@implementation Hand

- (id)init: (Deck*) deck {
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc] init];
        [self drawCard: deck];
        [self drawCard: deck];
    }
    return self;
}

- (void)drawCard: (Deck*) deck {
    Card* card = [deck drawFromDeck];
    [_cards addObject:card];
}


- (NSInteger)handTotal {
    int total = 0;
    bool ace=NO;
    for (Card* card in _cards) {
        if ([card cardValue]==1) {
            ace=YES;
        }
        total += [card cardValue];
    }
    
    if (total <= 11 && ace) {
        total += 10;
    }
    return total;
}

- (NSInteger) dealerFirstHandTotal {
    return [[_cards objectAtIndex:0] cardValue];
}

- (void) clearHand {
    [_cards removeAllObjects];
}

- (NSString *)display {
    NSString *currentHand = @"";
    for (Card* card in _cards) {
        currentHand = [currentHand stringByAppendingString:[[card display] stringByAppendingString:@"\n"]];
        //NSLog(@"%d of %@", [card cardValue], [card cardSuit]);
    }
    return currentHand;
}

@end
