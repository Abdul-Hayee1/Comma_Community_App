import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final FirebaseAuth _auth;

  AuthNotifier(this._auth) : super(const AsyncValue.data(null));

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    state = const AsyncValue.loading();
    try {
      if (password.length < 6) {
        throw FirebaseAuthException(
          code: 'weak-password',
          message: 'Password must be at least 6 characters',
        );
      }

      if (!email.contains('@')) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'Enter a valid email address',
        );
      }

      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      User? user = userCredential.user;

      // Save user data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
        'status': 'pending',
      });

      // Optionally update displayName in Firebase Auth profile
      await user.updateDisplayName('$firstName $lastName');

      state = AsyncValue.data(userCredential.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Map<String, String>? getErrorDetails(dynamic error) {
    if (error is! FirebaseAuthException) return null;

    switch (error.code) {
      case 'email-already-in-use':
        return {'email': 'Email already in use'};
      case 'invalid-email':
        return {'email': 'Enter a valid email address'};
      case 'operation-not-allowed':
        return {'general': 'Email/password not enabled'};
      case 'weak-password':
        return {'password': 'Password must be at least 6 characters'};
      default:
        return {'general': error.message ?? 'Authentication failed'};
    }
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<User?>>(
  (ref) => AuthNotifier(ref.read(firebaseAuthProvider)),
);

final authErrorDetailsProvider = Provider<Map<String, String>?>((ref) {
  final state = ref.watch(authNotifierProvider);
  return state.hasError
      ? ref.read(authNotifierProvider.notifier).getErrorDetails(state.error)
      : null;
});
