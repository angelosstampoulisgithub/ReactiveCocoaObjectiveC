//
//  Services.m
//  ReactiveCocoaObjectiveC
//
//  Created by Angelos Staboulis on 16/10/24.
//

#import "Services.h"

@implementation Services
- (instancetype)init
{
    self = [super init];
    if (self) {
        _model = [[GenderModel alloc] init];
    }
    return self;
}
-(RACSignal *) createRequest:(NSString*) nameString{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString  *parameter = [NSString stringWithFormat:@"https://api.genderize.io/?name=%@",nameString];
        NSURL *urlMain = [[NSURL alloc] initWithString:parameter];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlMain];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self->_json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
            [self->_model setName:self->_json[@"name"]];
            [self->_model setGender:self->_json[@"gender"]];
            [self->_model setProbability:self->_json[@"probability"]];
            [subscriber sendNext:self->_model];
            [subscriber sendCompleted];
        }];
        [dataTask resume];
        return [RACDisposable disposableWithBlock:^{
                   [dataTask cancel];
        }];
    }];
   
}
@end
