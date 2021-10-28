import 'package:flutter/material.dart';
import '/widgets/input_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final registerButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFFF0C631),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: () {},
        child: const Text(
          "Zarejestruj",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

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
                child: Column(
                    children: <Widget>[
                      Text("Rejestracja",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red)),
                      SizedBox(height: 20),
                      Text("Dane osobowe",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red)),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                          ),
                          hintText: "Imię",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                          ),
                          hintText: "Nazwisko",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          hintText: "Data urodzenia",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                          ),
                          hintText: "Pesel",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 20),
                      Text("Dane konta",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.red)),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.email,
                          ),
                          hintText: "E-mail",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.login,
                          ),
                          hintText: "Login",
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 10),
                      TextFieldContainer(child: TextField(
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                          ),
                          hintText: ("Hasło"),
                          border: InputBorder.none,
                        ),
                      )),
                      SizedBox(height: 30),
                      registerButton,
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
