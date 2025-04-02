import { useState } from 'react';
import { View, Text } from 'react-native';
import { NativeKeyboardView } from 'react-native-native-keyboard'; // Import your package

const App = () => {
  const [text, setText] = useState('');

  return (
    <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
      <Text style={{ fontSize: 24, marginBottom: 20 }}>Enter Search</Text>

      {/* Native Keyboard Component */}
      <NativeKeyboardView
        style={{ width: 400, height: 50 }}
        onTextChange={(event) => setText(event.nativeEvent.text)}
      />

      {/* Display the entered text */}
      <Text style={{ fontSize: 18, marginTop: 20 }}>You entered: {text}</Text>
    </View>
  );
};

export default App;
