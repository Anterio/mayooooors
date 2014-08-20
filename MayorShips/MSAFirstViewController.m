//
//  MSAFirstViewController.m
//  MayorShips
//
//  Created by Arthur Boia on 8/19/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.

#import "MSAFirstViewController.h"
#import "MSARequest.h"
#import <CoreLocation/CoreLocation.h>
#import "MSATableViewCell.h"

@interface MSAFirstViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@end

@implementation MSAFirstViewController
{
    NSArray * mayorships;
    
    CLLocationManager * locationManager;
    
    UIActivityIndicatorView *activity;
    
    UILabel* mayorName;
    
    UIImageView* mayorImage;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mayorList.backgroundColor = [UIColor darkGrayColor];
    
    activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    activity.frame = CGRectMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, 0, 0);
    
    [activity startAnimating];
    [self.view addSubview:activity];
    
    self.mayorList.dataSource = self;
    self.mayorList.delegate = self;
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    [locationManager startUpdatingLocation];
    
   
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = locations [0];
    
    [locationManager stopUpdatingLocation];
    
  // mayorships = [MSARequest findMayorshipsWithLocation:location];
    
    [MSARequest findMayorshipsWithLocation:location completion:^(NSArray * mayors)
    {
        mayorships = mayors;
        [self.mayorList reloadData];
    }];
    [self.mayorList reloadData];
    
    [activity stopAnimating];
    [activity removeFromSuperview];

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mayorships.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [self.mayorList dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSDictionary * mayor = mayorships[indexPath.row];
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"https://irs2.4sqi.net/img/user/100x100%@", mayor[@"user"][@"photo"][@"suffix"]]];
    
    NSString * documentDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    
    NSString * filePath = [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", mayor [@"user"][@"id"]]];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if (!fileExists)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),  ^{
            
            cell.textLabel.text = mayor[@"user"][@"firstName"];
            
            
            NSData * data = [NSData dataWithContentsOfURL:url];
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                cell.imageView.image = [UIImage imageWithData:data];
                
                [data writeToFile:filePath atomically:YES];
                
            });
        });
            
    }
    
    else
    {
        cell.imageView.image = [UIImage imageWithContentsOfFile:filePath];
    }
    
    

    
    
        return cell;
}


-(void)stopAnimating
{
    
}

@end
