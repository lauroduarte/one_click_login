import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SocialSignIn{

  

  static SocialSignIn _instance;
  factory SocialSignIn() {
    _instance ??= SocialSignIn._internalConstructor();
    return _instance;
  }
  SocialSignIn._internalConstructor();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookSignIn = new FacebookLogin();

  String name;
  String email;
  String imageUrl;

  Function signIn;
  Function signOut;

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    await _auth.signInWithCredential(credential);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoUrl;// Only taking the first part of the name, i.e., First Nameif (name.contains(" ")) {   name = name.substring(0, name.indexOf(" "));}

    signOut = () => signOutGoogle();

    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async{
    await googleSignIn.signOut();

    print("Google: User Sign Out");
  }


    Future<String> signInWithFacebook() async {
      final FacebookLoginResult result = await facebookSignIn.logIn(['email', 'public_profile']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final token = result.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,first_name,email,picture&access_token=${token}');
          final Map<String, dynamic> profile = json.decode(graphResponse.body);        

          name = profile['name'];
          email = profile['email'];
          imageUrl = profile['picture']['data']['url'];

          signOut = () => signOutFacebook();

          return 'signInWithGoogle succeeded';
        case FacebookLoginStatus.cancelledByUser:
          return 'Facebook login cancelled';
        case FacebookLoginStatus.error:
          return result.errorMessage;
      }
    }

  void signOutFacebook() async{
    await facebookSignIn.logOut();
    print("Facebook: User Sign Out");
  }
}