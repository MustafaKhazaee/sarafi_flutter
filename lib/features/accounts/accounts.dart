
import 'package:flutter/material.dart';
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
            children: list.map((e) => Center(
              child: Text(
              '${e.masterAccountId} ${e.accountName} ${e.balance} ${e.currencyType}'
              ),
            )).toList());
        },
      ),
    );
  }
}
