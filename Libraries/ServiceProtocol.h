//
//  ServiceProtocol.h
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceTypes.h"

@protocol ServiceProtocolDelegate <NSObject>
@required

-(void) fetchEnd:(enum ServiceType)ServiceID result:(NSDictionary *)result;
-(void) fetchError:(enum ServiceType)ServiceID;

@end
