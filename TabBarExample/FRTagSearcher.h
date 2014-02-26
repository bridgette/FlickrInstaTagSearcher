//
//  FRTagSearcher.h
//  TabBarExample
//
//  Created by student on 2/11/14.
//  Copyright (c) 2014 Pomona College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FRTagSearcher : NSObject
@property NSURLConnection* connection;
@property NSMutableData* data;
@property id target;
@property SEL action;

- (id) initWithTagQuery:(NSString *)query andTarget:(id)incomingTarget andAction:(SEL)incomingAction;

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
