//
//  Cal.m
//  Lab15
//
//  Created by LJh on 2023/07/13.
//

#import <Foundation/Foundation.h>
//구현부
#import "Cal.h"
//헤더 불러오기

@implementation Cal

  

- (int)plus:(int)number1 with:(int)number2 {
  int result = number1 + number2;
  return result;
}

- (int)minus:(int)number1 with:(int)number2 {
  int result = number1 - number2;
  return result;
}

- (int)multiply:(int)number1 with:(int)number2 {
  int result = number1 * number2;
  return result;
}

- (int)divide:(int)number1 with:(int)number2 {
  int result = number1 / number2;
  return result;
}

@end
