import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();
  Color buttonColor = Color.fromARGB(156, 57, 81, 68);

  static String username = "";
  String password1 = "";
  static String statusMessage = "";
  static String role = "";
  late int idUser;

  void _initLogin(request) async {
    final response = await request
        .login("https://pbpf01-midterm.up.railway.app/authentication/login", {
      'username': username,
      'password': password1,
    }).then((value) {
      final newValue = new Map<String, dynamic>.from(value);

      setState(() {
        if (newValue['status'] == true) {
          statusMessage = newValue['message'].toString();
          role = newValue['user_data']['role'].toString();
          idUser = newValue['user_data']['id'];
        } else {
          statusMessage = newValue['message'].toString();
        }
      });
    });

    if (request.loggedIn) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('role', role);
      await prefs.setInt('idUser', idUser);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Login success!"),
      ));
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: Color.fromARGB(156, 57, 81, 68),
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
                        height: 50,
                        width: 400,
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
                                      filled: true,
                                      fillColor: Colors.white,
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
                                      filled: true,
                                      fillColor: Colors.white,
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
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ]),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Column(
                    children: [
                      Text("Logged in as ${username}"),
                      Text((role == "K"
                          ? "Konsumen"
                          : (role == "I" ? "Investor" : "Pemilik"))),
                      ElevatedButton(
                        child: Text("Logout"),
                        onPressed: () async {
                          await request.logout(
                              "https://pbpf01-midterm.up.railway.app/authentication/logout");
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ));
  }
}
