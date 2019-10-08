//
//  ZWWCharacter.h
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZWWCharacter : NSObject

//name, house, blood status, deathEater, role
@property(nonatomic, copy, readonly)NSString * name;
@property(nonatomic, copy, readonly, nullable)NSString * house;
@property(nonatomic, copy, readonly)NSString * bloodStatus;
@property(nonatomic, readonly)BOOL deathEater;
@property(nonatomic, copy, readonly)NSString * role;

// initizializer
-(ZWWCharacter *)initWithName:(NSString *)name
                        house:(NSString *)house
                  bloodStatus:(NSString *)bloodstatus
                   deathEater:(BOOL)deathEater
                         role:(NSString *)role;

@end

//extension
@interface ZWWCharacter (JSONConvertible)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
