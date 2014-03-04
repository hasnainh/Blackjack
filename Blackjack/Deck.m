//
//  Deck.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/4/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "Deck.h"

@implementation Deck

-(id) init
{
    self = [super init];
    if (self) {
        _cards = [[NSMutableArray alloc]initWithCapacity:52];
    }
    for (int i=1; i < 14; i++) {
        for (int x=0; x<4; x++) {
            [_cards addObject: [[Card alloc] initWithValue:i]]; 
        }
    }
    return self;
}

-(Card *) drawFromDeck
{
    int randomIndex = rand()%[_cards count];
    
    Card *drawnCard = [_cards objectAtIndex:randomIndex];
    
    return drawnCard;
}

-(NSString *) display
{
    return [NSString stringWithFormat:@"%@", _cards];
}


@end
