import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottery/model/lotto_model.dart';


class FetchData{
  final String tempUrl = 'https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=';
  //특정 회차 로또 데이터 받아오기
  Future<LottoModel> fetchLotto(String drwNo) async {
    final request = Uri.parse(tempUrl+drwNo);
    final response = await http.get(request);

    //print(response.body);

    if(response.statusCode == 200) {
      return LottoModel.formJson(response.body as Map<String, dynamic>);
    }else{
      throw Exception('데이터 받아올 수 없음.');
    }
  }

  void fetchLottos(){

  }
}