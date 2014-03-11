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
        _deckOfCards = [[NSMutableArray alloc] init];
    }
    for (int i=1; i < 14; i++) {
        [_deckOfCards addObject: [[Card alloc] initWithValue:i cardSuit:@"Heart"]];
        [_deckOfCards addObject: [[Card alloc] initWithValue:i cardSuit:@"Club"]];
        [_deckOfCards addObject: [[Card alloc] initWithValue:i cardSuit:@"Diamond"]];
        [_deckOfCards addObject: [[Card alloc] initWithValue:i cardSuit:@"Spade"]];
    }
    return self;
}

-(Card *) drawFromDeck
{
    NSInteger randomIndex = arc4random()%[_deckOfCards count];
    
    Card *drawnCard = [_deckOfCards objectAtIndex:randomIndex];
    [_deckOfCards removeObjectAtIndex:randomIndex];
    
    return drawnCard;
}

//-(void) display { NSLog(@"%@", _deckOfCards);}


@end
