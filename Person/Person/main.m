//
//  main.m
//  Person
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person: NSObject

- (void)setName:(NSString *)name;
- (NSString *)name;

- (void)setCity:(NSString *)city;
- (NSString *)city;

- (void)setPhoneNumber:(NSString *)phoneNumber;
- (NSString *)phoneNumber;
- (BOOL)checkSameCity:(Person *) name;
- (Person*)registerChild;

@end

@implementation Person {
    NSString *_name;
    NSString *_phoneNumber;
    NSString *_city;
}

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)setCity:(NSString *)city {
    _city = city;
}

- (NSString *)city {
    return _city;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    _phoneNumber = phoneNumber;
}

- (NSString *)phoneNumber {
    return _phoneNumber;
}

- (BOOL)checkSameCity:(Person *) name{
    
    if ([name city] == _city) {
        return YES;
    }
    else{
        return NO;
    }

}

- (Person*)registerChild{
    Person* child = [[Person alloc]init];
    child.phoneNumber = _phoneNumber;
    child.city = _city;
    
    return child;

}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *Henna = [[Person alloc]init];
        [Henna setName: @"Henna"];
        [Henna setCity: @"New York"];
        [Henna setPhoneNumber: @"7187777777"];
        
        Person *Bob = [[Person alloc]init];
        [Bob setName: @"Bob"];
        [Bob setCity: @"New Jersey"];
        [Bob setPhoneNumber: @"7187777778"];
        
        Person *Clara = [[Person alloc]init];
        [Clara setName: @"Clara"];
        [Clara setCity: @"New York"];
        [Clara setPhoneNumber: @"7187774778"];
        
        BOOL hennaAndClara = [Henna checkSameCity:Clara];
        BOOL claraAndBob = [Clara checkSameCity:Bob];
        
        NSLog(@"%d %d", hennaAndClara, claraAndBob);
        
        
        //A Person has recently had a child, whose name is 'Abc'. Write a method called registerChild which takes 0 parameters and returns a new Person * instance represeting the child, which has the same phoneNumber and city as the parent.
        
        Person *Abc = [Henna registerChild];
        [Abc setName:@"Abc"];

        
        
    }
    return 0;
}
