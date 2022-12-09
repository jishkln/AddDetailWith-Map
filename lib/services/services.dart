import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sampleadd/core/endpoints.dart';
import 'package:sampleadd/model/models.dart';

class Services {
  final _dio = Dio();

  Future<AddResponce?> getDetails({required String id}) async {
    final Map<String, String> body = {"ad_id": id};
    try {
      Response response = await _dio.post(
        EndPoints.baseUrl,
        options:
            Options(headers: {"Authorization": "Bearer ${EndPoints.tocken}"}),
        data: body,
      );
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        log("Sucess");
        // log(response.data.toString());
        return AddResponce.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
