import 'package:app_lifecycle/controller/loading_controller.dart';
import 'package:app_lifecycle/controller/object_controller.dart';
import 'package:app_lifecycle/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObjectsPage extends StatelessWidget {
  const ObjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final objectController = Get.put(ObjectController());

    final loadingController = Get.find<LoadingController>();

    return PopScope(
      canPop: false,

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("Objects", style: bold18White),
        ),
        body: Obx(() {
          if (loadingController.isAnyLoading(
            objectController.objectFetchLoadingKey,
          )) {
            return Center(
              child: CircularProgressIndicator(color: primaryColor),
            );
          } else {
            return objectController.objectModelList.isEmpty
                ? Center(child: ListView(children: [Text("List is Empty")]))
                : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: objectController.objectModelList.length,
                  itemBuilder: (context, index) {
                    final objectData = objectController.objectModelList[index];
                    return Container(
                      margin: EdgeInsets.all(fixPadding * 2.0),
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withValues(alpha: 0.4),
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: Text(
                        "${objectData.id}. ${objectData.name}",
                        style: semibold16Black,
                      ),
                    );
                  },
                );
          }
        }),
      ),
    );
  }
}
