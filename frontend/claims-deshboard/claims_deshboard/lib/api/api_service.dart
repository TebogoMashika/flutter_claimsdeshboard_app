import 'package:claims_deshboard/api/api_path_constants.dart';
import 'package:claims_deshboard/model/peril_list_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class ApiService {
  Future<List<PerilList>?> getPerils() async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.perilListEndpoint);

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body.toString());

      List<PerilList> perilList = _createPerilList(responseJson);
      return perilList;
    }else{
       throw "Unable to retrieve perils data.";
    }
  }

  List<PerilList> _createPerilList(List data) {
    List<PerilList> list = [];

    for (int i = 0; i < data.length; i++) {
      String peril = data[i]["peril"];
      int perilCd = data[i]["perilCd"];

      PerilList perilList = PerilList(peril: peril, perilCd: perilCd);

      list.add(perilList);
    }
    return list;
  }
}
