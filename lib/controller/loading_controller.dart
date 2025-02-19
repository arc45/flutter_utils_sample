import 'package:get/get.dart';

class LoadingController extends GetxController {
  // A map to track the loading state for multiple APIs
  var apiLoadingStates = <String, RxBool>{}.obs;

  // Set loading state for a specific API
  void setLoading(String apiKey, bool value) {
    if (apiLoadingStates.containsKey(apiKey)) {
      apiLoadingStates[apiKey]!.value = value;
    } else {
      apiLoadingStates[apiKey] = RxBool(value);
    }
  }

  // Check if any API is loading
  bool isAnyLoading(String apiKey) {
    return apiLoadingStates.values.any((isLoading) => isLoading.value);
  }
}
