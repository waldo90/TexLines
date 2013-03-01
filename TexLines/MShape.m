//
//  MShape.m
//  Maths
//
//  Created by Pat Smith on 17/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MShape.h"

@interface MShape ()

@property(strong)   NSMutableData*  vertexData;

@end

@implementation MShape

- (id)initWithPos:(GLuint)position
{
    self = [super init];
    if (self) {
        _position = position;
        _vertex_count = 0;
    }
    return self;
}

- (GLKVector2*)vertices
{
    if (_vertexData == nil) {
        _vertexData = [NSMutableData
                       dataWithLength:sizeof(GLKVector2)*self.vertex_count];
    }
    return [_vertexData mutableBytes];
}

-(int)vertex_count
{
    return _vertex_count;
}

- (void)render
{
    return;
}
@end
