//
//  MasterViewController.m
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ATMManager.h"
#import "DetailCell.h"
#import "ATMCommunicator.h"
#import "List.h"


@interface MasterViewController ()<ATMManagerDelegate, UITableViewDelegate, UITableViewDataSource>{

    NSArray *_lists;
    ATMManager *_manager;
}
@property (weak, nonatomic) CLLocationManager *locationManager;

@end

@implementation MasterViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[ATMManager alloc] init];
    _manager.communicator = [[ATMCommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    //notify if location is authorized
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startFetchingLists:)
                                                 name:@"kCLAuthorizationStatusAuthorized"
                                               object:nil];
    
    [_manager fetchListsAtCoordinate:self.locationManager.location.coordinate];
}


#pragma mark - Accessors

- (CLLocationManager *)locationManager
{
    if (_locationManager) {
        return _locationManager;
    }
    
    id appDelegate = [[UIApplication sharedApplication] delegate];
    if ([appDelegate respondsToSelector:@selector(locationManager)]) {
        _locationManager = [appDelegate performSelector:@selector(locationManager)];
    }
    return _locationManager;
}

#pragma mark - Notification Observer
- (void)startFetchingLists:(NSNotification *)notification
{
    [_manager fetchListsAtCoordinate:self.locationManager.location.coordinate];
}

#pragma mark - ATMManagerDelegate
- (void)didReceiveLists:(NSArray *)lists
{
    _lists = lists;
    [self.tableView reloadData];
}

- (void)fetchingListsFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}


#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    List *list = _lists[indexPath.row];
    [cell.nameLabel setText:list.name];
    [cell.cityLabel setText:list.city];
    [cell.addressLabel setText:list.address];
    [cell.locTypeLabel setText:list.locType];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        //if you need to pass data to the next controller do it here
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        List *list = _lists[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:list];
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
