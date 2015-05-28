//
//  DetailViewController.m
//  BusChallenge
//
//  Created by Alex Santorineos on 5/27/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stopsAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *busRoutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *paceLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [self.dataDictionary objectForKey:@"cta_stop_name"];
    self.title = self.nameLabel.text;

    self.busRoutesLabel.text = [self.dataDictionary objectForKey:@"routes"];

    self.paceLabel.text = [self.dataDictionary objectForKey:@"inter_modal"];
    self.stopsAddressLabel.text = [self.dataDictionary objectForKey:@"stop_id"];
    NSLog(@"name label: %@", self.paceLabel.text);
}

@end
