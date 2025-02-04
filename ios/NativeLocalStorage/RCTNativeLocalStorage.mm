#import "RCTNativeLocalStorage.h"
#import "TurboModuleExample-Swift.h"  // Auto-generated Swift bridging header

static NSString *const RCTNativeLocalStorageKey = @"local-storage";

@interface RCTNativeLocalStorage()
@property (strong, nonatomic) NativeLocalStorageManager *localStorage;
@end

@implementation RCTNativeLocalStorage

RCT_EXPORT_MODULE(NativeLocalStorage)

- (instancetype)init {
  self = [super init];
  if (self) {
    _localStorage = [[NativeLocalStorageManager alloc] initWithSuiteName:RCTNativeLocalStorageKey];
  }
  return self;
}

#ifdef RCT_NEW_ARCH_ENABLED

// TurboModule Implementation (New Architecture)
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeLocalStorageSpecJSI>(params);
}

- (void)clear {
  [self.localStorage clear];
}

- (NSString * _Nullable)getItem:(NSString *)key {
  return [self.localStorage getItemForKey:key];
}

- (void)removeItem:(NSString *)key {
  [self.localStorage removeItemForKey:key];
}

- (void)setItem:(NSString *)value key:(NSString *)key {
  [self.localStorage setItem:value forKey:key];
}

#else

// Bridge-Based Implementation (Old Architecture)
RCT_EXPORT_METHOD(clear)
{
  [self.localStorage clear];
}

RCT_EXPORT_METHOD(getItem:(NSString *)key resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString *value = [self.localStorage getItemForKey:key];
  if (value) {
    resolve(value);
  } else {
    resolve([NSNull null]);  // Return null if no value found
  }
}

RCT_EXPORT_METHOD(removeItem:(NSString *)key)
{
  [self.localStorage removeItemForKey:key];
}

RCT_EXPORT_METHOD(setItem:(NSString *)value forKey:(NSString *)key)
{
  [self.localStorage setItem:value forKey:key];
}

#endif

@end
