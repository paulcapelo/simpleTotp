
# react-native-simple-totp

## Getting started

`$ npm install react-native-simple-totp --save`

### Mostly automatic installation

`$ react-native link react-native-simple-totp`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-simple-totp` and add `RNTotplibe.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTotplibe.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNTotplibePackage;` to the imports at the top of the file
  - Add `new RNTotplibePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-simple-totp'
  	project(':react-native-simple-totp').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-simple-totp/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      implementation project(':react-native-simple-totp')
  	```


## Usage
```javascript
import RNTotplibe from 'react-native-simple-totp';

const semilla = '2fa5fadoirute94594iruty3087e3adb4c' //clave
const tiempo = '90' // tiempo
const fecha = '2190-04-28 13:08:22' //fecha

const res = await totp.getTOTP(semilla, tiempo, fecha)

// TODO: What to do with the module?
RNTotplibe;
  
	// Referencias

	//https://www.programcreek.com/java-api-examples/?code=echo8795%2Freact-native-android-text-to-speech%2Freact-native-android-text-to-speech-master%2Fandroid%2Fsrc%2Fmain%2Fjava%2Fcom%2Fecho%2Freactandroidtts%2FRNAndroidTextToSpeechModule.java#
	
	//https://medium.com/wix-engineering/creating-a-native-module-in-react-native-93bab0123e46


```