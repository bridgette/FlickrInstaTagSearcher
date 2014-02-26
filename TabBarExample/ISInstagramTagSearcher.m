//
//  ISInstagramTagSearcher.m
//  InstaSearch
//
//  Created by Sasha Heinen on 9/18/13.
//  Copyright (c) 2013 William Tachau. All rights reserved.
//

#import "ISInstagramTagSearcher.h"

@implementation ISInstagramTagSearcher


// initializer
- (id) initWithTagQuery:(NSString *)query andTarget:(id)incomingTarget andAction:(SEL)incomingAction
{
    self = [super init];
    if (self) {
        self.target = incomingTarget;
        self.action = incomingAction;
        self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.instagram.com/v1/tags/%@/media/recent?client_id=52b557afb1c64d5aa7480bef6c368f3e", query]]] delegate:self];
        
    }
    return self;
}


// initialize the data object upon connection start
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.data = [[NSMutableData alloc] initWithCapacity:0];
    
}

// append data when it is received
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

// read json data, pass to the target using the action selector
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
        
    NSMutableDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:nil];
    
    [self.target performSelector:self.action withObject:dictionary];
    
    
}

@end
