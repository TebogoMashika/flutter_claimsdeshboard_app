import 'package:claims_deshboard/api/api_path_constants.dart';
import 'package:claims_deshboard/model/claim_details.dart';
import 'package:claims_deshboard/model/peril_list_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class ApiService {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  saveClaimDetails(ClaimDetailsModel claimDetailsModel) async {
    var response = await http.post(
        Uri.http(ApiConstants.baseUrl, ApiConstants.saveClaimDetailsEndpoint),
        body: json.encode(claimDetailsModel.toMap()),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      var responseJson = response.body.toString();

      print(responseJson);
      return responseJson;
    } else {
      throw "Unable to save data.";
    }
  }

  getPerils() async {
    var response = await http
        .get(Uri.http(ApiConstants.baseUrl, ApiConstants.perilListEndpoint));

    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);

      List<PerilList> perilList = _createPerilList(responseJson);
      return perilList;
    } else {
      throw "Unable to retrieve perils data.";
    }
  }

  List<PerilList> _createPerilList(List data) {
    List<PerilList> list = [];

    for (int i = 0; i < data.length; i++) {
      String peril = data[i]["peril"];
      int perilCd = data[i]["perilCd"];

      PerilList perilList = PerilList(perilName: peril, perilCd: perilCd);

      list.add(perilList);
    }
    return list;
  }
}
