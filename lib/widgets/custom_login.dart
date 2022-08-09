
import 'package:desafio/widgets/component/base_color_pages/base_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomLogin extends StatelessWidget {
  const CustomLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
    color: BaseColors().getGreenColor(),
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40)),
            ),
            child: Column(
    children: <Widget>[
      Align(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/img/splash.png",
          height: 220,
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            margin: EdgeInsets.only(left: 12),
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: BaseColors().getWhiteColor(),
            ),
            child: TextField(
              decoration: InputDecoration(
                  icon: Icon(Icons.email,
                      color: BaseColors().getGreyColor()),
                  hintText: 'E-mail'),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            margin: EdgeInsets.only(top: 28, left: 12),
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: BaseColors().getWhiteColor(),
            ),
            child: TextField(
              
              decoration: InputDecoration(
                  icon: Icon(Icons.key,
                      color: BaseColors().getGreyColor()),
                  hintText: 'Password'),
              obscureText: true,
            ),
          ),
        ],
      ),
    ],
            ),
          ),
          Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 10, right: 12),
      child: RichText(
        text: TextSpan(
            text: 'Forgot your password?',
            style: TextStyle(
                color: BaseColors().getBlackColor(),
                fontSize: 14,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = () {}),
      ),
    )),
          SizedBox(height: 70),
          Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 60,
    margin: EdgeInsets.only(left: 12),
    padding: EdgeInsets.only(left: 16, right: 16, bottom: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: BaseColors().getGreenColor(),
    ),
    child: TextButton(              
         child: Center(
           child: Text(
              'Login'.toUpperCase(),
              style: TextStyle(
                  color: BaseColors().getGreenColor(),
                  fontWeight: FontWeight.bold),
            ),
         ),
          onPressed: () {  },
        ),
        
    ),
    
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
    RichText(
      text: TextSpan(
        text: "Don't have an Account?",
        style: TextStyle(
            color: BaseColors().getBlackColor(),
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    ),
    Padding(padding: EdgeInsets.only(right: 5)),
    RichText(
      text: TextSpan(
          text: 'Sign Up',
          style: TextStyle(
              color: BaseColors().getGreenColor(),
              fontSize: 14,
              fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()..onTap = () {}),
    ),
            ],
          )
        ]);
  }
}