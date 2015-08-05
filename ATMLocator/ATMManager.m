//
//  ATMManager.m
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import "ATMManager.h"
#import "ListBuilder.h"
#import "ATMCommunicator.h"

@implementation ATMManager
- (void)fetchListsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    [self.communicator searchListsAtCoordinate:coordinate];
}

#pragma mark - MeetupCommunicatorDelegate

- (void)receivedListsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *lists = [ListBuilder listsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingListsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveLists:lists];
    }
}

- (void)fetchingListsFailedWithError:(NSError *)error
{
    [self.delegate fetchingListsFailedWithError:error];
}
@end
