import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isWeb) {
      debugPrint("Web");
      return CupertinoApp(
        home: CupertinoLoginScreen(),
      );
    } else if (UniversalPlatform.isWindows) {
      debugPrint("Windows");
      return MaterialApp(
        home: MaterialLoginScreen(),
      );
    } else {
      debugPrint("Unsupported Platform");
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Unsupported platform'),
          ),
        ),
      );
    }
  }
}

class MaterialLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdni.iconscout.com/illustration/premium/thumb/login-page-illustration-download-in-svg-png-gif-file-formats--app-developing-development-secure-mobile-webapp-and-pack-design-illustrations-3783954.png?f=webp',
              height: 200,
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 300, 
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 300, 
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, 
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                debugPrint('Forgot password clicked');
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: Color(0xffbcbcbc),
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                debugPrint('Sign up here clicked');
              },
              child: Text(
                'Sign up here',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CupertinoLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Sign up'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdni.iconscout.com/illustration/premium/thumb/sign-up-illustration-download-in-svg-png-gif-file-formats--log-register-form-user-interface-pack-design-development-illustrations-6430773.png',
                height: 200,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 300, 
                child: CupertinoTextField(
                  placeholder: 'Username',
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 300, 
                child: CupertinoTextField(
                  placeholder: 'Password',
                  obscureText: true,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: 300, 
                child: CupertinoButton(
                  color: Color(0xFFFF4500),
                  onPressed: () {
                  },
                  child: Text('Sign In'),
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  debugPrint('Reset password clicked');
                },
                child: Text(
                  'Reset your password?',
                  style: TextStyle(
                    color: Color(0xffbcbcbc),
                    fontSize: 16,
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