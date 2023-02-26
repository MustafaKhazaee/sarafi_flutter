import 'package:flutter/material.dart';
import 'package:sarafi/api/accounts/enums/currency_type_enum.dart';
import 'package:sarafi/api/accounts/responses/Account.dart';

import 'accounts_bloc.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAccounts(),
        initialData: emptyAccountList,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List<Account> list = snapshot.data as List<Account>;
          return ListView(
              padding: EdgeInsets.all(10),
              children: list
                  .map((e) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border(
                                    // left: BorderSide( color: colorMap[e.currencyType]!, width: 10),
                                    right: BorderSide( color: colorMap[e.currencyType]!, width: 10),
                                ),
                              ),
                              padding: EdgeInsets.all(14),
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${e.accountName}',
                                          style: TextStyle(
                                            fontSize: 22,
                                            color: colorMap[e.currencyType]!
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text('Balance: ${e.balance}'),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                    Text('${getCurrencyType(e.currencyType!)}')
                                  ],
                                )
                              )),
                        ),
                      ))
                  .toList());
        },
      ),
    );
  }
}

// child: Text(
// '${e.masterAccountId} ${e.accountName} ${e.balance} ${e.currencyType}'
// ),

Map<CurrencyType, Color> colorMap = {
  CurrencyType.Afghani: Colors.brown,
  CurrencyType.USDollar: Colors.blueAccent,
  CurrencyType.Euro: Colors.red,
};

String getCurrencyType (CurrencyType cerrencyType) {
  String a = cerrencyType.toString();
  a = a.substring(a.indexOf(".") + 1);
  return a;
}