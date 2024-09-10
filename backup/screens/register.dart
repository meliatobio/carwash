import 'package:carwash/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:carwash/models/register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namaUserController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  bool _isLoading = false;
  bool _isObscured = true;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: namaUserController,
                  decoration: InputDecoration(
                    labelText: "Nama User",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: noHpController,
                  decoration: InputDecoration(
                    labelText: "Nomor HP",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16.0),
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          setState(() {
                            _isLoading = true;
                            _errorMessage = null;
                          });

                          final registerModel = RegisterModel(
                            namaUser: namaUserController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            noHp: noHpController.text,
                            alamat: alamatController.text,
                          );

                          final success = await registerModel.register();
                          if (success) {
                            Navigator.pop(
                                context); // Kembali ke halaman sebelumnya setelah berhasil
                          } else {
                            setState(() {
                              _errorMessage =
                                  'Registration failed. Please try again.';
                            });
                          }

                          setState(() {
                            _isLoading = false;
                          });
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 132, 179, 232),
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah Punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Login Disini",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
