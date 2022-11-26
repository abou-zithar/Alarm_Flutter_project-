import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ALarm'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.hourTextEditingController,
              decoration: const InputDecoration(
                hintText: "Hours",
                labelText: "Hours",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.minTextEditingController,
              decoration: const InputDecoration(
                hintText: "Mintes",
                labelText: "Mintes",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final hour = controller.hourTextEditingController.text;

                final min = controller.minTextEditingController.text;
                FlutterAlarmClock.createAlarm(int.parse(hour), int.parse(min));
                controller.addAlarm(hour, min);
              },
              child: const Text("Add Alarm"),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            const Icon(Icons.alarm),
                            Text(" ${controller.alarms.value[index].hour!}"),
                            Text(": ${controller.alarms.value[index].mintes!}")
                          ],
                        ),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            controller.removeEmployee(index);
                          },
                        ),
                      );
                    }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
