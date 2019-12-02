import React, { Component } from 'react';
import { Text, StyleSheet, View, ScrollView, Image, Button, Alert, TextInput } from 'react-native';

const styles = StyleSheet.create({
  titleText: {
    fontSize: 25,
    fontWeight: 'bold',
    color: 'white'
  },
  formText: {
    fontSize: 18,
    color: 'gray'
  },
  scrollView: {
    alignItems: "center"
  }
});

export default class AwesomeProjectApp extends Component {
  render() {
    let pic = {
        uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'
    };

    return (
    <ScrollView
      contentContainerStyle="scrollView"
      keyboardDismissMode="none"
    >
      {/* Title top bar */}
      <View style={{ width: "100%", aspectRatio: 8, paddingLeft: 10, paddingBottom: 10, justifyContent: "flex-end", backgroundColor: 'rgb(80, 160, 140)' }}>
          <Text style={ styles.titleText }>Example 1</Text>
      </View>

      {/* Content below title bar */}
      <View style={{ width: "100%" }}>
        {/* Middle flexbox containing image */}
        <View style={{ padding: 10, alignItems: "center", justifyContent: "center" }}>
            <Image source={pic} style={{ width: "100%", aspectRatio: 1.78 }}/>
        </View>

        {/* Vertical flexbox containing all buttons */}
        <View style={{ alignItems: "center" }}>
          {/* Horizontal flexbox containing a row of buttons */}
          <View style={{ flexDirection: "row" }}>
            <View style={{ padding: 10 }}>
              <Button
                title="Button"
                color="#505050"
                onPress={() => Alert.alert('This button does nothing')}
              />
            </View>
            <View style={{ padding: 10 }}>
              <Button
                title="Button"
                color="#505050"
                onPress={() => Alert.alert('This button does nothing')}
              />
            </View>
          </View>
          {/* Horizontal flexbox containing a row of buttons */}
          <View style={{ flexDirection: "row" }}>
            <View style={{ padding: 10 }}>
              <Button
                title="Button"
                color="#505050"
                onPress={() => Alert.alert('This button does nothing')}
              />
            </View>
            <View style={{ padding: 10 }}>
              <Button
                title="Button"
                color="#505050"
                onPress={() => Alert.alert('This button does nothing')}
              />
            </View>
          </View>
        </View>

        {/* Vertical flexbox containing email form */}
        <View style={{ margin: 20, height: 40, alignItems: "flex-end", justifyContent: "center", flexDirection: "row" }}>
          <Text style={ styles.formText }>Email: </Text>
          <TextInput
            style={{ width: "80%", backgroundColor: 'gray', borderColor: 'red' }}
            autoCapitalize="none"
            autoCompleteType="email"
          />
        </View>
      </View>
    </ScrollView>
    );
  }
}
