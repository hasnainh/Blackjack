//
//  Deck.h
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property NSMutableArray *deckOfCards;

- (Card *) drawFromDeck;

//- (void) display;

@end
