//
//  BlackjackViewController.m
//  Blackjack
//
//  Created by Hasnain Hossain on 3/2/14.
//  Copyright (c) 2014 Hasnain Hossain. All rights reserved.
//

#import "BlackjackViewController.h"



@interface BlackjackViewController ()
@property (weak, nonatomic) IBOutlet UILabel *playerDisplay;
@property (weak, nonatomic) IBOutlet UILabel *dealerDisplay;
@property (weak, nonatomic) IBOutlet UILabel *dealerScore;
@property (weak, nonatomic) IBOutlet UILabel *playerScore;
@property (weak, nonatomic) IBOutlet UILabel *betDisplay;
@property (weak, nonatomic) IBOutlet UILabel *mainDisplay;
@property (weak, nonatomic) IBOutlet UILabel *playerBankDisplay;

@property (weak, nonatomic) IBOutlet UIStepper *betStepper;

@property (weak, nonatomic) IBOutlet UIButton *standButton;
@property (weak, nonatomic) IBOutlet UIButton *hitButton;
@property (weak, nonatomic) IBOutlet UIButton *placeBetButton;
@property (weak, nonatomic) IBOutlet UIButton *gameButton;


@end

@implementation BlackjackViewController

- (IBAction)stepperValueChanger:(UIStepper*)sender {
    NSInteger currentBetAmount = [sender value];
    [[self betDisplay] setText:[NSString stringWithFormat:@"Bet Amount: $%ld", (long)currentBetAmount]];
}

- (IBAction)placeBet:(id)sender {
    _currentBetAmount = [_betStepper value];
    [[self hitButton] setEnabled:YES];
    [[self standButton] setEnabled:YES];
    [[self placeBetButton] setEnabled:NO];
}


