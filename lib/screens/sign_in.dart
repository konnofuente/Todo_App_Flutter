import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:final_todo/screens/tasks_screen.dart';
import 'package:final_todo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

 @override
Widget build(BuildContext context) {
 return Authenticator(
  // builder used to show a custom sign in and sign up experience
  authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
    const padding = EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16);
    switch (state.currentStep) {
      case AuthenticatorStep.signIn:
        return Scaffold(
          body: Padding(
            padding: padding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  
                  // ignore: unnecessary_string_escapes
                  Image.asset('assets/images/todo.png'),
                  // Image.network( // <-- SEE HERE
                  //     '///png.icons8.com/microsoft_todo_2019/Fluent/1',
                  //   ),
                  // DecoratedBox(
                  //   decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //   image: AssetImage('../asset/logos/todo_logo.png')
                  // )
                  // )),
                  // // app logo
                  // const Center(child: FlutterLogo(size: 100)),
                  // prebuilt sign in form from amplify_authenticator package
                  SignInForm(),
                ],
              ),
            ),
          ),
          // custom button to take the user to sign up
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () => state.changeStep(
                    AuthenticatorStep.signUp,
                  ),
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ],
        );
      case AuthenticatorStep.signUp:
        return Scaffold(
          body: Padding(
            padding: padding,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // app logo
                  Image.asset('assets/images/todo.png'),
                  // prebuilt sign up form from amplify_authenticator package
                  SignUpForm(),
                ],
              ),
            ),
          ),
          // custom button to take the user to sign in
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => state.changeStep(
                    AuthenticatorStep.signIn,
                  ),
                  child: const Text('Sign In'),
                ),
              ],
            ),
          ],
        );
      default:
        // returning null defaults to the prebuilt authenticator for all other steps
        return null;
    }
  },
  child: MaterialApp(
    builder: Authenticator.builder(),
    home: TasksScreen(),
  ),
);
}
}

// 