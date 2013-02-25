//
//  Shader.fsh
//  TexLines
//
//  Created by Pat Smith on 25/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
