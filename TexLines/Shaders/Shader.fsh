//
//  Shader.fsh
//  TexLines
//
//  Created by Pat Smith on 25/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

varying lowp vec4 colorVarying;

varying lowp vec2 texcoordOut;
uniform sampler2D texture;

void main()
{
    gl_FragColor = colorVarying * texture2D(texture, texcoordOut);
    //gl_FragColor = colorVarying;
}

