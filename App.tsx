import React from 'react';
import {SafeAreaView, StyleSheet, Text, TextInput, Button} from 'react-native';

import {clearAll, removeItem, getItem, setItem} from './specs/index';

// console.log(NativeLocalStorage?.removeItem, ' NativeLocalStorage');
const EMPTY = '<empty>';

function App(): React.JSX.Element {
  const [value, setValue] = React.useState<string | undefined>(undefined);

  const [editingValue, setEditingValue] = React.useState<string | undefined>(
    undefined,
  );

  React.useEffect(() => {
    get();
  }, []);

  function saveValue() {
    setItem(editingValue ?? EMPTY, 'myKey');
    setValue(editingValue);
  }

  function clear() {
    clearAll();
    setValue('');
  }

  function deleteValue() {
    removeItem('myKey');
    setValue('');
  }

  async function get() {
    const storedValue = await getItem('myKey');
    console.log(storedValue, ' getItem');
    setValue(storedValue);
  }

  return (
    <SafeAreaView style={{flex: 1, backgroundColor: 'white'}}>
      <Text style={styles.text}>
        Current stored value is: {value ?? 'No Value'}
      </Text>
      <TextInput
        placeholder="Enter the text you want to store"
        style={styles.textInput}
        onChangeText={setEditingValue}
      />
      <Button color={'red'} title="Save" onPress={saveValue} />
      <Button title="Delete" onPress={deleteValue} />
      <Button title="Clear" onPress={clear} />
      <Button title="get" onPress={get} />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  text: {
    margin: 10,
    fontSize: 20,
  },
  textInput: {
    margin: 10,
    height: 40,
    borderColor: 'black',
    borderWidth: 1,
    paddingLeft: 5,
    paddingRight: 5,
    borderRadius: 5,
  },
});

export default App;
