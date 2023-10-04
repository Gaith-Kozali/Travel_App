import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/features/features_auth/data/models/client_model.dart';
import '../../domain/entities/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RemoteDataSourceAuth {
  Future<ClientModel> signInWithGoogle();
  Future<void> anonymousSignIn();
  Future<ClientModel> signInWithEmailAndPassword(String email, String password);
  Future signUp(Client user);
}

// implements from the RemoteDataSource to save the form of
// function after make any update of code work of it

class RemoteDataSourceAuthFireBase implements RemoteDataSourceAuth {
  User? client;
  @override
  Future anonymousSignIn() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Future<ClientModel> signInWithEmailAndPassword(
      String email, String password) async {
    print("before sign in with password: $password");

    UserCredential u = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("before git data from data base in sign in remote data");
    // git the information from the database after sign in using user id
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("clients")
        .doc(u.user!.uid)
        .get();

    Map<String, dynamic>? data = snapshot.data();

    print("the data from the Firestore after login: $data");

    return ClientModel(
        firstName: data!['first name'],
        lastName: data!['last name'],
        email: email, // Use the provided email parameter
        phone: data!['phone'],
        profile: "",
        date: data!['date'],
        isLogin: data!['is login'],
        password: "");
  }

  @override
  Future<ClientModel> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final UserCredential u =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return ClientModel(
      firstName: client?.displayName,
      lastName: "",
      email: client?.email,
      phone: client?.phoneNumber,
      profile: client?.photoURL,
      isLogin: true,
    );
  }

  @override
  Future<ClientModel> signUp(Client user) async {
    UserCredential u =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email ?? "",
      password: user.password ?? "",
    );
    print("sign up is success in data source remote");
// add the information of client to fire store data base
    await FirebaseFirestore.instance
        .collection("clients")
        .doc(u.user?.uid)
        .set({
      'first name': user.firstName,
      'last name': user.lastName,
      'date': user.date,
      'phone': user.phone,
      'is login': true
    });

    return ClientModel(
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email, // Use the provided email parameter
        phone: user.phone,
        profile: "",
        date: user.date,
        isLogin: user.isLogin,
        password: "");
  }
}
