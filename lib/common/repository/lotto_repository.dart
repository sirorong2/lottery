import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lottery/model/lotto_model.dart';

class LottoRepository{
  static Future<String> fetchData({required int drwNo}) async {
    var dio = Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 3000;
    print('요청 $drwNo');
    final response = await dio
        .get('https://www.dhlottery.co.kr/common.do', queryParameters: {
      'method': 'getLottoNumber',
      'drwNo': drwNo,
    });
    print(response.statusCode);
    // print(response.data.runtimeType);
    // print(response.runtimeType);
    //
    // var decodeData = jsonDecode(response.data);
    // // print('decodeData : $decodeData');
    // return LottoModel.formJson(decodeData);
    return response.data;
  }
}


