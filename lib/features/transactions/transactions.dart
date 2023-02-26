import 'package:flutter/material.dart';
import 'package:sarafi/features/transactions/transaction_bloc.dart';
import 'package:sarafi/features/transactions/transfer_popup.dart';

import '../../main.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
        icon: Icon(Icons.transform_rounded),
        onPressed: () async {
          final accounts = await getAllAccounts ();
          final items = accounts.map((e) => DropdownMenuItem(
            value: e.id,
            child: Text('${e.accountName} ${getCurrencyType(e.currencyType!)}'),
          )).toList();
          showDialog(
            context: context,
            barrierDismissible: true,
            useRootNavigator: true,
            builder: (BuildContext context) {
              return AlertDialog(
                content: getTransferPopup(context, items),
              );
            }
          );
        },
      ),
    );
  }
}
