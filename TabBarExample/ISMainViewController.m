//
//  ISMainViewController.m
//  InstaSearch
//
//  Created by William Tachau on 9/11/13.
//  Copyright (c) 2013 William Tachau. All rights reserved.
//

#import "ISMainViewController.h"

@interface ISMainViewController ()

@end

@implementation ISMainViewController

// text field protocol method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.queryField resignFirstResponder];
    return TRUE;
}

// handler attached to search button
-(IBAction) didPressSearch:(id)sender {
    //dismiss keyboard if not already
    if ([self.queryField isFirstResponder]) {
        [self.queryField resignFirstResponder];
    }
    
    // create a tag searcher to make requests to instagram
    self.searcher = [[ISInstagramTagSearcher alloc] initWithTagQuery:[self queryField].text andTarget:self andAction:@selector(handleInstagramData:)];
    
}

// instagram response handler
- (void) handleInstagramData:(NSMutableDictionary *)data
{
    // select the photos array from the data object
    NSMutableArray *photos = [data objectForKey:@"data"];
    
    // debug line for traversing data structure
    //NSLog(@"%@",[[[[[data objectForKey:@"data"] objectAtIndex:0] objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"]);
    
    // clear any previous image views
    for (UIView *subView in [self.searchResultsBox subviews]) {
        [subView removeFromSuperview];
    }
    
    // reset the scroll view's content size to match the number of photos we will make
    [self.searchResultsBox setContentSize:CGSizeMake(320, 100*[photos count])];
    
    
    // traverse the photo array and create image views for each photo dictionary
    // add them as subviews to the scroll view at the appropriate offsets
    int i = 0;
    
    for (NSMutableDictionary *photo in photos) {
        INETImageView* temp = [[INETImageView alloc] initWithURL:[NSURL URLWithString:[[[photo objectForKey:@"images"] objectForKey:@"low_resolution"] objectForKey:@"url"]] andFrame:CGRectMake(0, 100 * i, 100, 100)];
        
        [self.searchResultsBox addSubview:temp];
        
        ++i;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    UIImage *logo = [UIImage imageWithContentsOfFile:@"instaLogo.jpg"];

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
