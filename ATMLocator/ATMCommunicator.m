//
//  ATMCommunicator.m
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import "ATMCommunicator.h"
#import "ATMCommunicatorDelegate.h"

@implementation ATMCommunicator

- (void)searchListsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    
    //hardcode values are used which are given in the document
    coordinate.latitude = 40.147864;
    coordinate.longitude = -82.990959;
    
    //calling API given by chase
    NSString *urlAsString = [NSString stringWithFormat:@"https://m.chase.com/PSRWeb/location/list.action?lat=%f&lng=%f", coordinate.latitude, coordinate.longitude];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingListsFailedWithError:error];
        } else {
            [self.delegate receivedListsJSON:data];
        }
    }];
}

@end