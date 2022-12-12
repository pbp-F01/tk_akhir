import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromARGB(156, 57, 81, 68);

  String username = "";
  String password1 = "";
  String statusMessage = "";

  void _initLogin(request) async {
    final response = await request
        .login("https://pbpf01-midterm.up.railway.app/authentication/login", {
      'username': username,
      'password': password1,
    }).then((value) {
      final newValue = new Map<String, dynamic>.from(value);

      setState(() {
        if (newValue['message'].toString() ==
            "Failed to Login, Account Disabled.") {
          statusMessage = "Invalid username/password!";
        } else
          statusMessage = newValue['message'].toString();
      });
    });

    if (request.loggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login success!"),
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // The rest of your widgets are down below
    // 'username' and 'password' should be the values of the user login form.

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: (request.loggedIn == false)
            ? Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/logogoumkm.png",
                        height: 70,
                        width: 70,
                      ),
                      Form(
                        key: _loginFormKey,
                        child: SingleChildScrollView(
                            child: Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Login to GoUMKM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color.fromARGB(178, 3, 3, 3)),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Username ",
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        username = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        username = value!;
                                      });
                                    },
                                    // Validator sebagai validasi form
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please fill out this field.";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  // Menggunakan padding sebesar 8 pixels
                                  padding: const EdgeInsets.all(8.0),

                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Password ",
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                    // Menambahkan behavior saat nama diketik
                                    onChanged: (String? value) {
                                      setState(() {
                                        password1 = value!;
                                      });
                                    },
                                    // Menambahkan behavior saat data disimpan
                                    onSaved: (String? value) {
                                      setState(() {
                                        password1 = value!;
                                      });
                                    },
                                    // Validator sebagai validasi form
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please fill out this field.";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                buttonColor),
                                      ),
                                      onPressed: () {
                                        if (_loginFormKey.currentState!
                                            .validate()) {
                                          _initLogin(request);
                                        }
                                      }),
                                ),
                                Text(statusMessage),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/register');
                                    },
                                    child: Text(
                                      "Don't have an account yet? Sign up",
                                      style: TextStyle(color: buttonColor),
                                    ))
                              ]),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: ElevatedButton(
                  child: Text("Logout"),
                  onPressed: () async {
                    await request.logout(
                        "https://pbpf01-midterm.up.railway.app/authentication/logout");
                    setState(() {});
                  },
                ),
              ));
  }
}
