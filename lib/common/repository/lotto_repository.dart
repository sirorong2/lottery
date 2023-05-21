import 'package:dio/dio.dart';
import 'package:lottery/model/lotto_model.dart';

class LottoRepository {
  static Future<LottoModel> fetchData({required int drwNo}) async {
    final response = await Dio().get(
      'www.dhlottery.co.kr/common.do',
      queryParameters: {
        'method': 'getLottoNumber',
        'drwNo': drwNo,
      }
    );

    print(response);

    LottoModel responseLotto = LottoModel.formJson(response.data);

    return responseLotto;

  }
}
