//
//  MyPointAnnotation.h
//  BusChallenge
//
//  Created by Alex Santorineos on 5/27/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MyPointAnnotation : MKPointAnnotation

@property NSDictionary *dataDictionary;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
