//
//  main.m
//  CaesarCipher
//
//  Created by Michael Kavouras on 6/21/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaesarCipher : NSObject

- (NSString *)encode:(NSString *)string offset:(int)offset;
- (NSString *)decode:(NSString *)string offset:(int)offset;

//Being amateur codebreakers, we want to know if two distinct looking ciphers correspond to the same input message. Write a method called codeBreaker, which accepts two cipher strings as paramaters and returns a boolean value which tells us whether they are actually the same input message encoded using two different offsets.

- (BOOL) codeBreaker:(NSString *) string1 with:(NSString *) string2;

@end


@implementation CaesarCipher

- (NSString *)encode:(NSString *)string offset:(int)offset {
    if (offset > 25) {
        NSAssert(offset < 26, @"offset is out of range. 1 - 25");
    }
    NSString *str = [string lowercaseString];
    unsigned long count = [string length];
    unichar result[count];
    unichar buffer[count];
    [str getCharacters:buffer range:NSMakeRange(0, count)];
    
    char allchars[] = "abcdefghijklmnopqrstuvwxyz";
    
    for (int i = 0; i < count; i++) {
        if (buffer[i] == ' ' || ispunct(buffer[i])) {
            result[i] = buffer[i];
            continue;
        }
        
        char *e = strchr(allchars, buffer[i]);
        int idx= (int)(e - allchars);
        int new_idx = (idx + offset) % strlen(allchars);
        
        result[i] = allchars[new_idx];
    }
    
    return [NSString stringWithCharacters:result length:count];
}

- (NSString *)decode:(NSString *)string offset:(int)offset {
    return [self encode:string offset: (26 - offset)];
}

- (BOOL) codeBreaker:(NSString *) string1 with:(NSString *) string2{

                                                                            //Loop through offset on first encoded input and decode
    for (int i = 1; i<25; i++) {
        NSString * decoded = [self decode:string1 offset:i];
                                                                            //Loop through offset on second encoded input and decode
        for (int j = 1; j < 25; j++) {
            NSString * decoded2 = [self decode:string2 offset:j];
            
            if ([decoded isEqualToString:decoded2]) {
                NSLog(@"%@ = '%@', offset: %d", string1, decoded, i);
                NSLog(@"%@ = '%@', offset: %d", string2, decoded2, j);
                return YES;
            }
            
        }
        
    }
    
    return NO;
    
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        CaesarCipher *decrypt = [[CaesarCipher alloc] init];
        [decrypt codeBreaker:@"okmg" with:@"tprl"];
        
    }
}