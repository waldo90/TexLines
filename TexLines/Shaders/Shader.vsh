//
//  Shader.vsh
//  Maths
//
//  Created by Pat Smith on 15/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//


attribute vec4 position;
attribute vec2 texcoordIn;
//attribute vec4 color;
//attribute vec3 normal;

uniform vec4 color;

varying lowp vec4 colorVarying;

uniform mat4 modelViewProjectionMatrix;
//uniform mat3 normalMatrix;


varying vec2 texcoordOut;

void main()
{

    colorVarying = color;
    
    texcoordOut = texcoordIn;
    gl_Position = modelViewProjectionMatrix * position;
}
