
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../api/accounts/enums/currency_type_enum.dart';
import '../../api/accounts/responses/Account.dart';
import '../accounts/accounts_bloc.dart';

Future<List<Account>> getAllAccounts () async {
  return await getAccounts();
}

void saveTransaction (GlobalKey<FormBuilderState> formKey, BuildContext context) async {
  formKey.currentState?.saveAndValidate();
  log('${formKey.currentState}');
}

String getCurrencyType (CurrencyType cerrencyType) {
  String a = cerrencyType.toString();
  a = a.substring(a.indexOf(".") + 1);
  return a;
}