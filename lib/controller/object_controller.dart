import 'package:app_lifecycle/controller/loading_controller.dart';
import 'package:app_lifecycle/model/object.dart';
import 'package:app_lifecycle/services/base_api_service.dart';
import 'package:app_lifecycle/services/network_api_service.dart';
import 'package:app_lifecycle/utils/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObjectController extends GetxController {
  final BaseApiService _apiService = NetworkApiService();

  var objectModelList = <ObjectModel>[].obs;

  String objectFetchLoadingKey = "fetchObjectLoading";

  Future fetchObjectsList() async {
    Get.find<LoadingController>().setLoading(objectFetchLoadingKey, true);
    try {
      final List response = await _apiService.getGetApiResonse(
        url: AppUrls.objectBaseUrl,
      );

      objectModelList.value =
          response.map((e) => ObjectModel.fromJson(e)).toList();

      Get.find<LoadingController>().setLoading(objectFetchLoadingKey, false);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    Get.lazyPut(() => LoadingController());
    fetchObjectsList();
    super.onInit();
  }
}
