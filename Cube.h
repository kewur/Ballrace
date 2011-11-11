//
//  Cube.h
//  EG-TD
//
//  Created by Gurcan Yavuz on 10/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AbstractEntity.h"
#import "CommonOpenGL.h"

@class OpenGLTexture3D;

@interface Cube : AbstractEntity {
    
    Director *_sharedDirector;
    CGPoint size;
    float x;
	float y;
	float z;
    
    
    OpenGLTexture3D *texture;
}
@property (nonatomic, retain) OpenGLTexture3D *texture;

@property (nonatomic,assign) CGPoint	size;
@property float		x;
@property float		y;
@property float		z;

-(id)initWithPosition:(EGVertex3D)position withColor:(EGColor)color;
- (void)render;
@end
