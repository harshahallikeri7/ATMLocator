//
//  ATMCommunicatorDelegate.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol ATMCommunicatorDelegate
- (void)receivedListsJSON:(NSData *)objectNotation;
- (void)fetchingListsFailedWithError:(NSError *)error;
@end