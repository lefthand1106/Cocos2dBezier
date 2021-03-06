//
//  HelloWorldLayer.m
//  Cocos2dBezier
//
//  Created by 篠原正樹 on 2014/04/29.
//  Copyright masakishinohara 2014年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

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

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
	
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"A" fontName:@"Marker Felt" fontSize:30];
        label1.position = CGPointMake(50, winSize.height / 2);
        [self addChild:label1];
        
        
        [CCMenuItemFont setFontName:@"Helvetica-BoldOblique"];
        [CCMenuItemFont setFontSize:30];
        CCMenuItemFont * item = [CCMenuItemFont itemWithString:@"action" block:^(id sender)
        {
            ccBezierConfig bezier;
            
            bezier.controlPoint_1 = CGPointMake(winSize.width / 4, winSize.height);
            bezier.controlPoint_2 = CGPointMake(winSize.width - 50, winSize.height / 2);
            bezier.endPosition = CGPointMake(winSize.width - 50, winSize.height / 2);
            
            CCBezierTo * bezierTo = [CCBezierTo actionWithDuration:5 bezier:bezier];
            [label1 runAction:bezierTo];
        } ];
                                 CCMenu * menu = [CCMenu menuWithItems:item, nil];
                                 menu.position = CGPointMake(winSize.width / 2, 60);
                                 [self addChild:menu];
        
    }
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
