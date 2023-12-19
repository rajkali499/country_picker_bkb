library country_picker_bkb;

import 'dart:convert';

import 'package:country_picker_bkb/model/country_model.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:country_picker_bkb/widgets/city.dart';
import 'package:country_picker_bkb/widgets/country.dart';
import 'package:country_picker_bkb/widgets/mobile_number_code_picker.dart';
import 'package:country_picker_bkb/widgets/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    loadCountryData();
    loadStateData();
    loadCityData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MobileNumberCode(
                textEditingController: textEditingController,
              ),
              const SizedBox(
                height: 20,
              ),
              const Country(),
              const SizedBox(
                height: 20,
              ),
              const StatePicker(),
              const SizedBox(
                height: 20,
              ),
              const City(),
              const SizedBox(
                height: 20,
              ),
              MobileNumberCode(textEditingController: textEditingController),
            ],
          ),
        ),
      ),
    );
  }
}

citySelect(
    BuildContext context,
    Offset buttonPosition,
    Size buttonSize,
    ValueNotifier<CityModel> value,
    ValueNotifier<CountryModel> country,
    ValueNotifier<StateModel> state) {
  loadCityData(state: state, country: country);
  showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return Stack(
            children: [
              buttonPosition.dy > MediaQuery.of(context).size.height * 0.5
                  ? Positioned(
                      bottom: (MediaQuery.of(context).size.height -
                          buttonPosition.dy),
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: (MediaQuery.of(context).size.height / 2) +
                          (buttonSize.height / 4),
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: cityFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    cityFilter.text = val;
                                  });
                                  cityFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: cityFilter.text.length));
                                  filterCity();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search city",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: cityFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      shrinkWrap: true,
                                      children: filteredCity
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedDetailsForCity
                                                        .value = emptyCity;
                                                    value.value = emptyCity;
                                                  } else {
                                                    selectedDetailsForCity
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.name);
                                                  cityFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      Text(element.name ?? ""),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : totalCities.isEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text("No City Available"),
                                        )
                                      : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          itemCount: totalCities.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                if (totalCities[index].name ==
                                                    noneName) {
                                                  selectedDetailsForCity.value =
                                                      emptyCity;
                                                  value.value = emptyCity;
                                                } else {
                                                  selectedDetailsForCity.value =
                                                      totalCities[index];
                                                  value.value =
                                                      totalCities[index];
                                                }
                                                debugPrint(value.value.name);
                                                cityFilter.clear();
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: Text(
                                                    totalCities[index].name ??
                                                        ""),
                                              ),
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Positioned(
                      top: buttonPosition.dy,
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: MediaQuery.of(context).size.height -
                          buttonPosition.dy -
                          100,
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: cityFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    cityFilter.text = val;
                                  });
                                  cityFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: cityFilter.text.length));
                                  filterCity();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search city",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: cityFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      shrinkWrap: true,
                                      children: filteredCity
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedDetailsForCity
                                                        .value = emptyCity;
                                                    value.value = emptyCity;
                                                  } else {
                                                    selectedDetailsForCity
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.name);
                                                  cityFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      Text(element.name ?? ""),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : totalCities.isEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text("No City Available"),
                                        )
                                      : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          itemCount: totalCities.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                if (totalCities[index].name ==
                                                    noneName) {
                                                  selectedDetailsForCity.value =
                                                      emptyCity;
                                                  value.value = emptyCity;
                                                } else {
                                                  selectedDetailsForCity.value =
                                                      totalCities[index];
                                                  value.value =
                                                      totalCities[index];
                                                }
                                                debugPrint(value.value.name);
                                                cityFilter.clear();
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: Text(
                                                    totalCities[index].name ??
                                                        ""),
                                              ),
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
      });
}

