//
//  PersonalInfo.m
//  MyFirstApp
//
//  Created by qburst on 27/06/16.
//  Copyright © 2016 qburst. All rights reserved.
//

#import "PersonalInfo.h"

@implementation PersonalInfo

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.website forKey:@"website"];
    [aCoder encodeObject:self.phoneno forKey:@"phoneno"];
    [aCoder encodeObject:self.imageData forKey:@"image"];
    [aCoder encodeObject:self.lattitude forKey:@"lattitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.email =[aDecoder decodeObjectForKey:@"email"];
        self.website = [aDecoder decodeObjectForKey:@"website"];
        self.phoneno = [aDecoder decodeObjectForKey:@"phoneno"];
        self.imageData = [aDecoder decodeObjectForKey:@"image"];
        self.lattitude = [aDecoder decodeObjectForKey:@"lattitude"];
        self.longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    return self;
}

@end