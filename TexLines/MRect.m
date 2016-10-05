//
//  MRect.m
//  TexLines
//
//  Created by Pat Smith on 26/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import <OpenGLES/ES2/glext.h>
#import "MRect.h"

@interface MRect ()
{
    GLuint _position;
    GLuint _textureSlot;
    GLuint _array;
    GLuint _buffer;
    GLKTextureInfo* _texture;
}
@end

@implementation MRect

- (id)initWithPos:(GLuint)position andTexSlot:(GLuint)texSlot
{
    self = [super initWithPos:position];
    if (self) {
        _textureSlot = texSlot;
        _vertex_count = 12;
        self.vertices[ 0] = GLKVector2Make(0.0f, 0.0f);
        self.vertices[ 1] = GLKVector2Make(0.0f, 0.0f);
        self.vertices[ 2] = GLKVector2Make(1.0f, 0.0f);
        self.vertices[ 3] = GLKVector2Make(1.0f, 0.0f);
        self.vertices[ 4] = GLKVector2Make(1.0f, 1.0f);
        self.vertices[ 5] = GLKVector2Make(1.0f, 1.0f);
        
        self.vertices[ 6] = GLKVector2Make(0.0f, 0.0f);
        self.vertices[ 7] = GLKVector2Make(0.0f, 0.0f);
        self.vertices[ 8] = GLKVector2Make(0.0f, 1.0f);
        self.vertices[ 9] = GLKVector2Make(0.0f, 1.0f);
        self.vertices[10] = GLKVector2Make(1.0f, 1.0f);
        self.vertices[11] = GLKVector2Make(1.0f, 1.0f);
        
    }
    return self;
}

- (void)setupGL
{
    /*
    NSError *error;
    NSString* texPath = [[NSBundle mainBundle] pathForResource:@"bloktex" ofType:@"png"];
    _texture = [GLKTextureLoader textureWithContentsOfFile:texPath options:nil error:&error];
    if (error) {
        NSLog(@"Error loading texture from image: %@",error);
    }
    */
    glGenVertexArraysOES(1, &_array);
    glBindVertexArrayOES(_array);
    glGenBuffers(1, &_buffer);
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLKVector2)*self.vertex_count, self.vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(_position);
    glVertexAttribPointer(_position, 2, GL_FLOAT, GL_FALSE, 16, 0);
    glEnableVertexAttribArray(_textureSlot);
    glVertexAttribPointer(_textureSlot, 2, GL_FLOAT, GL_FALSE, 16, (GLvoid*)8);
    
    
//    glBindVertexArrayOES(0);
    
}
- (void)render
{
    
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBindVertexArrayOES(_array);

    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, _texture.name);
    //glUniform1i(_textureUniform, 0);
        
    
    
    //glLineWidth(1.0f);
    //glDrawArrays(GL_LINE_STRIP, 0, self.vertex_count);
    glDrawArrays(GL_TRIANGLES, 0, 12);
}

@end
