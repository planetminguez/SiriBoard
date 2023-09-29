#import <UIKit/UIKit.h>
%subclass SiriIcon : SBApplicationIcon
- (void)launch {
	if ([%c(SBAssistantController) preferenceEnabled]) {
		[[UIApplication sharedApplication] activateAssistantWithOptions:nil withCompletion:nil];
	} else {
  		SBVoiceControlAlert *alert = [%c(SBVoiceControlAlert) pendingOrActiveAlert];
		if (alert) {
			[alert cancel];
		}
		if ([%c(SBVoiceControlAlert) shouldEnterVoiceControl]) {
			alert = [[%c(SBVoiceControlAlert) alloc] initFromMenuButton];
			[alert _workspaceActivate];
			[alert release];
		}
	}
}
- (id)displayName {
	if ([%c(SBAssistantController) preferenceEnabled]) {
  		return @"SiriBoard";
  	} else { return @"VoiceControl"; }
}
%end