import 'package:bblood/utils/validation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../viewmodels/register_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with InputValidationMixin {
  final _formKey = GlobalKey<FormState>();

  DateTime? _birthdayDate;
  DateFormat formatter = DateFormat('yyyy-MM-dd');

  // editing text controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController peselNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    // TextFormField setup
    final firstNameInput = TextFormField(
        //autofocus: false,
        controller: firstNameController,
        keyboardType: TextInputType.name,
        validator: (firstName) {
          if (isNameValid(firstName!)) return null;
          return ("Wprowadź poprawne imię.");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Imię",
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final lastNameInput = TextFormField(
        //autofocus: false,
        controller: lastNameController,
        keyboardType: TextInputType.name,
        validator: (lastName) {
          if (isNameValid(lastName!)) return null;
          return ("Wprowadź poprawne nazwisko.");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nazwisko",
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    // birthday controller

    final peselInput = TextFormField(
        //autofocus: false,
        controller: peselNumberController,
        keyboardType: TextInputType.number,
        validator: (peselNumber) {
          if (isPeselNumberValid(peselNumber!)) return null;
          return ("Wprowadź poprawny numer pesel.");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Pesel",
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final birthdayInput = TextFormField(
        onTap: () {
          // Below line stops keyboard from appearing
          FocusScope.of(context).requestFocus(FocusNode());

          showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2022))
              .then((date) {
            setState(() {
              _birthdayDate = date;
            });
          });
        },
        // validator: (value) {
        //   if (value!.isNotEmpty) return null;
        //   return ('Wprowadź datę urodzenia.');
        // },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: _birthdayDate == null
              ? "Data urodzenia"
              : DateFormat("dd-MM-yyyy").format(_birthdayDate!).toString(),
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final emailInput = TextFormField(
        //autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (email) {
          if (isEmailValid(email!)) return null;
          return ('Wprowadź poprawny adres e-mail.');
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "E-mail",
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final passwordInput = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (password) {
          if (isPasswordValid(password!)) return null;
          return ("Wprowadź poprawne hasło (min. 6 znaków)");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Hasło",
          fillColor: Colors.white.withOpacity(0.8),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    return ViewModelBuilder<RegisterModel>.reactive(
        viewModelBuilder: () => RegisterModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: const Color(0xFFEDEDED),
              appBar: AppBar(
                title: const Text("Bbold"),
                backgroundColor: const Color(0xFFDA4148),
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/blood_logo_2reg.png'),
                        colorFilter: ColorFilter.mode(
                            const Color(0xFFEDEDED).withOpacity(0.6),
                            BlendMode.srcOver),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(45.0),
                      child: Form(
                        key: _formKey,
                        child: Column(children: <Widget>[
                          const Text("Rejestracja",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          const Text("Dane osobowe",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.red)),
                          const SizedBox(height: 10),
                          firstNameInput,
                          const SizedBox(height: 10),
                          lastNameInput,
                          const SizedBox(height: 10),
                          birthdayInput,
                          const SizedBox(height: 10),
                          peselInput,
                          const SizedBox(height: 20),
                          const Text("Dane konta",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.red)),
                          const SizedBox(height: 10),
                          emailInput,
                          // const SizedBox(height: 10),
                          // loginInput,
                          const SizedBox(height: 10),
                          passwordInput,
                          const SizedBox(height: 30),
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFFF0C631),
                            child: MaterialButton(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var registerSucces = await model
                                      .createUserWithEmailAndPassword(
                                          firstNameController.text,
                                          lastNameController.text,
                                          Timestamp.fromDate(_birthdayDate!),
                                          peselNumberController.text,
                                          emailController.text,
                                          passwordController.text);
                                  if (registerSucces) {
                                    Fluttertoast.showToast(
                                        msg: "Zarejestrowano pomyślnie!");
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: model.errorMessage);
                                  }
                                }
                              },
                              child: const Text(
                                "Utwórz konto dawcy",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
