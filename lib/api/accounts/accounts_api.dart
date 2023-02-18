import 'dart:developer';

import 'package:sarafi/api/accounts/responses/Account.dart';
import 'package:sarafi/api/http_client/http_base.dart';

class AccountsApi extends HttpBase {
  AccountsApi() : super ("Account");

  Future<dynamic> getAllAccounts () async {
    final response = await get("GetAllAccountsAsync");
    return response;
  }
}