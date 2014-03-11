//
//  Card.h
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property NSInteger cardNumber;
@property NSInteger cardValue;
@property NSString *cardSuit;

- (id)initWithValue: (NSInteger) value cardSuit:(NSString*) suit;
- (NSString *) display;
@end