stateSelect(
    BuildContext context,
    Offset buttonPosition,
    Size buttonSize,
    ValueNotifier<StateModel> value,
    ValueNotifier<CountryModel> selectedCountry) {
  loadStateData(selectedDetailsForCountry1: selectedCountry);
  showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return Stack(
            children: [
              buttonPosition.dy > MediaQuery.of(context).size.height * 0.5
                  ? Positioned(
                      bottom: (MediaQuery.of(context).size.height -
                          buttonPosition.dy),
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: (MediaQuery.of(context).size.height / 2) +
                          (buttonSize.height / 4),
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: stateFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    stateFilter.text = val;
                                  });
                                  stateFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: stateFilter.text.length));
                                  filterState();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search state",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: stateFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      shrinkWrap: true,
                                      children: filteredState
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedDetailsForState
                                                        .value = emptyState;
                                                    value.value = emptyState;
                                                  } else {
                                                    selectedDetailsForState
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.name);
                                                  totalCities = [];
                                                  loadCityData();
                                                  selectedDetailsForCity.value =
                                                      CityModel();
                                                  stateFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      Text(element.name ?? ""),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : totalStates.isEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text("No State Available"),
                                        )
                                      : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          itemCount: totalStates.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                if (totalStates[index].name ==
                                                    noneName) {
                                                  selectedDetailsForState
                                                      .value = emptyState;
                                                  value.value = emptyState;
                                                } else {
                                                  selectedDetailsForState
                                                          .value =
                                                      totalStates[index];
                                                  value.value =
                                                      totalStates[index];
                                                }
                                                debugPrint(value.value.name);
                                                totalCities = [];
                                                loadCityData();
                                                selectedDetailsForCity.value =
                                                    CityModel();
                                                stateFilter.clear();
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: Text(
                                                    totalStates[index].name ??
                                                        ""),
                                              ),
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Positioned(
                      top: buttonPosition.dy,
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: MediaQuery.of(context).size.height -
                          buttonPosition.dy -
                          100,
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: stateFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    stateFilter.text = val;
                                  });
                                  stateFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: stateFilter.text.length));
                                  filterState();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search state",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: stateFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      shrinkWrap: true,
                                      children: filteredState
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedDetailsForState
                                                        .value = emptyState;
                                                    value.value = emptyState;
                                                  } else {
                                                    selectedDetailsForState
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.name);
                                                  totalCities = [];
                                                  loadCityData();
                                                  selectedDetailsForCity.value =
                                                      CityModel();
                                                  stateFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      Text(element.name ?? ""),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : totalStates.isEmpty
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text("No State Available"),
                                        )
                                      : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 10,
                                          ),
                                          itemCount: totalStates.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                if (totalStates[index].name ==
                                                    noneName) {
                                                  selectedDetailsForState
                                                      .value = emptyState;
                                                  value.value = emptyState;
                                                } else {
                                                  selectedDetailsForState
                                                          .value =
                                                      totalStates[index];
                                                  value.value =
                                                      totalStates[index];
                                                }
                                                debugPrint(value.value.name);
                                                totalCities = [];
                                                loadCityData();
                                                selectedDetailsForCity.value =
                                                    CityModel();
                                                stateFilter.clear();
                                                Navigator.pop(context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: Text(
                                                    totalStates[index].name ??
                                                        ""),
                                              ),
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
      });
}

