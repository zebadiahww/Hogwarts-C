//
//  ZWWCharacter.m
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "ZWWCharacter.h"

static NSString * const kName = @"name";
static NSString * const kHouse = @"house";
static NSString * const kBloodStatus = @"bloodStatus";
static NSString * const kDeathEater = @"deathEater";
static NSString * const kRole = @"role";

@implementation ZWWCharacter

- (ZWWCharacter *)initWithName:(NSString *)name house:(NSString *)house bloodStatus:(NSString *)bloodstatus deathEater:(BOOL)deathEater role:(NSString *)role
{
    if (self = [super init])
    {
        //initialize self
        _name = name;
        _house = house;
        _bloodStatus = bloodstatus;
        _deathEater = deathEater;
        _role = role;
    }
    return self;
}

@end

@implementation ZWWCharacter  (JSONConvertible)

-(instancetype) initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    // let name = dicionary["name"]
    
    NSString *name = dictionary[kName];
    NSString *house = dictionary[kHouse];
    NSString *bloodStatus = dictionary[kBloodStatus];
    BOOL deathEater = [dictionary[kDeathEater] boolValue]; //assessment
    NSString *role = dictionary[kRole];
    
    return [self initWithName:name house:house bloodStatus:bloodStatus deathEater:deathEater role:role];
}

@end
