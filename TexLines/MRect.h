//
//  MRect.h
//  TexLines
//
//  Created by Pat Smith on 26/02/2013.
//  Copyright (c) 2013 Pat Smith. All rights reserved.
//

#import "MVBShape.h"

@interface MRect : MVBShape

@property (strong, atomic) GLKTextureInfo* texture;
- (id)initWithPos:(GLuint)position andTexSlot:(GLuint)texSlot;
- (void)setupGL;

@end
