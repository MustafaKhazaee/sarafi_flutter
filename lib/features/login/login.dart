import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sarafi/features/login/login_bloc.dart';
import '../home/styles/button_style.dart';
import '../home/styles/input_decoration.dart';
import '../home/styles/input_style.dart';
import '../home/styles/button_text_style.dart';
import '../home/themes/dark_theme.dart';
import '../home/themes/normal_theme.dart';

GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Global Application Properties
        themeMode: ThemeMode.system,
        theme: normalTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Center(
                child: FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 8),
                          Image.asset(
                            "assets/images/BruteForce.png",
                            width: 100,
                          ),
                          SizedBox(height: 14),
                          FormBuilderTextField(
                            name: 'username',
                            cursorColor: Colors.white,
                            style: getInputStyle(context),
                            decoration: getInputDecoration(context, "Username"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required()
                            ]),
                          ),
                          SizedBox(height: 14),
                          FormBuilderTextField(
                            cursorColor: Colors.white,
                            name: 'password',
                            style: getInputStyle(context),
                            decoration: getInputDecoration(context, "Password"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required()
                            ]),
                          ),
                          SizedBox(height: 10),
                          Divider(color: Colors.white,indent: 14,endIndent: 14,
                              height: 12,thickness: 0.9),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _formKey.currentState?.reset();
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
                                      onPressed: () => submitLogin(_formKey, context),
                                      child: Text("Login",
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
            )
        )
    );
  }
}