countrySelect(BuildContext context, Offset buttonPosition, Size buttonSize,
    ValueNotifier<CountryModel> value) {
  showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return Stack(
            children: [
              buttonPosition.dy > MediaQuery.of(context).size.height * 0.5
                  ? Positioned(
                      bottom: (MediaQuery.of(context).size.height -
                          buttonPosition.dy),
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: (MediaQuery.of(context).size.height / 2) +
                          (buttonSize.height / 4),
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: countryFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    countryFilter.text = val;
                                  });
                                  countryFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: countryFilter.text.length));
                                  filterCountry();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search country",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: countryFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shrinkWrap: true,
                                      children: filteredCountries
                                          .map(
                                            (element) => InkWell(
                                              onTap: () {
                                                if (element.name == noneName) {
                                                  selectedDetailsForCountry
                                                      .value = emptyCountry;
                                                  value.value = emptyCountry;
                                                } else {
                                                  selectedDetailsForCountry
                                                      .value = element;
                                                  value.value = element;
                                                }
                                                debugPrint(value.value.name);
                                                totalStates = [];
                                                loadStateData(
                                                    selectedDetailsForCountry1:
                                                        value);
                                                totalCities = [];
                                                loadCityData();
                                                countryFilter.clear();
                                                selectedDetailsForState.value =
                                                    StateModel();
                                                selectedDetailsForCity.value =
                                                    CityModel();
                                                Navigator.pop(context);
                                              },
                                              splashColor: Colors.blue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 10),
                                                child: Text(element.name ?? ""),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      itemCount: totalCounties.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            if (totalCounties[index].name ==
                                                noneName) {
                                              selectedDetailsForCountry.value =
                                                  emptyCountry;
                                              value.value = emptyCountry;
                                            } else {
                                              selectedDetailsForCountry.value =
                                                  totalCounties[index];
                                              value.value =
                                                  totalCounties[index];
                                            }
                                            debugPrint(value.value.name);
                                            totalStates = [];
                                            loadStateData(
                                                selectedDetailsForCountry1:
                                                    value);
                                            totalCities = [];
                                            loadCityData();
                                            countryFilter.clear();
                                            selectedDetailsForState.value =
                                                StateModel();
                                            selectedDetailsForCity.value =
                                                CityModel();
                                            Navigator.pop(context);
                                          },
                                          splashColor: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10),
                                            child: Text(
                                                totalCounties[index].name ??
                                                    ""),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Positioned(
                      top: buttonPosition.dy,
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: MediaQuery.of(context).size.height -
                          buttonPosition.dy -
                          100,
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: countryFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    countryFilter.text = val;
                                  });
                                  countryFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: countryFilter.text.length));
                                  filterCountry();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search country",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: countryFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shrinkWrap: true,
                                      children: filteredCountries
                                          .map(
                                            (element) => InkWell(
                                              onTap: () {
                                                if (element.name == noneName) {
                                                  selectedDetailsForCountry
                                                      .value = emptyCountry;
                                                  value.value = emptyCountry;
                                                } else {
                                                  selectedDetailsForCountry
                                                      .value = element;
                                                  value.value = element;
                                                }
                                                debugPrint(value.value.name);
                                                totalStates = [];
                                                loadStateData(
                                                    selectedDetailsForCountry1:
                                                        value);
                                                totalCities = [];
                                                loadCityData();
                                                countryFilter.clear();
                                                selectedDetailsForState.value =
                                                    StateModel();
                                                selectedDetailsForCity.value =
                                                    CityModel();
                                                Navigator.pop(context);
                                              },
                                              splashColor: Colors.blue,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 10),
                                                child: Text(element.name ?? ""),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      itemCount: totalCounties.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            if (totalCounties[index].name ==
                                                noneName) {
                                              selectedDetailsForCountry.value =
                                                  emptyCountry;
                                              value.value = emptyCountry;
                                            } else {
                                              selectedDetailsForCountry.value =
                                                  totalCounties[index];
                                              value.value =
                                                  totalCounties[index];
                                            }
                                            debugPrint(value.value.name);
                                            totalStates = [];
                                            loadStateData(
                                                selectedDetailsForCountry1:
                                                    value);
                                            totalCities = [];
                                            loadCityData();
                                            countryFilter.clear();
                                            selectedDetailsForState.value =
                                                StateModel();
                                            selectedDetailsForCity.value =
                                                CityModel();
                                            Navigator.pop(context);
                                          },
                                          splashColor: Colors.blue,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 10),
                                            child: Text(
                                                totalCounties[index].name ??
                                                    ""),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
      });
}

