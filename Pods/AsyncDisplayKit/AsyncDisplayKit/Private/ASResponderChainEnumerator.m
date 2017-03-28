//
//  ASResponderChainEnumerator.m
//  AsyncDisplayKit
//
//  Created by Adlai Holler on 2/13/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "ASResponderChainEnumerator.h"

@implementation ASResponderChainEnumerator {
  UIResponder *_currentResponder;
}

- (instancetype)initWithResponder:(UIResponder *)responder
{
  if (self = [super init]) {
    _currentResponder = responder;
  }
  return self;
}

#pragma mark - NSEnumerator

- (id)nextObject
{
  id result = [_currentResponder nextResponder];
  _currentResponder = result;
  return result;
}

@end

@implementation UIResponder (ASResponderChainEnumerator)

- (NSEnumerator *)asdk_responderChainEnumerator
{
  return [[ASResponderChainEnumerator alloc] initWithResponder:self];
}

@end
