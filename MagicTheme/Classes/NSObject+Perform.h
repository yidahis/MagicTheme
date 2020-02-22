//
//  NSObject+Perform.h
//  appearance
//
//  Created by yidahis on 2020/2/21.
//  Copyright © 2020 fame.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Perform)
- (id)dy_performSelector:(SEL)aSelector withObjects:(NSArray*)objects;
@end

NS_ASSUME_NONNULL_END
