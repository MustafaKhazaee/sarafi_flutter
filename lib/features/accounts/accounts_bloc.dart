
import 'package:sarafi/api/api.dart';
import '../../api/accounts/responses/Account.dart';

List<Account> emptyAccountList = [
  Account.placeHolder()
];

Future<List<Account>> getAccounts () async {
  final acc = await accountsApi.getAllAccounts();
  List<Account> accounts = [];
  for (Map<String, dynamic> map in acc) {
    accounts.add(Account.fromJson(map));
  }
  return accounts;
}