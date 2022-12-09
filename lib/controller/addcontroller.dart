import 'dart:developer';

import 'package:flutter_geocoder/geocoder.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sampleadd/model/models.dart';

import 'package:sampleadd/services/services.dart';
import 'package:sampleadd/view/home.dart';

class AddController extends GetxController {
  final Services services = Services();
  RxBool isLoading = false.obs;

  int currentIndex = 0;
  late String postedDate;
  late String userDate;
  String userImage = "";
  final Map<String, Marker> markers = {};
  late LatLng loation;

  AdDetail? details;
  OwnerDetails? userDetails;
  List<String> addImag = [];
  List<String> spetialMention = [];

  getAdd({required String id}) async {
    isLoading.value = true;
    final AddResponce? addResponce;
    Get.to(const Home(),
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 500));
    addResponce = await services.getDetails(id: id);
    if (addResponce != null) {
      details = addResponce.adDetail;
      userDetails = addResponce.ownerDetails;
      addImag.clear();
      addImag.addAll(addResponce.adDetail!.imageUrl!);
      spetialMention.clear();
      spetialMention.addAll(addResponce.adDetail!.specialMention!);
      userImage = addResponce.ownerDetails!.profileUrl!;
      postedDate = addResponce.adDetail!.createdAt!.toString().split(" ").first;
      userDate =
          addResponce.ownerDetails!.createdDate!.toString().split("-").first;
      await addAddress();

      log(details!.adPostedAddress!.toString());
    }
    isLoading.value = false;
    update();
  }

  setIndex(int index) {
    currentIndex = index;
    update();
  }

  //=================Map===================

  addAddress() async {
    final String query = details!.adPostedAddress!;
    List<Address> address = await Geocoder.local.findAddressesFromQuery(query);
    loation = LatLng(address.first.coordinates.latitude!,
        address.first.coordinates.longitude!);
  }

  void addMarker() {
    Marker marker = Marker(
      markerId: MarkerId("$loation"),
      position: loation,
      infoWindow: InfoWindow(title: details!.adPostedAddress!),
    );
    markers.clear();
    markers['$loation'] = marker;
    update();
  }
}
