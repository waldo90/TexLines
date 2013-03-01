//
//  MEllipse.m
//  Maths
//
//  Created by Pat Smith on 17/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MEllipse.h"

@interface MEllipse ()
{
    float _radiusX;
    float _radiusY;
}
@end

@implementation MEllipse

- (id)initWithPos:(GLuint)position
{
    self = [super initWithPos:position];
    if (self)
    {
        _vertex_count = M_ELLIPSE_RESOLUTION;
        [self setupGL];
    }
    return self;
}

- (float)bufferSize
{
    return sizeof(GLKVector2)*self.vertex_count;
}
- (void)setupGL
{
    glBindVertexArrayOES(_array);
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBufferData(GL_ARRAY_BUFFER, self.bufferSize, self.vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(self.position);
    glVertexAttribPointer(self.position, 2, GL_FLOAT, GL_FALSE, 8, 0);
}

-(void)render
{
    glBindBuffer(GL_ARRAY_BUFFER, _buffer);
    glBindVertexArrayOES(_array);
    glDrawArrays(GL_LINE_LOOP, 0, M_ELLIPSE_RESOLUTION);
}

-(void)updateVertices {
    for (int i = 0; i < M_ELLIPSE_RESOLUTION; i++){
        float theta = ((float)i) / M_ELLIPSE_RESOLUTION * M_TAU;
        self.vertices[i] = GLKVector2Make(cos(theta)*_radiusX, sin(theta)*_radiusY);
    }
    [self setupGL];
}

-(float)radiusX {
    return _radiusX;
}

-(void)setRadiusX:(float)radiusX {
    _radiusX = radiusX;
    [self updateVertices];
}

-(float)radiusY {
    return _radiusY;
}

-(void)setRadiusY:(float)radiusY {
    _radiusY = radiusY;
    [self updateVertices];
}
@end
