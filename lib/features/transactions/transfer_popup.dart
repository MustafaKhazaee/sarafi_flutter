
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sarafi/api/accounts/responses/Account.dart';
import 'package:sarafi/features/transactions/transaction_bloc.dart';
import '../home/styles/button_style.dart';

GlobalKey<FormBuilderState> _transferFormKey = GlobalKey<FormBuilderState>();

getTransferPopup (BuildContext context, List<DropdownMenuItem> items) => Scaffold(
  backgroundColor: Colors.white70,
  body: Center(
      child: FormBuilder(
        key: _transferFormKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormBuilderDropdown(name: "fromAccountId",
                  items: items,
                  style: getInputStyle(context),
                  decoration: getInputDecoration(context, "Username"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                ),
                SizedBox(height: 14),
                FormBuilderDropdown(name: "toAccountId",
                  items: items,
                  style: getInputStyle(context),
                  decoration: getInputDecoration(context, "Username"),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required()
                  ]),
                ),
                SizedBox(height: 10),
                Divider(color: Theme.of(context).primaryColor,indent: 14,endIndent: 14,
                    height: 12,thickness: 0.9),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _transferFormKey.currentState?.reset();
                      },
                      child: Text("Clear",
                        style: getWhiteButtonTextStyle(context),
                      ),
                      style: getWhiteButtonStyle(context),
                    ),
                    SizedBox(width: 2),
                    Builder(
                        builder: (context) {
                          return ElevatedButton(
                            onPressed: () => saveTransaction(_transferFormKey, context),
                            child: Text("Save",
                              style: getWhiteButtonTextStyle(context),
                            ),
                            style: getWhiteButtonStyle(context),
                          );
                        }
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
  ),
);

InputDecoration getInputDecoration (BuildContext context, String labelText) => InputDecoration(
  label: Text(labelText),
  contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 8),
  // hintText: labelText,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
        Radius.circular(8)
    ),
    borderSide: BorderSide(
      color: Theme.of(context).primaryColor,
    ),
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(8)
      ),
      borderSide: BorderSide(
          color: Theme.of(context).primaryColor
      )
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(8)
      ),
      borderSide: BorderSide(
          color: Theme.of(context).primaryColor
      )
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(8)
      ),
      borderSide: BorderSide(
          color: Theme.of(context).primaryColor
      )
  ),
  labelStyle: TextStyle(
      color: Theme.of(context).primaryColor
  ),
);

TextStyle getInputStyle (BuildContext context) => TextStyle(
  color: Theme.of(context).primaryColor,
  decorationThickness: 2,
);

TextStyle getWhiteButtonTextStyle (BuildContext context) => TextStyle(
  color: Theme.of(context).primaryColor,
  // backgroundColor:
);