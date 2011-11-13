//
//  EG_TDAppDelegate.m
//  EG-TD
//
//  Created by metin okur on 16.09.2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  hhh

#import "EG_TDAppDelegate.h"

#import "EAGLView.h"

#import "EG_TDViewController.h"
#import "SBJsonWriter.h"
@implementation EG_TDAppDelegate


@synthesize window=_window;
@synthesize menuViewController;

@synthesize facebook;
@synthesize mClient;
@synthesize viewController;
/////
-(void)fakeTimer{

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    // Override point for customization after application launch.
    ConnectedSFS = false;
    GameStarted = false;

    self.window.rootViewController = self.viewController;

   	//[NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(GameUpdate) userInfo:nil repeats:YES];
    self.viewController = [[EG_TDViewController alloc] initWithNibName:@"EG_TDViewController" bundle:nil];
    [self.window.rootViewController presentModalViewController:self.viewController animated:YES];


    return YES;
}
-(void)GameUpdate
{
    

}
- (void)onUserEnterRoom:(INFSmartFoxSFSEvent *)evt
{
   // NSLog(@"BIRISI GIRDI");
   
}
-(void) ConnectToFB
{

   
    facebook = [[Facebook alloc] initWithAppId:@"144988148933060" andDelegate:self];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    
    NSArray* permissions =  [[NSArray arrayWithObjects:
                              @"email", @"user_about_me", nil] retain];
    
    if (![facebook isSessionValid]) {
        
        [facebook authorize:permissions];
        
        
        
    }
 
    
    else
    {
        [self.window.rootViewController presentModalViewController:self.viewController animated:YES];
    }
    
    
}

- (void)fbDidLogin {
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    
    [self.window.rootViewController presentModalViewController:self.viewController animated:YES];

}

-(void) onObjectReceived:(INFSmartFoxSFSEvent *)evt
{
   
    if([evt.params objectForKey:@"_cmd"] == @"start")
    {

        
    }
    
    
    
}
- (void)handleMessage:(id)msgObj type:(NSString *)type delegate:(id <INFSmartFoxISFSEvents>)delegate
{

}
- (void)onPublicMessage:(INFSmartFoxSFSEvent *)evt
{
  

}

-(void) onJoinRoom:(INFSmartFoxSFSEvent *)evt
{

    
    NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"10",@"x",@"23",@"y",@"11",@"z", nil];

    [mClient sendXtMessage:@"bb" cmd:@"ready" paramObj:dic type:@"xml" roomId:[mRoom getId]];
    
}



-(void) onLogin:(INFSmartFoxSFSEvent *)evt
{
      
    if ([[evt.params objectForKey:@"success"] boolValue])
    {
      
    }
    else
    {
      
    }
    
    
    
}

-(void) onExtensionResponse:(INFSmartFoxSFSEvent *)evt
{
    NSLog(@"EXTENSION RESPONSE");
    if ([[[evt.params objectForKey:@"dataObj"] objectForKey:@"_cmd"] isEqualToString:@"start"])
    {
      //  
         NSLog(@"SERVERDAN OYUNA BASLA KOMUTU GELDI");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"startTheGame" object:self];
        [mClient sendXtMessage:@"bb" cmd:@"started" paramObj:nil type:@"str" roomId:[mRoom getId]];
        GameStarted = YES;
    }
    else if([[[evt.params objectForKey:@"dataObj"] objectForKey:@"_cmd"] isEqualToString:@"upd"])
    {
     //   NSLog(@"UPDATE %@",evt.params);
    
    }

}
 -(void)strReceived:(NSString *)msg
{
   

}
-(void) onRoomListUpdate:(INFSmartFoxSFSEvent *)evt
{
    NSArray* roomList = [[evt.params objectForKey:@"roomList"] allValues];

    self->mRoom = [roomList objectAtIndex:0];
    [mClient joinRoom:[self->mRoom getName] pword:@"" isSpectator:NO dontLeave:NO oldRoom:NO];
    
    
}

-(void)login:(NSString *)loginName {
    
    //NSLog(@"loginName %@",loginName   );
	[mClient login:@"ballrace" name:loginName pass:@""];
	
	INFSmartFoxRoom *room;
	for (id roomId in [mClient getAllRooms]) {
		room = [[mClient getAllRooms] objectForKey:roomId];
		//NSLog(@"Room name is: %@",[room getName]);
	}
    
}



-(void) ConnectToSFS:(NSString*) UserId
{
    
    self->mUserID = [[NSString stringWithFormat:@"u%s", [UserId UTF8String]] retain]; 
   // NSLog(@"USER %@",self->mUserID);
    if(ConnectedSFS == false)
    {
      
        [INFSmartFoxObjectSerializer setDebug:YES];
        
        mClient = [[INFSmartFoxiPhoneClient iPhoneClient:YES delegate:self] retain];
        
        [mClient loadConfig:@"config" autoConnect:YES]; 
    }
       
}

- (void)onConnection:(INFSmartFoxSFSEvent *)evt {
    
   // NSLog(@"OLDUMU");
	//Enable the login button and the textfield
	if ([[evt.params objectForKey:@"success"] boolValue]) {
		//view.connectLabel.text = @"Connected, please login";
		//view.loginButton.enabled = YES;
		//view.loginTextField.enabled = YES;
      //  [[evt params] objectForKey:]
        NSLog(@" CONNECTION SUCCESS");
        [self login:self->mUserID];
	}
	else {				
        //NSLog(@"OLMADI");
        [mClient loadConfig:@"config" autoConnect:YES];
        //  [mClient login:@"simpleChat" name:loginName pass:@""];
		//view.connectLabel.text = [NSString stringWithFormat:@"Connection error: %@", [evt.params objectForKey:@"error"]];
	}
}

- (void)onConnectionLost:(INFSmartFoxSFSEvent *)evt
{
	NSLog(@"onConnectionLost");
	
    //Disable textfield and button until connected!
	//view.loginTextField.enabled = NO;
	//view.loginButton.enabled = NO;	
    ConnectedSFS = false;
    //Retry connection
	[mClient loadConfig:@"config" autoConnect:YES];
}



- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    //[self.viewController startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    //[self.viewController stopAnimation];
}

- (void)dealloc
{
    [_window release];
    //[_viewController release];
    [super dealloc];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    // [self.viewController stopAnimation];
}





@end
