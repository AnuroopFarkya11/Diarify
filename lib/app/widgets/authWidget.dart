import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model/user_model.dart';
import '../providers.dart';
import '../services/firebase.dart';
import '../services/user_store.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);
  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChanges = ref.watch(authStateChangeProvider);
    return authStateChanges.when(
      data: (user) => user != null
          ? signedInHandler(context, ref, user)
          : nonSignedInBuilder(context),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
          body: Center(
            child: Text('Something went wrong!'),
          )),
    );
  }

  FutureBuilder<UserModel?> signedInHandler(context, WidgetRef ref, User user) {

    final potentialUserFuture = FirebaseFireStore.to.getUser(user.uid);
    return FutureBuilder<UserModel?>(
        future: potentialUserFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final potentialUser = snapshot.data;
            if (potentialUser == null) {
              FirebaseFireStore.to.addUser(
                UserModel(
                  email: user.email != null ? user.email! : "",
                  phoneNumber: '',
                  photoId: '',
                  username: '',
                  uid: user.uid,
                ),
              );
              UserStore.to.saveProfile(user.uid);
            }else {
              UserStore.to.saveProfile(user.uid);
            }
            return signedInBuilder(context);
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
