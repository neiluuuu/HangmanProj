//
//  ViewController.m
//  Hangman
//
//  Created by Neil Argade on 3/20/15.
//  Copyright (c) 2015 Neil Argade. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end

@implementation ViewController

-(void)setUp {
    self.game = [[Hangman alloc] init];
    self.hangmanString.text = [self.game setUpWord];
    self.wrongLetters.text = [self.game arrayToString:[self.game wrongLetters]];
    NSLog([self.game correctWord]);
    self.hangmanImage.image = [UIImage imageNamed:@"hang_0.gif"];
}

- (void) setWrongLettersString {
    
    self.wrongLetters.text = [self.game arrayToString:[self.game wrongLetters]];
}

- (void) whatImage {
    int length = [[self.game wrongLetters] count];
    switch (length) {
        case 1:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_1.gif"];
            break;
        case 2:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_2.gif"];
            break;
        case 3:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_3.gif"];
            break;
        case 4:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_4.gif"];
            break;
        case 5:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_5.gif"];
            break;
        case 6:
            self.hangmanImage.image = [UIImage imageNamed:@"hang_6.gif"];
            break;
    }
}



- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self.game checkLetter:textField.text];
    self.hangmanString.text = [self.game displayedWord];
    [self setWrongLettersString];
    [self whatImage];
    [self.game checkState];
    if ([self.game win]) {
        textField.enabled = NO;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You won" message:@"Congratulations" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"New Game", nil];
        [alert show];
    }
    if ([self.game lose]) {
        self.hangmanString.text = [self.game correctWord];
        textField.enabled = NO;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You lose" message:@"Sorry Try Again?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"New Game", nil];
        [alert show];
    }
    textField.text = nil;
    return NO;
}

- (IBAction)createGame:(id)sender {
    [self setUp];
    self.textField.enabled = YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex == 1) {
        [self setUp];
        self.textField.enabled = YES;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
