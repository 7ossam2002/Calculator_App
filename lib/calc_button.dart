
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  String btnText;
  Function OnButtonClicked;
  CalcButton({super.key,required this.btnText,required this.OnButtonClicked});
  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: Container(
          margin: EdgeInsets.all(1),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )
              ),
              onPressed: (){
                OnButtonClicked(btnText);
              },
          child: Text(btnText,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),)),
        )
    );
  }
}
