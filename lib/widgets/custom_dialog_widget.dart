import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 15, left: 15, right: 15),
          margin: EdgeInsets.only(top:15),
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.bottomLeft,
              image: AssetImage('images/ticket.png'),
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.srcOver),
              fit: BoxFit.fitHeight,
            ),
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Transport publiczny",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 25,),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "Użyj kod QR w dowolnym punkcie przy kupnie biletów, aby skorzystać ze zniżki.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                  height: 175,
                  child: Image.asset(
                    "images/qr_code.png",
                    fit: BoxFit.contain,
                  )),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}