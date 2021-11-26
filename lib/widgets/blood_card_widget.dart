import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String? amount;

  CardWidget(this.amount);

  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        children: [
          Card(
            color: Color(0xFFDA4148),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Krew pełna", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text(amount! + " ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 40 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("25.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Card(
            color: Color(0xFFF0C631),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Osocze", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text("400 ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 15 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("06.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Card(
            color: Color(0xffff8f61),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Płytki krwi", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text("500 ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 40 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("25.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Card(
            color: Color(0xff2ac3ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Krwinki czerwone", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text("0 ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 40 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("25.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Card(
            color: Color(0xff5a65ff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Krwinki białe", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text("0 ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 40 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("25.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Card(
            color: Color(0xff96da45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 6,
            child: Column(
              children: [
                SizedBox(height: 25),
                Text("Osocze i płytki", style: TextStyle(color: Colors.white, fontSize: 24)),
                SizedBox(height: 20),
                Text("0 ml", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                SizedBox(height: 25),
                Text("Następna donacja za 40 dni", style: TextStyle(color: Colors.white, fontSize: 15)),
                SizedBox(height: 5),
                Text("25.12.2021 r.", style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
    ),
    );
  }
}