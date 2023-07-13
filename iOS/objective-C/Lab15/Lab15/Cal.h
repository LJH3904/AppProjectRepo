//
//  Cal.h
//  Lab15
//
//  Created by LJh on 2023/07/13.
//


#import <Foundation/Foundation.h>
//선언부

@interface Cal : NSObject

- (int)plus:(int)number1 with:(int)number2;
- (int)minus:(int)number1 with:(int)number2;
- (int)multiply:(int)number1 with:(int)number2;
- (int)divide:(int)number1 with:(int)number2;

@end

