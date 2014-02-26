//
//  FRTagSearcher.m
//  TabBarExample
//
//  Created by student on 2/11/14.
//  Copyright (c) 2014 Pomona College. All rights reserved.
//

#import "FRTagSearcher.h"

@implementation FRTagSearcher
// initializer
- (id) initWithTagQuery:(NSString *)query andTarget:(id)incomingTarget andAction:(SEL)incomingAction
{
    self = [super init];
    if (self) {
        self.target = incomingTarget;
        self.action = incomingAction;
        self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=79643bc8a3c108c9d7426710a9e49c82&tags=%@&format=json&nojsoncallback=1", query]]] delegate:self];
        
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
