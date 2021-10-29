import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/front/menu_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // editing text controllers for email and password
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase authentication
  final _authentication = FirebaseAuth.instance;

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email input
    final emailInput = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value){
          if (value!.isEmpty){
            return("Please enter your email!");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
            return ("Please enter valid email");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
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
        validator: (value){
          if (value!.isEmpty){
            return("Please enter password!");
          }
          if (!RegExp(r'^.{6,}$').hasMatch(value)){
            return ("Please enter valid password (min. 6 characters)");
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Hasło",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
    //login button with pressed action
    final loginButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFF0C631),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          login(emailController.text, passwordController.text);
        },
        child: const Text(
          "Zaloguj",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    //register button with pressed action
    final registerButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFF0C631),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        onPressed: () {
          /*
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrationScreen())
          );
           */
        },
        child: const Text(
          "Zarejestruj się",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    return Scaffold(
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
                        height: 200,
                        child: Image.asset("images/blood_logo.png",
                          fit: BoxFit.contain,)
                    ),
                    const Text("Bbold",
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white)),
                    const SizedBox(height: 30),
                    emailInput,
                    const SizedBox(height: 10),
                    passwordInput,
                    const SizedBox(height: 20),
                    loginButton,
                    const SizedBox(height: 10),
                    const Text("Zapomniałeś hasła? >",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white)),
                    const SizedBox(height: 70),
                    const Text("Chcesz zostać dawcą krwi?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    registerButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login(String email, String password) async {
    if (_formKey.currentState!.validate()){
      try {
        await _authentication
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login succesfull!"),
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MenuController()))
        });
      } on FirebaseAuthException catch (error){
        switch (error.code){
          case "invalid-email":
            errorMessage = "Invalid email.";
            break;
          case "wrong-password":
            errorMessage = "Invalid password.";
            break;
          case "user-not-found":
            errorMessage = "User doesn't exist.";
            break;
          default:
            errorMessage = "Undefined error.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

}
