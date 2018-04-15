//
//  main.m
//  threeLow
//
//  Created by ruijia lin on 4/11/18.
//  Copyright © 2018 ruijia lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        char input[255];
        NSInteger score = 0;
        BOOL isContinued = YES;
        GameController *gameController = [GameController new];

        
        NSLog(@"\nWelcome to GamblingIsIllegal ThreeLow game!\n\n\nYou have 5 dice to roll, hold at least 1 and at most 5 dice to roll each time.  Score will be dtermined after all dice are rolled.");
        
        while (isContinued){
            
            for (NSString *key in gameController.diceDict){
                NSLog(@"\nDice#: %@\tDice Value: %ld\tStatus: %@", key, [[gameController.diceDict valueForKey:key] diceValue], [[gameController.diceDict valueForKey:key] diceState]);
            }
            
            // display current score
            score = [gameController calculateScore];
            NSLog(@"\n\nCurrent score: %li", score);
            
            NSLog(@"\n\n- Enter 'roll' to roll the dices\n- Enter 'quit' to quit the game\n- Enter 'reset' to unhold the dices, except for the rolled dices\n- Enter 'hold' to hold the dice you wish to re-roll");
            
            fgets(input, 255, stdin);
            NSString *inputString = [[NSString stringWithCString:input encoding: NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
            if ([inputString isEqualToString:@"quit"]){
                NSLog(@"Thanks for playing!");
                isContinued = NO;
                break;
            } else if ([inputString isEqualToString:@"reset"]){
                
                // reset all held dice to unheld
                [gameController toggleReset];
                
            }else if ([inputString isEqualToString:@"hold"]){
                
                // toggle the state of dice and confirm with user the state of dice
                [gameController toggleDiceState];
                
            }else if ([inputString isEqualToString:@"roll"]){
                
                [gameController rollDice];

            }else{
                NSLog(@"Command not regonized");
                continue;
            }
            
        }
        
    }
    return 0;
}
