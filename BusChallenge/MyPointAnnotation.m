//
//  MyPointAnnotation.m
//  BusChallenge
//
//  Created by Alex Santorineos on 5/27/15.
//  Copyright (c) 2015 madApperz. All rights reserved.
//

#import "MyPointAnnotation.h"

@implementation MyPointAnnotation

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{

    self = [super init];


    if (self) {


        self.dataDictionary = dictionary;
    }
    return self;
}


@end
