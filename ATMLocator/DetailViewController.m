//
//  DetailViewController.m
//  ATMLocator
//
//  Created by Harsha Hallikeri on 8/4/15.
//  Copyright (c) 2015 Harsha Hallikeri. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)list {
    if (_detailItem != list) {
        _detailItem = list;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.stateLabel.text = [self.detailItem state] ;
        self.locTypeLabel.text = [self.detailItem locType];
        self.nameLabel.text = [self.detailItem name];
        self.addressLabel.text = [self.detailItem address];
        self.cityLabel.text = [self.detailItem city];
        self.zipLabel.text = [self.detailItem zip];
        self.bankLabel.text = [self.detailItem bank];
        self.typeLabel.text = [self.detailItem type];
        self.atmsLabel.text = [[self.detailItem atms] stringValue];
        self.phoneLabel.text = [self.detailItem phone];
        self.distanceLabel.text = [[self.detailItem distance] stringValue];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
