//
//  MSymbol.m
//  Maths
//
//  Created by Pat Smith on 18/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import <OpenGLES/ES2/glext.h>
#import "MSymbol.h"

@interface MSymbol ()
{
    GLuint _position;
    GLuint _array;
    GLuint _buffer;
}

@end
@implementation MSymbol

- (id)initWithPos:(GLuint)position
{
    self = [super initWithPos:position];
    if (self) {
        _vertex_count = 13;
        // 0
        self.vertices[ 0] = GLKVector2Make(0.0f, 0.1f);
        self.vertices[ 1] = GLKVector2Make(0.1f, 0.0f);
        self.vertices[ 2] = GLKVector2Make(0.2f, 0.1f);
        self.vertices[ 3] = GLKVector2Make(0.2f, 0.3f);
        self.vertices[ 4] = GLKVector2Make(0.0f, 0.1f);
        self.vertices[ 5] = GLKVector2Make(0.0f, 0.3f);
        self.vertices[ 6] = GLKVector2Make(0.1f, 0.4f);
        self.vertices[ 7] = GLKVector2Make(0.2f, 0.3f);
        
        
        // 1
        self.vertices[ 8] = GLKVector2Make(0.0f, 0.3f);
        self.vertices[ 9] = GLKVector2Make(0.1f, 0.4f);
        self.vertices[10] = GLKVector2Make(0.1f, 0.0f);
        self.vertices[11] = GLKVector2Make(0.0f, 0.0f);
        self.vertices[12] = GLKVector2Make(0.2f, 0.0f);
        
        
        [self setupGL];
    }
    return self;
}

- (void)setupGL
{
    glGenVertexArraysOES(1, &_array);
    glBindVertexArrayOES(_array);
    glGenBuffers(1, &_buffer);
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLKVector2)*self.vertex_count, self.vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(_position);
    glVertexAttribPointer(_position, 2, GL_FLOAT, GL_FALSE, 8, 0);
    
    glBindVertexArrayOES(0);

}
- (void)render
{
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBindVertexArrayOES(_array);
    glLineWidth(1.0f);
    //glDrawArrays(GL_LINE_STRIP, 0, self.vertex_count);
    glDrawArrays(GL_LINE_STRIP, 8, 5);
}

@end
