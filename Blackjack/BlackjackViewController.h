//
//  BlackjackViewController.h
//  Blackjack
//
//  Created by Hasnain Hossain on 3/2/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "Hand.h"

@interface BlackjackViewController : UIViewController

@property Hand *dealerHand;
@property Hand *playerHand;
@property Deck *deck;
@property NSInteger playerBank;
@property NSInteger gamesPlayed;

@end
