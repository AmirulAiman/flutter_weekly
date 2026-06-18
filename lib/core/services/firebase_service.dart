import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;

  User? get currentUser => auth.currentUser;
}
