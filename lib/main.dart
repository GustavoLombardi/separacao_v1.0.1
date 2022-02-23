import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:teste_tela/config/local_notification.dart';
import 'package:teste_tela/screens/login/login_screen.dart';
import 'package:teste_tela/stores/atualizacao_store.dart';
import 'package:teste_tela/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationPlugin().init();

  runApp(
    MultiProvider(
      providers: [
        Provider<AtualizacaoStore>.value(
          value: AtualizacaoStore(),
        ),
      ],
      child: const AppSeparacaoConferencia(),
    ),
  );
}

class AppSeparacaoConferencia extends StatelessWidget {
  const AppSeparacaoConferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // OneSignal.shared.setAppId("d86d30c0-dcea-42c7-ba2e-73942de15265");
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: androidTheme(),
        home: const LoginScreen(),
      );
    });
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromRGBO(42, 44, 43, 1),
//         body: Column(
//           children: [
//             Container(
//               color: const Color.fromRGBO(42, 44, 43, 1),
//               child: ClipPath(
//                 clipper: RoundedClipper(),
//                 child: Container(
//                   height: 300,
//                   color: Colors.white,
//                   child: Stack(
//                     children: [
//                       FadeAnimation(
//                         1.5,
//                         Align(
//                           alignment: const Alignment(-1.60, 0.00),
//                           child: Image.asset(
//                             'images/box2.png',
//                             height: 260,
//                             color: const Color.fromRGBO(196, 161, 109, 1)
//                                 .withOpacity(0.4),
//                           ),
//                         ),
//                       ),
//                       FadeAnimation(
//                         1.5,
//                         Align(
//                           alignment: const Alignment(2.00, -2.00),
//                           child: Image.asset(
//                             'images/box.png',
//                             height: 260,
//                             color: const Color.fromRGBO(196, 161, 109, 1)
//                                 .withOpacity(0.5),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           FadeAnimation(
//                             1.4,
//                             IconButton(
//                               icon: const Icon(Icons.menu),
//                               onPressed: () {},
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 20,
//                           ),
//                           Center(
//                             child: FadeAnimation(
//                               1.5,
//                               RichText(
//                                 text: TextSpan(
//                                   text: 'Olá \n',
//                                   style: GoogleFonts.poppins(
//                                       textStyle: const TextStyle(
//                                           fontSize: 35,
//                                           fontWeight: FontWeight.w600,
//                                           color:
//                                               Color.fromRGBO(0, 162, 180, 1))),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                       text: 'Usuário',
//                                       style: GoogleFonts.poppins(
//                                           textStyle: const TextStyle(
//                                               fontSize: 35,
//                                               fontWeight: FontWeight.w600,
//                                               color: Color.fromRGBO(
//                                                   42, 44, 43, 1))),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Center(
//                 child: GridView.count(
//                   childAspectRatio: 4 / 3,
//                   crossAxisCount: 2,
//                   padding: const EdgeInsets.all(20),
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   children: [
//                     FadeAnimation(
//                       1.5,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Minhas Conferências',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       1.8,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Em Andamento',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       2.0,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Liberadas',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       2.2,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Disponíveis',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       2.4,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Liberadas',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       2.6,
//                       Card(
//                         elevation: 0,
//                         color: const Color.fromRGBO(42, 44, 43, 1),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromRGBO(42, 44, 43, 1),
//                             border:
//                                 Border.all(width: 3, color: Colors.transparent),
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(20)),
//                             image: const DecorationImage(
//                               image: AssetImage(
//                                 'images/armazem.jpeg',
//                               ),
//                               opacity: 45,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           child: Align(
//                               alignment: const Alignment(-0.60, 0.90),
//                               child: Text(
//                                 'Liberadas',
//                                 style: GoogleFonts.poppins(
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)),
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             FadeAnimation(2.8, Image.asset('images/cubix1.png', height: 50)),
//             //Text('CUBIX',
//             //    style: GoogleFonts.poppins(
//             //        textStyle: const TextStyle(
//             //            fontSize: 15,
//             //            fontWeight: FontWeight.bold,
//             //            color: Colors.white))),
//           ],
//         ));
//   }
// }

class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
