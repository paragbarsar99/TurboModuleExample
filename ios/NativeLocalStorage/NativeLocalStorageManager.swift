//
//  NativeLocalStorageImp.swift
//  TurboModuleExample
//
//  Created by parag on 04/02/25.
//

import Foundation

@objc(NativeLocalStorageManager)
class NativeLocalStorageManager: NSObject {
  
  private let localStorage: UserDefaults
  
  @objc init(suiteName: String = "RCTNativeLocalStorageKey") {
    
    self.localStorage = UserDefaults(suiteName: suiteName)!
  }
  
  @objc func getItem(forKey key: String) -> String? {
    
    return localStorage.string(forKey: key)
  }
  
  @objc func setItem(_ value: String, forKey key: String) {
    
    localStorage.set(value, forKey: key)
  }
  
  @objc func removeItem(forKey key: String) {
    
    localStorage.removeObject(forKey: key)
  }
  
  @objc func clear() {
    let keys = localStorage.dictionaryRepresentation().keys
    for key in keys {
      localStorage.removeObject(forKey: key)
    }
  }
}
