import 'package:dio/dio.dart';

class LottoRepository{
  static Future<void> fetchData({required int drwNo}) async {
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
    print(response.data);
  }
}


