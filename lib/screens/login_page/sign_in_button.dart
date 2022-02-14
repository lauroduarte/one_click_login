import 'package:flutter/material.dart';
import '../../services/social_sign_in/social_sign_in.dart';
import 'sign_in_button_builder.dart';

enum Buttons {
  /// This is a list of all the library built buttons.
  Google,
  Facebook, 
}

class SignInButton extends StatelessWidget {
  
  
  final Buttons signInProvider;
  
  final Function onPressed;

  Function onPressedInternal;

  final String text;

  SignInButton(this.signInProvider, {@required this.onPressed, this.text}){
    switch(signInProvider){
      case Buttons.Google:
        onPressedInternal = () {
            SocialSignIn().signInWithGoogle().whenComplete(this.onPressed);
        };
      break;
      case Buttons.Facebook:
        onPressedInternal = () {
            SocialSignIn().signInWithFacebook().whenComplete(this.onPressed);
        };
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch(signInProvider){
      case Buttons.Google:
        return SignInButtonBuilder(
          key: ValueKey("Google"),
          text: text ?? 'Sign in with Google',
          textColor: Color.fromRGBO(0, 0, 0, 0.54),
          image: Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage("assets/google_logo.png"),
                height: 36.0,
              ),
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          onPressed: onPressedInternal,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          innerPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          height: 36.0,
        );
      case Buttons.Facebook:
         return SignInButtonBuilder(
          key: ValueKey("Facebook"),
          text: text ?? 'Sign in with Facebook',
          textColor: Color.fromRGBO(0, 0, 0, 0.54),
          image: Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage("assets/facebook_logo.png"),
                height: 36.0,
              ),
            ),
          ),
          backgroundColor: Color(0xFF3B5998),
          onPressed: onPressedInternal,
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          innerPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          height: 36.0,
        );
    }
  }


  //   Widget _signInButtonWithGoogle(BuildContext context) {
  //   return OutlineButton(
  //     splashColor: Colors.grey,
  //     onPressed: () {
  //           signInWithGoogle().whenComplete(() {
  //           Navigator.of(context).push(
  //               MaterialPageRoute(
  //               builder: (context) {
  //                   return FirstScreen();
  //               },
  //               ),
  //           );
  //           });
  //       },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Google',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _signInButtonWithFacebook(BuildContext context) {
  //   return OutlineButton(
  //     splashColor: Colors.grey,
  //     onPressed: () {
  //           signInWithFacebook().whenComplete(() {
  //           Navigator.of(context).push(
  //               MaterialPageRoute(
  //               builder: (context) {
  //                   return FirstScreen();
  //               },
  //               ),
  //           );
  //           });
  //       },
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
  //     highlightElevation: 0,
  //     borderSide: BorderSide(color: Colors.grey),
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           Image(image: AssetImage("assets/facebook_logo.png"), height: 35.0),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 10),
  //             child: Text(
  //               'Sign in with Facebook',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 color: Colors.grey,
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}