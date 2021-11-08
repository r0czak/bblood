import 'package:bblood/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  // birthday controller
  final TextEditingController peselNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFFF0C631),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text(
          "Zarejestruj",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final firstNameInput = TextFormField(
        //autofocus: false,
        controller: firstNameController,
        keyboardType: TextInputType.name,
        validator: (firstName) {
          if (isNameValid(firstName!)) return null;
          return ("Please enter your first name!");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Imię",
          fillColor: Colors.white,
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
          return ("Please enter your last name!");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nazwisko",
          fillColor: Colors.white,
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
          return ("Please enter correct pesel number!");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Pesel",
          fillColor: Colors.white,
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
          return ('Please enter valid e-mail');
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "E-mail",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final loginInput = TextFormField(
        //autofocus: false,
        controller: loginController,
        keyboardType: TextInputType.number,
        validator: (login) {
          if (isLoginNameValid(login!)) return null;
          return ("Please enter correct login!");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Login",
          fillColor: Colors.white,
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
          return ("Please enter valid password (min. 6 characters)");
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Hasło",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final birthdayInput = TextFormField(
        onTap: () {
          // Below line stops keyboard from appearing
          FocusScope.of(context).requestFocus(new FocusNode());

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
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: _birthdayDate == null
              ? "Data urodzenia"
              : DateFormat("dd-MM-yyyy").format(_birthdayDate!).toString(),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    return Scaffold(
      //backgroundColor: const Color(0xFFDA4148),
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        title: const Text("Bbold"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFEDEDED),
            //color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  const Text("Rejestracja",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.red)),
                  const SizedBox(height: 20),
                  const Text("Dane osobowe",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.red)),
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
                      style: TextStyle(fontSize: 15, color: Colors.red)),
                  const SizedBox(height: 10),
                  emailInput,
                  const SizedBox(height: 10),
                  loginInput,
                  const SizedBox(height: 10),
                  passwordInput,
                  const SizedBox(height: 30),
                  registerButton,
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
