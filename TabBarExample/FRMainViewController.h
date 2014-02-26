//
//  FRMainViewController.h
//  TabBarExample
//
//  Created by student on 2/11/14.
//  Copyright (c) 2014 Pomona College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FRTagSearcher.h"
#import "INETImageView.h"

@interface FRMainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *queryField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIScrollView *searchResultsBox;
@property (strong, nonatomic) FRTagSearcher *searcher;

-(IBAction) didPressSearch:(id)sender;
@end
