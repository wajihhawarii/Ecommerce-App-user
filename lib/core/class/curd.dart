import "dart:convert";

import "package:dartz/dartz.dart";
import "package:ecommerceappn/core/class/statuserequest.dart";
import "package:ecommerceappn/core/function/cheakeinternet.dart";

import 'package:http/http.dart' as http;

class Curd {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await cheakeInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailuer);
        }
      } else {
        return const Left(StatusRequest.offlinefailuer);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
