//
//  MShape.h
//  Maths
//
//  Created by Pat Smith on 17/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//
// A 2d shape - unbuffered

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface MShape : NSObject
{
@protected
    int _vertex_count;
}
@property (readonly) GLuint      position;
@property (readonly) GLKVector2* vertices;
@property (readonly) int         vertex_count;

- (id)initWithPos:(GLuint)position;

- (void)render;

@end
