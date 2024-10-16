//
//  Services.h
//  ReactiveCocoaObjectiveC
//
//  Created by Angelos Staboulis on 16/10/24.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "GenderModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface Services : NSObject
-(RACSignal *) createRequest:(NSString*) nameString;
@property NSDictionary *json;
@property GenderModel *model;

@end

NS_ASSUME_NONNULL_END
