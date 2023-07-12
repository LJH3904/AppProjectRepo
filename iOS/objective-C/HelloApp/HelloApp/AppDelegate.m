//
//  AppDelegate.m
//  HelloApp
//
//  Created by LJh on 2023/07/12.
//

#import "AppDelegate.h"

@interface AppDelegate (){
  NSSpeechSynthesizer *speechSynth;
  
}

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
- (IBAction)sayHello:(id)sender;
@property (weak) IBOutlet NSTextField *messageLabel;

@end

@implementation AppDelegate
-(id)init{
  self = [super init];

  speechSynth = [[NSSpeechSynthesizer alloc]initWithVoice:nil];
  
  return self;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
  return YES;
}


- (IBAction)sayHello:(id)sender {
  
  //var message : String = textField...
  //참조타입의 변수는 생성할 때
  //포인터를 나타내는 *을 앞에 붙여 만든다.
  //_는 self 이다
    
  NSString *name = [self.textField stringValue];
  
  NSString *message = [[NSString alloc]initWithFormat:@"Hello %@ !", name];
  
  NSLog(@"Hello %@ !", message);
  
//  [_textField setStringValue: message ];
  [_messageLabel setStringValue: message];
  [speechSynth startSpeakingString:message];
  
  
  
}
@end
