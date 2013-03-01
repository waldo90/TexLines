//
//  MEdgeLine.h
//  TexLines
//
//  Created by Pat Smith on 28/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface MEdgeLine : NSObject
{
@protected
    int _vertex_count;
    GLuint _array;
    GLuint _buffer;
}
//@property (readonly) GLuint      position;
@property (readonly) GLKVector4* vertices;
@property (readonly) int         vertex_count;

- (id)initWithPos:(GLuint)position andColorSlot:(GLuint)colorSlot;

- (void)render;

@end
