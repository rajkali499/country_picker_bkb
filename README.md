<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
## Features

-> This package is used for country, state, city, dial code picker
-> we can select the details with respective of other details and can be irrespective also. which means we can select the 
country , state, city alone by using search and if we use the country, state, city pickers together then It will show the data
dependent to that selected data. for Example If we choose country then the state and city will be loaded and will show the 
details of state and city inside that country. If we choose country and state both then the city details will be based on the 
country and state only

![](C:/Users/softsuave/Desktop/Screenshot_1670832771.png)![](C:/Users/softsuave/Desktop/Screenshot_1670832774.png)![](C:/Users/softsuave/Desktop/Screenshot_1670832759.png)![](C:/Users/softsuave/Desktop/Screenshot_1670832765.png)

## Getting started

-> add the following in your dependencies of pubspec.yaml file

    country_picker_bkb: version

-> run the following

    flutter pun get

-> import the package in the file you want to use

    import 'package:country_picker_bkb/country_picker_bkb.dart';

-> you can use the package in your project

## Usage

```dart
CountryPicker();
```

you can use this one as a widget for Country, state, city, dial code picker in a column or else you can use the following 
to use each alone

```dart
MobileNumberCode(required textEditingController);
Country();
StatePicker();
City();
```
the above will store the selected details in the following value Notifiers respectively;

```dart
ValueNotifier<Country_Model> selectedCountryDetailsForPhoneCode=ValueNotifier(Country_Model());

ValueNotifier<Country_Model> selectedDetailsForCountry=ValueNotifier(Country_Model());

ValueNotifier<State_Model> selectedDetailsForState=ValueNotifier(State_Model());

ValueNotifier<City_Model> selectedDetailsForCity=ValueNotifier(City_Model());
```

we can access the selected details by using the above variables


## Additional information

Refer the git for more details. you can use the following link 'https://github.com/rajkali499/country_picker_bkb.git'. Comment 
for the updates if needed on this packages
