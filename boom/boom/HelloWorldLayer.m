//
//  HelloWorldLayer.m
//  boom
//
//  Created by echo on 13. 3. 17..
//  Copyright echo 2013년. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

- (void) dealloc
{
	[super dealloc];
}

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super initWithColor:ccc4(255, 255, 255, 255)]) ) {
        CGSize size = [[CCDirector sharedDirector]winSize];
        self.isTouchEnabled = YES;
        Pad = [CCSprite spriteWithFile:@"pad.png"];
        Pad.anchorPoint = ccp(0.5,0.5);
        Pad.position  = Center = ccp(size.width*4/5,size.height*1/4);
        r = size.width/10;
        [self addChild:Pad];
        
	}
	return self;
}
-(void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog(@"touchBegan");
    return YES;
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint location = [self convertTouchToNodeSpace: touch];
    CGSize size = [[CCDirector sharedDirector]winSize];
    if([self distance:location OtherPoint:Center] < r)
        Pad.position = location;
    else
    {
        double _cos = (location.x - Center.x) / [self distance:location OtherPoint:Center];
        double _sin = (location.y - Center.y) / [self distance:location OtherPoint:Center];
        
        Pad.position = ccp(Center.x+r*_cos,Center.y+r*_sin);
    }
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGSize size = [[CCDirector sharedDirector]winSize];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    Pad.position = Center;
}
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}
-(double)distance:(CGPoint)pA OtherPoint:(CGPoint)pB
{
    return pow(pow((pA.x-pB.x), 2) + pow((pA.y-pB.y), 2) , 0.5);
}
@end
