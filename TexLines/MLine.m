//
//  MLine.m
//  Maths
//
//  Created by Pat Smith on 23/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MLine.h"

@implementation MLine

- (id)initWithPos:(GLuint)position
{
    self = [super initWithPos:position];
    if (self) {
        _vertex_count = 16;
        self.vertices[ 0] = GLKVector2Make( 0.0f,-1.0f); // 1st vertex
        self.vertices[ 1] = GLKVector2Make( 0.0f, 0.0f); // 1st tex coord
        
        self.vertices[ 2] = GLKVector2Make( 1.0f,-1.0f); // 2nd vertex
        self.vertices[ 3] = GLKVector2Make( 1.0f, 0.0f); // 2nd tex coord
        
        self.vertices[ 4] = GLKVector2Make( 0.0f,-0.7f); // etc
        self.vertices[ 5] = GLKVector2Make( 0.0f, 0.5f);

        self.vertices[ 6] = GLKVector2Make( 1.0f,-0.7f);
        self.vertices[ 7] = GLKVector2Make( 1.0f, 0.5f);

        self.vertices[ 8] = GLKVector2Make( 0.0f, 1.7f);
        self.vertices[ 9] = GLKVector2Make( 0.0f, 0.5f);

        self.vertices[10] = GLKVector2Make( 1.0f, 1.7f);
        self.vertices[11] = GLKVector2Make( 1.0f, 0.5f);

        self.vertices[12] = GLKVector2Make( 0.0f, 2.0f);
        self.vertices[13] = GLKVector2Make( 0.0f, 1.0f);
        
        self.vertices[14] = GLKVector2Make( 1.0f, 2.0f);
        self.vertices[15] = GLKVector2Make( 1.0f, 1.0f);
        

    }
    return self;
}

- (void)render
{
    glEnableVertexAttribArray(self.position);
    glVertexAttribPointer(self.position, 2, GL_FLOAT, GL_FALSE, 16, self.vertices);
    glLineWidth(32.0f);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, self.vertex_count/2);

}

-(void)setLineWithStart:(GLKVector2)start andEnd:(GLKVector2)end
{
    self.vertices[0] = start;
    self.vertices[2] = end;
}


@end
