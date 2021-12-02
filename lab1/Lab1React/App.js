import React from 'react';
import type {Node} from 'react';
import {
  SafeAreaView,
  ScrollView,
  StyleSheet,
  Text,
  View,
  Image,
  Button,
  TextInput,
  Alert,
} from 'react-native';

const CustomButton = ( {title}): Node => {
  return (
    <View style={{ padding: 10 }}>
      <Button
        title={title}
        color={Colors.accent2}
        onPress={() => Alert.alert('This button does nothing')}
      />
    </View>
  );
};

const App: () => Node = () => {
  return (
    <SafeAreaView style={{flex: 1}}>
      <ScrollView
        contentInsetAdjustmentBehavior="automatic"
        style={styles.titleText}>
        {/* Title top bar */}
        <View style={{ backgroundColor: Colors.accent2, aspectRatio: 8, padding: 10 }}>
            <Text style={ styles.titleText }>Example 1 - React Native</Text>
        </View>
        
        {/* Content below title bar */}
        <View style={{ width: "100%" }}>
          <View style={{ padding: 10, alignItems: "center", justifyContent: "center" }}>
              <Image
                  source={{uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'}}
                  style={{ width: "100%", aspectRatio: 1.78 }}/>
          </View>

          {/* Column with rows of buttons */}
          <View style={{ alignItems: "center" }}>
            <View style={{ flexDirection: "row" }}>
              <CustomButton title="Button"/>
              <CustomButton title="Button"/>
            </View>

            <View style={{ flexDirection: "row" }}>
              <CustomButton title="Button"/>
              <CustomButton title="Button"/>
            </View>
          </View>

          {/* Row email form */}
          <View style={{ alignItems: "center", justifyContent: "center", flexDirection: "row" }}>
            <Text style={ styles.formText }>Email: </Text>
            <TextInput
              style={styles.textInput}
              autoCapitalize="none"
              autoCompleteType="email"
            />
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  titleText: {
    fontSize: 25,
    fontWeight: 'bold',
    color: 'white'
  },
  formText: {
    fontSize: 18,
    color: 'white'
  },
  textInput: {
    alignSelf: 'stretch',
    width: '60%',
    borderBottomColor:'#000',
    borderBottomWidth: 1,
  },
});

const Colors = {
  accent1: 'hsl(160, 100%, 50%)',
  accent2: 'hsl(170, 100%, 25%)',
};

export default App;