- (IBAction)hit:(id)sender {
    
    
     [_playerHand drawCard:_deck];
    
    [[self playerDisplay] setText:[_playerHand display]];
    [[self playerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_playerHand handTotal]]];
    
    if ([_playerHand handTotal] > 21) {
        [[self mainDisplay] setText:@"BUST, YOU LOSE"];
        _playerBank -= _currentBetAmount;
        [_betStepper setMaximumValue:_playerBank];
    }
    else if ([_playerHand handTotal] == 21){
        [[self mainDisplay] setText:@"BLACKJACK, YOU WIN"];
        _playerBank += _currentBetAmount;
        [_betStepper setMaximumValue:_playerBank];
    }
    else {
        [_dealerDisplay setNumberOfLines:3];
        //_dealerDisplay.numberOfLines++;
        [[self dealerDisplay] setText:[_dealerHand display]];
        [[self dealerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_dealerHand handTotal]]];
        
        if ([_dealerHand handTotal] < 17) {
            //_dealerDisplay.numberOfLines++;
            [_dealerHand drawCard:_deck];
            [[self dealerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_dealerHand handTotal]]];
            if ([_dealerHand handTotal] > 21) {
                [[self mainDisplay] setText:@"DEALER BUST, YOU WIN"];
                _playerBank += _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if ([_dealerHand handTotal] == 21){
                [[self mainDisplay] setText:@"DEALER HITS BLACKJACK, YOU LOSE"];
                _playerBank -= _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if([_dealerHand handTotal] > [_playerHand handTotal]){
                [[self mainDisplay] setText:@"DEALER WINS, YOU LOSE"];
                _playerBank -= _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if([_dealerHand handTotal] < [_playerHand handTotal]){
                [[self mainDisplay] setText:@"YOU WIN"];
                _playerBank += _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
        }
    }
    [[self hitButton] setEnabled:NO];
    [[self standButton] setEnabled:NO];
    [[self placeBetButton] setEnabled:NO];
    [[self gameButton] setEnabled:YES];
}

- (IBAction)stand:(id)sender {
    
    if ([_playerHand handTotal] > 21) {
        [[self mainDisplay] setText:@"BUST, YOU LOSE"];
        _playerBank -= _currentBetAmount;
        [_betStepper setMaximumValue:_playerBank];
    }
    else if ([_playerHand handTotal] == 21){
        [[self mainDisplay] setText:@"BLACKJACK, YOU WIN"];
        _playerBank += _currentBetAmount;
        [_betStepper setMaximumValue:_playerBank];
    }
    else {
        [_dealerDisplay setNumberOfLines:3];
        //_dealerDisplay.numberOfLines++;
        [[self dealerDisplay] setText:[_dealerHand display]];
        [[self dealerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_dealerHand handTotal]]];
        
        if ([_dealerHand handTotal] < 17) {
            //_dealerDisplay.numberOfLines++;
            [_dealerHand drawCard:_deck];
            [[self dealerDisplay] setText:[_dealerHand display]];
            [[self dealerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_dealerHand handTotal]]];
            if ([_dealerHand handTotal] > 21) {
                [[self mainDisplay] setText:@"DEALER BUST, YOU WIN"];
                _playerBank += _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if ([_dealerHand handTotal] == 21){
                [[self mainDisplay] setText:@"DEALER HITS BLACKJACK, YOU LOSE"];
                _playerBank -= _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if([_dealerHand handTotal] > [_playerHand handTotal]){
                [[self mainDisplay] setText:@"DEALER WINS, YOU LOSE"];
                _playerBank -= _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
            else if([_dealerHand handTotal] < [_playerHand handTotal]){
                [[self mainDisplay] setText:@"YOU WIN"];
                _playerBank += _currentBetAmount;
                [_betStepper setMaximumValue:_playerBank];
            }
        }
    }
    [[self hitButton] setEnabled:NO];
    [[self standButton] setEnabled:NO];
    [[self placeBetButton] setEnabled:NO];
    [[self gameButton] setEnabled:YES];
    

}




- (IBAction)newGame:(id)sender {
    [[self playerBankDisplay] setText:[NSString stringWithFormat:@"%ld", (long)_playerBank]];
    if (_gamesPlayed > 5) {
        _deck = [[Deck alloc] init];
        _gamesPlayed = 0;
    }
    _gamesPlayed++;
    [[self placeBetButton] setEnabled:YES];
    [_betStepper setMaximumValue:_playerBank];
    [[self mainDisplay] setText:@"Place Bet"];
    
    [[self dealerDisplay] setText:nil];
    [[self playerDisplay] setText:nil];
    [[self dealerScore] setText:nil];
    [[self playerScore] setText:nil];
    
    [_dealerHand clearHand];
    [_dealerHand drawCard:_deck];
    [_dealerHand drawCard:_deck];
    
    [[self dealerDisplay] setText:[_dealerHand display]];
    [[self dealerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_dealerHand dealerFirstHandTotal]]];

    
    [_playerHand clearHand];
    [_playerHand drawCard:_deck];
    [_playerHand drawCard:_deck];
    
    [[self playerDisplay] setText:[_playerHand display]];
    [[self playerScore] setText:[NSString stringWithFormat:@"Current Total:%ld",(long)[_playerHand handTotal]]];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _deck = [[Deck alloc] init];
    _dealerHand = [[Hand alloc] init:_deck];
    _playerHand = [[Hand alloc] init:_deck];
    
    _playerBank = 100;
    _gamesPlayed = 0;
    [[self playerBankDisplay] setText:[NSString stringWithFormat:@"%ld", (long)_playerBank]];
    
    
    //_currentBetAmount = [[self betStepper] value];
    [[self betDisplay] setText:[NSString stringWithFormat:@"$%ld", (long)_currentBetAmount]];
    
    [[self standButton] setEnabled:NO];
    [[self hitButton] setEnabled:NO];
    [[self placeBetButton] setEnabled:NO];
    
    [[self mainDisplay] setText:@"To Play, Select New Game"];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
