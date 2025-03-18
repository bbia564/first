import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

class DefaultComponents extends GetView {
  const DefaultComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Flutter默认dialog")),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Title",
                    middleText: "Are you sure?",
                    confirm: ElevatedButton(
                        onPressed: () {
                          //关闭弹框
                          Get.back();
                        },
                        child: const Text("Confirm")),
                    cancel: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel")),
                  );
                },
                child: const Text("Get的默认dialog")),
            ElevatedButton(
                onPressed: () {
                  //应用内顶部弹框
                  Get.snackbar("Error", "Please login first",
                      colorText: Colors.black, backgroundColor: Colors.white);
                },
                child: const Text("Get的snackbar")),
            ElevatedButton(
                onPressed: () {
                  //底部弹框
                  Get.bottomSheet(Container(
                    //判断主题是白天还是黑夜
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Light",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          leading: const Icon(Icons.light_mode),
                          onTap: () {
                            //白天模式
                            Get.changeTheme(ThemeData.light());
                            Get.back();
                          },
                        ),
                        ListTile(
                          title: Text(
                            "Dark",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          leading: const Icon(Icons.dark_mode),
                          onTap: () {
                            //夜晚模式
                            Get.changeTheme(ThemeData.dark());
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  ));
                },
                child: const Text("Get的bottomSheet切换主题")),
            SizedBox(
              width: 200,
              height: 200,
              child: <Widget>[]
                  .toRow(mainAxisAlignment: MainAxisAlignment.center)
                  .decorated(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
