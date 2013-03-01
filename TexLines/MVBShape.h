//
//  MVBShape.h
//  Maths
//
//  Created by Pat Smith on 23/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//
// A shape with a vertex buffer

#import "MShape.h"



@interface MVBShape : MShape
{
    @protected
    GLuint _array;
    GLuint _buffer;

}
@end
