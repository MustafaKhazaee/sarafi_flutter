import 'dart:developer';

import 'package:sarafi/api/Transactions/requests/add_transaction_request.dart';
import 'package:sarafi/api/http_client/http_base.dart';

class AccountsApi extends HttpBase {
  AccountsApi() : super ("Transaction");

  Future<dynamic> addTransaction (AddTransactionQuery request) async {
    final response = await post("AddTransactionAsync", data: request.toJson());
    return response;
  }
}