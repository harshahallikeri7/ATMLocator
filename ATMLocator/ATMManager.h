//
//  ATMManager.h
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "ATMManagerDelegate.h"
#import "ATMCommunicatorDelegate.h"

@class ATMCommunicator;

@interface ATMManager : NSObject<ATMCommunicatorDelegate>
@property (strong, nonatomic) ATMCommunicator *communicator;
@property (weak, nonatomic) id<ATMManagerDelegate> delegate;

- (void)fetchListsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end
