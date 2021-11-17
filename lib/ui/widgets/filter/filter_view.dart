import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:parasut_rover_flutter/core/base/base_view.dart';
import 'package:parasut_rover_flutter/core/enum/rover_camera.dart';
import 'package:parasut_rover_flutter/core/extensions/context_extensions.dart';
import 'package:parasut_rover_flutter/ui/widgets/empty_box.dart';
import 'package:parasut_rover_flutter/ui/widgets/filter/filter_viewmodel.dart';
import 'package:parasut_rover_flutter/ui/widgets/selectable_border_box.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  _selectEarthDate(FilterViewModel model) {
    var earthDate = model.filter.earthDate;
    DateTime currentTime = earthDate != null ? DateTime.parse(earthDate) : DateTime.now();
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2015, 6, 3),
      maxTime: DateTime(2070, 6, 7),
      onConfirm: model.changeEarthDate,
      currentTime: currentTime,
      locale: LocaleType.tr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FilterViewModel>(
      viewModel: FilterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, _) => Scaffold(
        backgroundColor: context.cupertinoTheme.scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
            child: SizedBox(
              height: context.height - context.topPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildAppbar(model),
                  Divider(color: Colors.white),
                  buildDateFilter(model),
                  buildCameraFilter(model),
                  Spacer(),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: context.cupertinoTheme.primaryColor,
                      ),
                      onPressed: model.applyFilters,
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  EmptyBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildAppbar(FilterViewModel model) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: model.goBack,
              icon: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Filters",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: model.clearAll,
              icon: Icon(
                Icons.clear_all,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDateFilter(FilterViewModel model) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFilterTitle("Date"),
          EmptyBox(),
          buildDateTypeSelection(model),
          EmptyBox(),
          Visibility(
            visible: model.filter.dateType == DateType.Mars,
            child: TextFormField(
              initialValue: model.filter.sol?.toString(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                hintText: "(ranges from 0 to max found in endpoint)",
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: model.changeSol,
            ),
          ),
          Visibility(
            visible: model.filter.dateType == DateType.Earth,
            child: GestureDetector(
              onTap: () => _selectEarthDate(model),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: context.paddingNormal,
                child: Text(
                  model.filter.earthDate ?? "Choose a date",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildDateTypeSelection(FilterViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SelectableBorderBox(
          selected: model.filter.dateType == DateType.Earth,
          label: "Earth's day",
          onSelected: () => model.changeDateType(DateType.Earth),
        ),
        SelectableBorderBox(
          selected: model.filter.dateType == DateType.Mars,
          label: "Mars's day",
          onSelected: () => model.changeDateType(DateType.Mars),
        ),
      ],
    );
  }

  Widget buildCameraFilter(FilterViewModel model) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFilterTitle("Camera"),
          EmptyBox(),
          buildCameraSelection(model),
          EmptyBox(),
        ],
      ),
    );
  }

  Widget buildCameraSelection(FilterViewModel model) {
    var cameras = model.session.selectedRover!.cameras;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: cameras
          .map(
            (e) => SelectableBorderBox(
              label: e.camName,
              selected: e == model.filter.camera,
              onSelected: () => model.changeSelectedCamera(e),
            ),
          )
          .toList(),
    );
  }

  Text buildFilterTitle(String title) => Text(
        "$title",
        style: TextStyle(
          fontSize: context.customWidthValue(0.045),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
}
