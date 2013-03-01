//
//  MVBShape.m
//  Maths
//
//  Created by Pat Smith on 23/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MVBShape.h"


@implementation MVBShape

- (id)initWithPos:(GLuint)position
{
    self = [super initWithPos:position];
    if (self) {
        glGenVertexArraysOES(1, &_array);
        glGenBuffers(1, &_buffer);
    }
    return self;
}
@end
