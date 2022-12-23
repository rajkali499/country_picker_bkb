import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class City extends StatefulWidget {
  Widget? child;
  EdgeInsets? padding;
  double? height;
  double? width;
  Color? color;
  Decoration? decoration;

  City(
      {Key? key,
      this.child,
      this.decoration,
      this.height,
      this.width,
      this.padding,
      this.color})
      : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  late GlobalKey _key;
  late Size buttonSize;
  late Offset buttonPosition;

  ValueNotifier<City_Model> city=ValueNotifier(City_Model());

  @override
  void initState() {
    // TODO: implement initState
    loadCountryData();
    loadStateData();
    loadCityData();
    _key = LabeledGlobalKey("button_icon");
    super.initState();
  }

  findButton() {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        findButton();
        citySelect(context, buttonPosition, buttonSize,city);
      },
      child: widget.child ??
          Container(
            key: _key,
            padding: widget.padding ?? const EdgeInsets.all(10),
            height: widget.height ?? 50,
            width: widget.width ?? MediaQuery.of(context).size.width * 0.9,
            decoration: widget.decoration ??
                BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.color ?? Colors.white,
                ),
            child: ValueListenableBuilder(
                valueListenable: selectedDetailsForCity,
                builder: (context, City_Model selectedCity, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(selectedCity.name ?? "Select City"),
                      SvgPicture.asset(
                        "packages/country_picker_bkb/lib/assets/svg/down-arrow.svg",
                        height: 15,
                        width: 10,
                      ),
                    ],
                  );
                }),
          ),
    );
  }
}
