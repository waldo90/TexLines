//
//  MEdgeLine.m
//  TexLines
//
//  Created by Pat Smith on 28/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MEdgeLine.h"

@interface MEdgeLine ()
{
    GLuint _position;
    GLuint _colorSlot;
    
}
@property(strong)   NSMutableData*  vertexData;
@end

@implementation MEdgeLine

-(int)vertex_count
{
    return _vertex_count;
}

- (GLKVector4*)vertices
{
    if (_vertexData == nil) {
        _vertexData = [NSMutableData
                       dataWithLength:sizeof(GLKVector4)*self.vertex_count];
    }
    return [_vertexData mutableBytes];
}

- (id)initWithPos:(GLuint)position andColorSlot:(GLuint)colorSlot
{
    
/*
 . .  . .
 . .  . .
 
 
 
 
 
 
 
 . .  . .
 . .  . .
 
*/
    self = [super init];
    if (self) {
        glGenVertexArraysOES(1, &_array);
        glGenBuffers(1, &_buffer);
        _position = position;
        _colorSlot = colorSlot;
        _vertex_count = 16;
        
        self.vertices[ 0] = GLKVector4Make(0.0f, 0.0f, 0.0f, 0.0f); // v
        self.vertices[ 1] = GLKVector4Make(0.0f, 1.0f, 0.0f, 0.0f); // c
        
        self.vertices[ 2] = GLKVector4Make(0.0f, 2.0f, 0.0f, 0.0f);
        self.vertices[ 3] = GLKVector4Make(0.0f, 1.0f, 0.0f, 0.0f);
        
        self.vertices[ 4] = GLKVector4Make(0.2f, 0.0f, 0.0f, 0.0f);
        self.vertices[ 5] = GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
        
        self.vertices[ 6] = GLKVector4Make(0.2f, 2.0f, 0.0f, 0.0f);
        self.vertices[ 7] = GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
        
        self.vertices[ 8] = GLKVector4Make(0.8f, 0.0f, 0.0f, 0.0f);
        self.vertices[ 9] = GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
        
        self.vertices[10] = GLKVector4Make(0.8f, 2.0f, 0.0f, 0.0f);
        self.vertices[11] = GLKVector4Make(0.0f, 1.0f, 0.0f, 1.0f);
        
        self.vertices[12] = GLKVector4Make(1.0f, 0.0f, 0.0f, 0.0f);
        self.vertices[13] = GLKVector4Make(0.0f, 1.0f, 0.0f, 0.0f);
        
        self.vertices[14] = GLKVector4Make(1.0f, 2.0f, 0.0f, 0.0f);
        self.vertices[15] = GLKVector4Make(0.0f, 1.0f, 0.0f, 0.0f);
        [self setupGL];
    }
    return self;
}

- (void)setupGL
{
    glBindVertexArrayOES(_array);
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLKVector4)*self.vertex_count, self.vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(_position);
    glVertexAttribPointer(_position, 4, GL_FLOAT, GL_FALSE, 32, 0);
    glEnableVertexAttribArray(_colorSlot);
    glVertexAttribPointer(_colorSlot, 4, GL_FLOAT, GL_FALSE, 32, (GLvoid*)16);
    
    
    //    glBindVertexArrayOES(0);
    
}
- (void)render
{
    
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBindVertexArrayOES(_array);
    
    glEnableVertexAttribArray(_position);
    glEnableVertexAttribArray(_colorSlot);
    glVertexAttribPointer(_position, 4, GL_FLOAT, GL_FALSE, 32, 0);
    glVertexAttribPointer(_colorSlot, 4, GL_FLOAT, GL_FALSE, 32, (GLvoid*)16);
    
//    glActiveTexture(GL_TEXTURE0);
//    glBindTexture(GL_TEXTURE_2D, _texture.name);
    //glUniform1i(_textureUniform, 0);
    
    
    
    //glLineWidth(1.0f);
    //glDrawArrays(GL_LINE_STRIP, 0, self.vertex_count);
    glDrawArrays(GL_TRIANGLES, 0, self.vertex_count);
}

@end
