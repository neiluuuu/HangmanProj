//
//  Hangman.m
//  Hangman
//
//  Created by Neil Argade on 3/20/15.
//  Copyright (c) 2015 Neil Argade. All rights reserved.
//

#import "Hangman.h"
#import "HangmanWords.h"

@implementation Hangman
@synthesize correctWord;
@synthesize displayedWord;
@synthesize wrongLetters;
@synthesize win;
@synthesize lose;

- (void) chooseWord {
    HangmanWords* words = [[HangmanWords alloc] init];
    self.correctWord = [words getWord];
}

- (NSString *) setUpWord {
    [self chooseWord];
    wrongLetters = [[NSMutableArray alloc] init];
    self.displayedWord = @"";
    for (int i=0; i<self.correctWord.length; i++) {
        if ([[NSString stringWithFormat:@"%c", [correctWord characterAtIndex:i]]  isEqual: @" "]) {
            self.displayedWord = [self.displayedWord stringByAppendingString:@" "];
        }
        else {
            self.displayedWord = [self.displayedWord stringByAppendingString:@"-"];
        }
    }
    return displayedWord;
}

-(NSString *)checkLetter:(NSString *)guessedLetter {
    if (guessedLetter.length ==1) {
        BOOL match = NO;
        for (int i=0; i< self.correctWord.length; i++) {
            NSString* letter = [NSString stringWithFormat:@"%c" , [correctWord characterAtIndex:i]];
            guessedLetter = [guessedLetter uppercaseString];
            if ([letter isEqualToString: guessedLetter]) {
            displayedWord = [displayedWord  stringByReplacingCharactersInRange:NSMakeRange(i,1) withString: guessedLetter];
                match = YES;
            }
        
        }
        if (match == NO) {
        
            if (![self.wrongLetters containsObject:guessedLetter]) {
            
                [self.wrongLetters addObject:guessedLetter];
            }
        }
    }
    return displayedWord;
}

- (NSString *) arrayToString: (NSMutableArray*) array {
    NSString * letterString = @"";
    for (NSString* letter in array) {
        NSString* letterSpace =[letter stringByAppendingString:@" "];
        letterString = [letterString stringByAppendingString:letterSpace];
    }
    return letterString;
}

- (void) checkState {
    if ([self.displayedWord isEqualToString:self.correctWord]) {
        self.win = 1;
    }
    else if ([self.wrongLetters count] >= 6) {
        self.lose = 1;
    }
}
@end
