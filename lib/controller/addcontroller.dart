import 'package:get/get.dart';

import 'package:sampleadd/model/models.dart';

import 'package:sampleadd/services/services.dart';
import 'package:sampleadd/view/home.dart';

class AddController extends GetxController {
  final Services services = Services();

  AdDetail? details;
  OwnerDetails? userDetails;
  List<String> addImag = [];

  getAdd({required String id}) async {
    final AddResponce? addResponce;
    addResponce = await services.getDetails(id: id);
    if (addResponce != null) {
      details = addResponce.adDetail;
      userDetails = addResponce.ownerDetails;
      addImag.clear();
      addImag.addAll(addResponce.adDetail!.imageUrl!);

      Get.to(const Home(),
          transition: Transition.cupertino,
          duration: const Duration(milliseconds: 500));
    }
    update();
  }
}
