import 'package:carwash/controller/AuthController.dart';
import 'package:carwash/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: auth.email,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: auth.password,
                    obscureText: auth.hiddenPass.value,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: auth.hiddenPass.value
                            ? const Icon(
                                Icons.remove_red_eye_outlined,
                              )
                            : const Icon(
                                Icons.remove_red_eye,
                                color: Colors.orange,
                              ),
                        onPressed: () {
                          auth.hiddenPass.toggle();
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {/* Handle forgot password */},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      auth.login(
                        auth.email.text,
                        auth.password.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 132, 179, 232),
                      minimumSize: const Size(250, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: auth.isLoading.value
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Login",
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
                      const Text("Belum Punya akun?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routers.register);
                        },
                        child: const Text(
                          "Daftar Disini",
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
      ),
    );
  }
}
