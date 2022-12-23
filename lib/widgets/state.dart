import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:country_picker_bkb/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/country_model.dart';

class StatePicker extends StatefulWidget {
  Widget? child;
  EdgeInsets? padding;
  double? height;
  double? width;
  Color? color;
  Decoration? decoration;

  StatePicker(
      {Key? key,
      this.child,
      this.decoration,
      this.height,
      this.width,
      this.padding,
      this.color})
      : super(key: key);

  @override
  State<StatePicker> createState() => _StatePickerState();
}

class _StatePickerState extends State<StatePicker> {
  late GlobalKey _key;
  late Size buttonSize;
  late Offset buttonPosition;

  ValueNotifier<State_Model> state = ValueNotifier(State_Model());

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
       stateSelect(context, buttonPosition, buttonSize,state);
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
              valueListenable: selectedDetailsForState,
              builder: (context, State_Model selectedState, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedState.name ?? "Select State"),
                    SvgPicture.asset(
                      "packages/country_picker_bkb/lib/assets/svg/down-arrow.svg",
                      height: 15,
                      width: 10,
                    ),
                  ],
                );
              },
            ),
          ),
    );
  }
}
