import {NativeModules} from 'react-native';

const isTurboModuleEnabled = global.__turboModuleProxy != null;

const NativeModule = isTurboModuleEnabled
  ? require('./NativeLocalStorage').default
  : NativeModules?.NativeLocalStorage; // Old Architecture fallback

function setItem(value: any, key: string) {
  if (!value || !key) {
    return;
  }
  NativeModule?.setItem(value, key);
}

function clearAll() {
  NativeModule?.clear();
}

function removeItem(key: string) {
  if (!key) {
    return;
  }
  NativeModule?.removeItem(key);
}

async function getItem(key: string): Promise<string> {
  const storedValue = await NativeModule?.getItem(key);
  return storedValue;
}

export {getItem, removeItem, setItem, clearAll};
