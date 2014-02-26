//
//  INETImageView.m
//  IImageTest
//
//  Created by Patrick McNally on 9/16/13.
//  Copyright (c) 2013 Pomona College. All rights reserved.
//

#import "INETImageView.h"

@implementation INETImageView

// basic initializer, doesn't preload an image
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // initialization code here
    }
    return self;
}

// initializer, starts with an image url
- (id)initWithURL:(NSURL *)url andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:url] delegate:self];
    }
    return self;
}

- (void)requestImage
{
    if (self.connection) {
        [self.connection start];
    }
}

// request a new Image with a url
- (void)requestImageWithURLFromString:(NSString *)url
{
    // stop previous connection, if it exists
    if (self.connection) {
        [self.connection cancel];
    }
    
    // create new connection
    self.connection = [[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] delegate:self];
    
    if (self.connection) {
        [self.connection start];
    }
}

// upon successful connection start, create a fresh data object
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.webData = [[NSMutableData alloc] initWithCapacity:0];
}

// append new data as it arrives
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (self.webData == nil) {
        self.webData = [[NSMutableData alloc] initWithCapacity:0];
    }
    
    [self.webData appendData:data];
}

// when the connection finishes loading, set image of this view with the web data
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self setImage:[UIImage imageWithData:self.webData]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
