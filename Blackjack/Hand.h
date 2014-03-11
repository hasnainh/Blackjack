//
//  Hand.h
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Hand : NSObject

@property NSMutableArray *cards;

- (id) init: (Deck*) deck;
- (void) drawCard: (Deck*) deck;
- (NSInteger) handTotal;
- (NSInteger) dealerFirstHandTotal;
- (void) clearHand;
- (NSString *) display;

@end
