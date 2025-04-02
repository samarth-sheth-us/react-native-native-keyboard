#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(NativeKeyboardManager, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(onTextChange, RCTBubblingEventBlock)

@end
