import 'package:http/retry.dart';
import 'package:weather_tracker/home_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_tracker/auth.dart';
import 'package:flutter/material.dart';


// class LoginPage extends StatefulWidget{
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = '';
//   bool isLogin = true;

//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//         );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//         );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Widget _title() {
//     return const Text('Firebase Auth');
//   }

//   Widget _entryField(
//     String title,
//     TextEditingController controller,
//   ) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: title,
//       ),
//     );
//   }

//   Widget _errorMessage() {
//     return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
//   }

//   Widget _submitButton(){
//     return ElevatedButton(
//       onPressed: isLogin ? signInWithEmailAndPassword: createUserWithEmailAndPassword, 
//       child: Text(isLogin ? 'Login' : 'Register'),
//       );
//   }

//   Widget _loginOrRegisterButton(){
//     return TextButton(
//       onPressed: () {
//         setState((){
//           isLogin = !isLogin;
//         });
//       }, 
//       child: Text(isLogin ? 'Register instead' : 'Login instead'),
//     );
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: _title(),
//       ),
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _entryField('email', _controllerEmail),
//             _entryField('password', _controllerPassword),
//             _errorMessage(),
//             _submitButton(),
//             _loginOrRegisterButton()
//           ],
//         ),
//       ),
//     );
//   }
// }


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff955cd1),
                Color(0xff3fa2fa),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.85],
            ),
          ),
        ),
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff955cd1),
              Color(0xff3fa2fa),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.2, 0.85],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Text(
                    'Welcome to Weather App!',
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            Colors.yellow.withOpacity(_animation.value),
                            Colors.red.withOpacity(_animation.value),
                          ],
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, 200.0, 0.0),
                        ),
                    ),
                  );
                },
              ),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Perform login functionality
                  // For simplicity, we will just navigate to the home page for now
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  // Add forgot password functionality
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
