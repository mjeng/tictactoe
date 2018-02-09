//
//  ViewController.h
//  TicTacToe
//
//  Created by Matthew Jeng on 7/29/15.
//  Copyright (c) 2015 Matthew Jeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// initial setup properties
@property CGRect screenRect;
@property CGFloat screenWidth;
@property CGFloat screenHeight;
// end

@property (strong, nonatomic) IBOutlet UIImageView *gameBoard;

@property (strong, nonatomic) IBOutlet UIButton *centerButton;
@property (strong, nonatomic) IBOutlet UIButton *topLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *topButton;
@property (strong, nonatomic) IBOutlet UIButton *topRightButton;
@property (strong, nonatomic) IBOutlet UIButton *rightButton;
@property (strong, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (strong, nonatomic) IBOutlet UIButton *bottomButton;
@property (strong, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *leftButton;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *topRow;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *middleRow;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bottomRow;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *leftColumn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *middleColumn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *rightColumn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *negativeDiagonal;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *positiveDiagonal;



@property (strong, nonatomic) IBOutlet UILabel *topTextLabel;
@property (strong, nonatomic) IBOutlet UIButton *startGameButton;
@property (strong, nonatomic) IBOutlet UIButton *playAgainButton;


- (IBAction)startGameButton:(UIButton *)sender;
- (IBAction)onClick:(UIButton *)sender;

- (BOOL)didSomeoneWin;
- (void)someoneWon:(NSString *)winner;

@end

