//
//  MSAFirstViewController.m
//  MayorShips
//
//  Created by Arthur Boia on 8/19/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "MSAFirstViewController.h"
#import "MSARequest.h"
#import <CoreLocation/CoreLocation.h>

@interface MSAFirstViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@end

@implementation MSAFirstViewController
{
    NSArray * mayorships;
    
    CLLocationManager * locationManager;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
  //  locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
   
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = locations [0];
   [locationManager stopUpdatingLocation];
    mayorships = [MSARequest findMayorshipsWithLocation:location];
    [self.mayorList reloadData];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary * mayor = mayorships[indexPath.row];
    
    cell.textLabel.text = mayor[@"user"][@"firstName"];
    
    
    return cell;
}

@end