phoneCodeSelect(BuildContext context, Offset buttonPosition, Size buttonSize,
    ValueNotifier<CountryModel> value) {
  showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, refresh) {
          return Stack(
            children: [
              buttonPosition.dy > MediaQuery.of(context).size.height * 0.5
                  ? Positioned(
                      bottom: (MediaQuery.of(context).size.height -
                          buttonPosition.dy),
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: (MediaQuery.of(context).size.height / 2) +
                          (buttonSize.height / 4),
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: phoneCodeFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    phoneCodeFilter.text = val;
                                  });
                                  phoneCodeFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: phoneCodeFilter.text.length));
                                  filterPhoneCode();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search here",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: phoneCodeFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shrinkWrap: true,
                                      children: filteredCountriesForCode
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedCountryDetailsForPhoneCode
                                                        .value = emptyCountry;
                                                    value.value = emptyCountry;
                                                  } else {
                                                    selectedCountryDetailsForPhoneCode
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.dialCode);
                                                  phoneCodeFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child: Wrap(
                                                    spacing: 8,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                        width: 30,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              SvgPicture.asset(
                                                            flags[element
                                                                        .code ??
                                                                    ""] ??
                                                                "",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(element.dialCode ??
                                                          ""),
                                                      Text(element.name ?? ""),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      itemCount: totalCounties.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            if (totalCounties[index].name ==
                                                noneName) {
                                              selectedCountryDetailsForPhoneCode
                                                  .value = emptyCountry;
                                              value.value = emptyCountry;
                                            } else {
                                              selectedCountryDetailsForPhoneCode
                                                  .value = totalCounties[index];
                                              value.value =
                                                  totalCounties[index];
                                            }
                                            debugPrint(value.value.dialCode);
                                            phoneCodeFilter.clear();
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Wrap(
                                              spacing: 8,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 30,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: SvgPicture.asset(
                                                      flags[totalCounties[index]
                                                                  .code ??
                                                              ""] ??
                                                          "",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(totalCounties[index]
                                                        .dialCode ??
                                                    ""),
                                                Text(
                                                    totalCounties[index].name ??
                                                        ""),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Positioned(
                      top: buttonPosition.dy,
                      left: buttonPosition.dx,
                      width: buttonSize.width,
                      height: MediaQuery.of(context).size.height -
                          buttonPosition.dy -
                          100,
                      child: Material(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: phoneCodeFilter,
                                onChanged: (val) {
                                  refresh(() {
                                    phoneCodeFilter.text = val;
                                  });
                                  phoneCodeFilter.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: phoneCodeFilter.text.length));
                                  filterPhoneCode();
                                },
                                decoration: InputDecoration(
                                    hintText: "Search here",
                                    suffixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Expanded(
                              child: phoneCodeFilter.text.isNotEmpty
                                  ? ListView(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      shrinkWrap: true,
                                      children: filteredCountriesForCode
                                          .map((element) => InkWell(
                                                onTap: () {
                                                  if (element.name ==
                                                      noneName) {
                                                    selectedCountryDetailsForPhoneCode
                                                        .value = emptyCountry;
                                                    value.value = emptyCountry;
                                                  } else {
                                                    selectedCountryDetailsForPhoneCode
                                                        .value = element;
                                                    value.value = element;
                                                  }
                                                  debugPrint(value.value.dialCode);
                                                  phoneCodeFilter.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child: Wrap(
                                                    spacing: 8,
                                                    children: [
                                                      SizedBox(
                                                        height: 20,
                                                        width: 30,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child:
                                                              SvgPicture.asset(
                                                            flags[element
                                                                        .code ??
                                                                    ""] ??
                                                                "",
                                                            height: 20,
                                                            width: 20,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(element.dialCode ??
                                                          ""),
                                                      Text(element.name ?? ""),
                                                    ],
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      itemCount: totalCounties.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            if (totalCounties[index].name ==
                                                noneName) {
                                              selectedCountryDetailsForPhoneCode
                                                  .value = emptyCountry;
                                              value.value = emptyCountry;
                                            } else {
                                              selectedCountryDetailsForPhoneCode
                                                  .value = totalCounties[index];
                                              value.value =
                                                  totalCounties[index];
                                            }
                                            debugPrint(value.value.dialCode);
                                            phoneCodeFilter.clear();
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Wrap(
                                              spacing: 8,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                  width: 30,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: SvgPicture.asset(
                                                      flags[totalCounties[index]
                                                                  .code ??
                                                              ""] ??
                                                          "",
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Text(totalCounties[index]
                                                        .dialCode ??
                                                    ""),
                                                Text(
                                                    totalCounties[index].name ??
                                                        ""),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          );
        });
      });
}

Future<dynamic> loadCountryData() async {
  var res = await rootBundle
      .loadString('packages/country_picker_bkb/lib/assets/json/$jsonPath');
  var countryDetail = jsonDecode(res);
  // Country_Model country_model=Country_Model.fromJson(jsonDecode(res;
  totalCounties = [noneCountry];
  countryDetail.forEach((element) {
    totalCounties.add(CountryModel.fromJson(element));
  });
  debugPrint(totalCounties.length.toString());
}

Future<dynamic> loadStateData(
    {ValueNotifier<CountryModel>? selectedDetailsForCountry1}) async {
  var res = await rootBundle
      .loadString('packages/country_picker_bkb/lib/assets/json/$jsonPath');
  var countryDetail = jsonDecode(res);
  // Country_Model country_model=Country_Model.fromJson(jsonDecode(res;
  if ((selectedDetailsForCountry1 ?? selectedDetailsForCountry).value.name !=
      null) {
    totalStates = [noneState];
    countryDetail.forEach((element) {
      if (element['name'] ==
          (selectedDetailsForCountry1 ?? selectedDetailsForCountry)
              .value
              .name) {
        element['state'].forEach((value) {
          totalStates.add(StateModel.fromJson(value));
        });
      }
    });
  } else {
    totalStates = [noneState];
    countryDetail.forEach((element) {
      element['state'].forEach((value) {
        totalStates.add(StateModel.fromJson(value));
      });
    });
  }
  debugPrint(totalStates.length.toString());
}

Future<dynamic> loadCityData(
    {ValueNotifier<CountryModel>? country,
    ValueNotifier<StateModel>? state}) async {
  var res = await rootBundle
      .loadString('packages/country_picker_bkb/lib/assets/json/$jsonPath');
  var countryDetail = jsonDecode(res);
  // Country_Model country_model=Country_Model.fromJson(jsonDecode(res;
  if ((country ?? selectedDetailsForCountry).value.name != null &&
      (state ?? selectedDetailsForState).value.name != null) {
    totalCities = [noneCity];
    countryDetail.forEach((element) {
      if (element['name'] ==
          (country ?? selectedDetailsForCountry).value.name) {
        element['state'].forEach((value) {
          if ((state ?? selectedDetailsForState).value.name == value['name']) {
            value['city'].forEach((data) {
              totalCities.add(CityModel.fromJson(data));
            });
          }
        });
      }
    });
  } else if ((country ?? selectedDetailsForCountry).value.name != null) {
    totalCities = [noneCity];
    countryDetail.forEach((element) {
      if (element['name'] ==
          (country ?? selectedDetailsForCountry).value.name) {
        element['state'].forEach((value) {
          value['city'].forEach((data) {
            totalCities.add(CityModel.fromJson(data));
          });
        });
      }
    });
  } else if ((state ?? selectedDetailsForState).value.name != null) {
    totalCities = [];
    countryDetail.forEach((element) {
      element['state'].forEach((value) {
        if ((state ?? selectedDetailsForState).value.name == value['name']) {
          value['city'].forEach((data) {
            totalCities.add(CityModel.fromJson(data));
          });
        }
      });
    });
  } else {
    totalCities = [];
    countryDetail.forEach((element) {
      element['state'].forEach((value) {
        value['city'].forEach((data) {
          totalCities.add(CityModel.fromJson(data));
        });
      });
    });
  }
  debugPrint(totalCities.length.toString());
}

filterPhoneCode() {
  filteredCountriesForCode = [];
  filteredCountriesForCode.addAll(totalCounties);
  filteredCountriesForCode.retainWhere((element) {
    return element.name
            ?.toLowerCase()
            .contains(phoneCodeFilter.text.toLowerCase()) ??
        false;
  });
}

filterCountry() {
  filteredCountries = [];
  filteredCountries.addAll(totalCounties);
  filteredCountries.retainWhere((element) {
    return element.name
            ?.toLowerCase()
            .contains(countryFilter.text.toLowerCase()) ??
        false;
  });
}

filterState() {
  filteredState = [];
  filteredState.addAll(totalStates);
  filteredState.retainWhere((element) {
    return element.name
            ?.toLowerCase()
            .contains(stateFilter.text.toLowerCase()) ??
        false;
  });
}

filterCity() {
  filteredCity = [];
  filteredCity.addAll(totalCities);
  filteredCity.retainWhere((element) {
    return element.name
            ?.toLowerCase()
            .contains(cityFilter.text.toLowerCase()) ??
        false;
  });
}
