//
//  ISMainViewController.h
//  InstaSearch
//
//  Created by William Tachau on 9/11/13.
//  Copyright (c) 2013 William Tachau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISInstagramTagSearcher.h"
#import "INETImageView.h"

@interface ISMainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *queryField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIScrollView *searchResultsBox;
@property (strong, nonatomic) ISInstagramTagSearcher *searcher;

-(IBAction) didPressSearch:(id)sender;

@end
