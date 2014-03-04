//
//  Card.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithValue: (int) v
{
    self = [super init];
    if (self) {
        _value = v;
    }
    return self;
}


@end
