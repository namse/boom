//
//  HelloWorldLayer.h
//  boom
//
//  Created by echo on 13. 3. 17..
//  Copyright echo 2013년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "CCTouchDispatcher.h"
// HelloWorldLayer
@interface HelloWorldLayer : CCLayerColor
{
    CCSprite *Pad;
    CCSprite *Cha;
    CGPoint Center;
    double r;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(double)distance:(CGPoint)pA OtherPoint:(CGPoint)pB;
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event;
@end
