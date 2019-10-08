//
//  ZWWCharacterController.h
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWWCharacter.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZWWCharacterController : NSObject

//shared instance
+(instancetype)sharedInstance;



+(void)fetchCharacters: (void(^)(NSArray<ZWWCharacter *>* character))completion;


@end


NS_ASSUME_NONNULL_END
