import '../enums/currency_type_enum.dart';

class Account {
  String? id;
  String? masterAccountId;
  String? userId;
  String? accountName;
  String? balance;
  CurrencyType? currencyType;
  bool? isLocked;

  Account.fromJson (Map<String, dynamic> map) {
    id = '${map['id']}';
    masterAccountId = '${map['masterAccountId']}';
    userId = '${map['userId']}';
    accountName = '${map['accountName']}';
    balance = '${map['balance']}';
    currencyType = CurrencyType.values.firstWhere((element) => element.index == map['currencyType']);
    isLocked = map['isLocked'];
  }

  Account.placeHolder () {
    masterAccountId = "";
    userId = "";
    accountName = "";
    balance = "";
    currencyType = CurrencyType.Afghani;
    isLocked = false;
  }
}