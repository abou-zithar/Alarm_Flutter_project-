import 'dart:convert';

import 'package:dynamic_item_list_view_flutter_getx/app/data/model/alarms.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<List<AlarmModel>> alarms = Rx<List<AlarmModel>>([]);
  TextEditingController hourTextEditingController = TextEditingController();
  TextEditingController minTextEditingController = TextEditingController();
  late AlarmModel alarmModel;
  var itemCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    hourTextEditingController.dispose();
    minTextEditingController.dispose();
  }

  addAlarm(String name, String address) {
    alarmModel = AlarmModel(hour: name, mintes: address);
    alarms.value.add(alarmModel);
    itemCount.value = alarms.value.length;
    hourTextEditingController.clear();
    minTextEditingController.clear();
  }

  removeEmployee(int index) {
    alarms.value.removeAt(index);
    itemCount.value = alarms.value.length;
  }
}
