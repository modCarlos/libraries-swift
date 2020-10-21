//
//  APIInterface.m
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIInterface.h"

#define Service2URL @"https://www.myApiURL.com/"

@implementation APIInterface

///Ejemplo de request
+(void)myRequestExampleWithData:(NSDictionary *)myData andDelegate:(NSObject<ServiceProtocolDelegate> *)delegate {

    ///
    /*
    [self AccessApiWith:dicParametros methodId:@"F13D239A-986F-4592-913A-09DF46C5FFEF" platform:@"IOS" andClassId:@"F0C56398-5321-4BA6-8597-8529508C5B9E" onSuccess:^(NSString * result)
     {
        NSError * serializeError;
        [delegate fetchEnd:TRANSFER_P2P result:[Helper jsonStringToDictionary:result error:serializeError]];
    } onError:^(NSError * error) {
        NSLog(@"BroxelAPI transfer p2p card con error %@",error);
        [delegate fetchError:TRANSFER_P2P];
     }];
     */
}

+(void)AccessApiWith:(NSDictionary *)details
            methodId:(NSString *)guidMetodo
            platform:(NSString *)platform
          andClassId:(NSString *)guidClase
           onSuccess:(void (^)(NSString *))successBlock
             onError:(void (^)(NSError *))errorBlock
{
    
    NSMutableDictionary *dicBase = [[NSMutableDictionary alloc] init];
    
    NSError *jsonError;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:dicBase options:NSJSONWritingPrettyPrinted error:&jsonError];
    NSString *dataToSend = [[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding];
    NSLog(@"BroxelAPI json request: %@", dataToSend);
    
    NSLog(@"url address %@", Service2URL);
    
    NSDictionary *headers = [NSDictionary dictionaryWithObjectsAndKeys:@"application/json", @"Content-Type", nil];
    NSLog(@"Headers %@", headers);
    
    
}

@end
