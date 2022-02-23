import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:teste_tela/Animation/FadeAnimation.dart';
import 'package:teste_tela/controllers/login_controller.dart';
import 'package:teste_tela/screens/home/conferente/home_screen.dart';
import 'package:teste_tela/screens/home/separador/home_screen.dart';
import 'components/form_login.dart';
import 'components/logo_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _nomeController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    getLogin();
  }

  void getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nomeController.text = prefs.getString("email") ?? "";
    _senhaController.text = prefs.getString("senha") ?? "";
  }

  void saveLogin(String email, String senha) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    prefs.setString("senha", senha);
  }

  void _onLoading() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: WillPopScope(
        onWillPop: () {
          exit(0);
        },
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(42, 44, 43, 1),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Stack(children: [
              FadeAnimation(
                1.4,
                Align(
                  alignment: const Alignment(-4.00, -1.35),
                  child: Image.asset(
                    "assets/images/box2.png",
                    color:
                        const Color.fromRGBO(196, 161, 109, 1).withOpacity(0.4),
                  ),
                ),
              ),
              FadeAnimation(
                1.6,
                Align(
                  alignment: const Alignment(5.80, 0.10),
                  child: Image.asset(
                    "assets/images/box.png",
                    color:
                        const Color.fromRGBO(196, 161, 109, 1).withOpacity(0.4),
                  ),
                ),
              ),
              FadeAnimation(
                1.8,
                Align(
                  alignment: const Alignment(-4.50, 1.35),
                  child: Image.asset(
                    "assets/images/box2.png",
                    color:
                        const Color.fromRGBO(196, 161, 109, 1).withOpacity(0.4),
                  ),
                ),
              ),
              SingleChildScrollView(
                child:
                    //  Align(
                    //    alignment: Alignment.centerRight,
                    //    child: Image.asset("images/box.png"),
                    //  ),

                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoLoginComponent(),
                    FormLoginComponent(
                      keyForm: _formKey,
                      nomeController: _nomeController,
                      senhaController: _senhaController,
                    ),
                    SizedBox(
                      width: double.infinity - 20,
                      height: 50,
                      child: OutlinedButton(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color.fromRGBO(0, 162, 180, 1),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (connectivityResult ==
                                ConnectivityResult.mobile) {
                              Get.snackbar(
                                "Sem conexão com a internet!",
                                "Verifique sua conexão e tente novamente!",
                                icon: const Icon(
                                  Icons
                                      .signal_cellular_connected_no_internet_4_bar,
                                  color: Colors.white,
                                ),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (connectivityResult ==
                                ConnectivityResult.wifi) {
                              _onLoading();
                              saveLogin(
                                _nomeController.text.toString(),
                                _senhaController.text.toString(),
                              );
                              controller
                                  .login(
                                    _nomeController.text.toString(),
                                    _senhaController.text.toString(),
                                  )
                                  .then(
                                    (value) => {
                                      Timer(
                                          const Duration(seconds: 2),
                                          () => {
                                                if (value == "S")
                                                  {
                                                    Get.offAll(
                                                        const HomeSeparadorScreen())
                                                  }
                                                else if (value == "C")
                                                  {
                                                    Get.offAll(
                                                        const HomeConferenteScreen())
                                                  }
                                                else
                                                  {
                                                    _onLoading(),
                                                    Get.snackbar(
                                                      value,
                                                      "Usuário ou senha inexistente!",
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                      backgroundColor:
                                                          Colors.red,
                                                      colorText: Colors.white,
                                                    )
                                                  }
                                              }),
                                    },
                                  );
                            } else {
                              Get.snackbar(
                                "Sem conexão com a internet!",
                                "Verifique sua conexão e tente novamente!",
                                icon: const Icon(
                                  Icons
                                      .signal_cellular_connected_no_internet_4_bar,
                                  color: Colors.white,
                                ),
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    loading
                        ? Lottie.asset(
                            "assets/images/loading1.json",
                            width: 100,
                            height: 100,
                          )
                        : const SizedBox(
                            height: 0,
                            width: 0,
                          ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
