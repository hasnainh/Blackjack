//
//  Blackjack.h
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hand.h"
#import "Deck.h"

@interface Blackjack : NSObject

@property Hand *dealerHand;
@property Hand *playerHand;
@property Deck *deck;

-(void) setup;



@end
