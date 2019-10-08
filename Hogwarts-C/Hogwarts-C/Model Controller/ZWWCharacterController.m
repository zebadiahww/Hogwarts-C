//
//  ZWWCharacterController.m
//  Hogwarts-C
//
//  Created by Zebadiah Watson on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "ZWWCharacterController.h"

static NSString * const kBaseURLString = @"https://www.potterapi.com/v1/";
static NSString * const kCharacterString = @"characters";
static NSString * const kApiKeyKey = @"key";
static NSString * const kApiKeyValue = @"$2a$10$A6c2AwWLLXykbvxGHFuxiu6kcdQLzHcuMIuYKpTurFB0JT80P3t0m";

@implementation ZWWCharacterController

+ (instancetype)sharedInstance
{
    static ZWWCharacterController * sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        sharedController = [ZWWCharacterController new];
    });
    return sharedController;
    
}

+ (void)fetchCharacters:(void (^)(NSArray<ZWWCharacter *> * _Nullable))completion
{
    
    NSURL *baseUrl = [NSURL URLWithString:kBaseURLString];
    NSURL *characterUrl = [baseUrl URLByAppendingPathComponent:kCharacterString];
    
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:kApiKeyKey value:kApiKeyValue];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:characterUrl resolvingAgainstBaseURL:true];
    
    components.queryItems = @[apiKey];
    
    NSURL *finalUrl = components.URL;
    // Step 1. Build URL
    // Base URL =
    //Component =
    //Query Item =
    
    //Step 2. start the dataTask -
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //check the error
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        //handle the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        //handle the data
        if (data)
        {
            //handle if something went wrong
            NSDictionary * TopLevelDictionary = [NSJSONSerialization
                                                  JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (!TopLevelDictionary)
            {
                NSLog(@"error parsing JSON %@", error);
                completion(nil);
                return;
            }
            //Create a landing zone for the characters
            NSMutableArray *characterArray = [NSMutableArray new];
            for(NSDictionary * characterDictionary in TopLevelDictionary)
            {
                //loop thru the TLD and init each dictionary
                ZWWCharacter * character = [[ZWWCharacter alloc] initWithDictionary:characterDictionary];
                [characterArray addObject:character];
            }
            //complete with that array of character
            completion(characterArray);
        }
    }]resume];
}

@end
