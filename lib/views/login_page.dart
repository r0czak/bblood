import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';

import '../utils/validation.dart';
import '../viewmodels/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  // editing text controllers for form fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TextFormField setup
    final emailInput = TextFormField(
        //autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          if (isEmailValid(email!)) return null;
          return ('Wprowadź poprawny email');
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.yellow),
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email lub login",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
    //password input
    final passwordInput = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (password) {
          if (isPasswordValid(password!)) return null;
          return ("Wprowadź poprawne hasło (min. 6 znaków).");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: Colors.yellow),
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Hasło",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    return ViewModelBuilder<LoginModel>.reactive(
        viewModelBuilder: () => LoginModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: const Color(0xFFDA4148),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    color: const Color(0xFFDA4148),
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: 250,
                                child: Image.asset(
                                  "images/blood_logo.png",
                                  fit: BoxFit.contain,
                                )),
                            /*const Text("Bbold",
                        style: TextStyle(fontSize: 60, color: Colors.white)),*/
                            SizedBox(
                                height: 70,
                                child: Image.asset(
                                  "images/app_name.png",
                                  fit: BoxFit.contain,
                                )),
                            const SizedBox(height: 30),
                            emailInput,
                            const SizedBox(height: 10),
                            passwordInput,
                            const SizedBox(height: 20),
                            Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFFF0C631),
                              child: MaterialButton(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    var loginSuccess =
                                        await model.signInWithEmailAndPassword(
                                            emailController.text,
                                            passwordController.text);
                                    if (loginSuccess) {
                                      Fluttertoast.showToast(
                                          msg: "Signing in succesfull!");
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: model.errorMessage);
                                    }
                                  }
                                },
                                child: const Text(
                                  "Zaloguj",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text("Zapomniałeś hasła? >",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            const SizedBox(height: 70),
                            const Text("Chcesz zostać dawcą krwi?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            const SizedBox(height: 10),
                            //register button with pressed action
                            Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xFFF0C631),
                              child: MaterialButton(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                onPressed: () {
                                  model.navigateToSignUp();
                                },
                                child: const Text(
                                  "Zarejestruj się",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));

    // return Scaffold(
    //   backgroundColor: const Color(0xFFDA4148),
    //   body: Center(
    //     child: SingleChildScrollView(
    //       child: Container(
    //         color: const Color(0xFFDA4148),
    //         child: Padding(
    //           padding: const EdgeInsets.all(45.0),
    //           child: Form(
    //             key: _formKey,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: <Widget>[
    //                 SizedBox(
    //                     height: 250,
    //                     child: Image.asset(
    //                       "images/blood_logo.png",
    //                       fit: BoxFit.contain,
    //                     )),
    //                 /*const Text("Bbold",
    //                     style: TextStyle(fontSize: 60, color: Colors.white)),*/
    //                 SizedBox(
    //                     height: 70,
    //                     child: Image.asset(
    //                       "images/app_name.png",
    //                       fit: BoxFit.contain,
    //                     )),
    //                 const SizedBox(height: 30),
    //                 emailInput,
    //                 const SizedBox(height: 10),
    //                 passwordInput,
    //                 const SizedBox(height: 20),
    //                 loginButton,
    //                 const SizedBox(height: 10),
    //                 const Text("Zapomniałeś hasła? >",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(fontSize: 14, color: Colors.white)),
    //                 const SizedBox(height: 70),
    //                 const Text("Chcesz zostać dawcą krwi?",
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(fontSize: 20, color: Colors.white)),
    //                 const SizedBox(height: 10),
    //                 registerButton,
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
