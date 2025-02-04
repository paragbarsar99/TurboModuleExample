//
//  RCTNativeLocalStorage.h
//  TurboModuleExample
//
//  Created by parag on 02/02/25.
//

#import <Foundation/Foundation.h>

#import <React/RCTBridgeModule.h>

#ifdef RCT_NEW_ARCH_ENABLED
#import <NativeLocalStorageSpec/NativeLocalStorageSpec.h>
#endif

NS_ASSUME_NONNULL_BEGIN


#ifdef RCT_NEW_ARCH_ENABLED
@interface RCTNativeLocalStorage: NSObject<NativeLocalStorageSpec>
#else

@interface RCTNativeLocalStorage:NSObject<RCTBridgeModule>
#endif
@end
NS_ASSUME_NONNULL_END


