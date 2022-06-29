// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:printest/controller/constants.dart';
// import 'package:printest/controller/controller.dart';

// class Reset extends StatefulWidget {
//   const Reset({Key key}) : super(key: key);

//   @override
//   _ResetState createState() => _ResetState();
// }

// class _ResetState extends State<Reset> {
//   final auth = FirebaseAuth.instance;
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _controller = TextEditingController();
//   Controller controller = Controller();
//   Constants constants = Constants();
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Forgot Password'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         elevation: 0,
//         toolbarHeight: 100,
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30.0),
//                 topRight: Radius.circular(30.0),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Reset Password",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontFamily: 'Poppins'),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text(
//                     "Please enter your email to receive a",
//                     style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
//                   ),
//                   const Text(
//                     "link to create a new password via email",
//                     style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   MyTextField("Email", 5.0, 15.0, 5.0, _controller),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   isLoading == false
//                       ? ElevatedButton(
//                           onPressed: () async {
//                             if (_formKey.currentState.validate()) {
//                               await controller.resetPassword(_controller.text);
//                               setState(() {
//                                 isLoading = true;
//                               });
//                               try {
//                                 await setState(() {
//                                   isLoading = false;
//                                 });
//                                 _controller.text = "";
//                               } on FirebaseAuthException catch (e) {
//                                 constants.newSnackbar(e.toString(), '');
//                               }
//                             }
//                           },
//                           child: const Text('Next'),
//                           style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                               primary: Colors.black,
//                               fixedSize: const Size(220, 45)),
//                         )
//                       : CircularProgressIndicator(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget textField(
//   String hintText,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(left: 15, right: 15),
//     child: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please Enter Some Text';
//         }
//         return null;
//       },
//       keyboardType: TextInputType.text,
//       controller: TextEditingController(),
//       decoration: InputDecoration(
//         contentPadding:
//             const EdgeInsets.only(bottom: 2.0, top: 2.0, left: 25.0),
//         fillColor: Colors.grey[200],
//         filled: true,
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey[700]),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: const BorderSide(color: Colors.transparent)),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: const BorderSide(color: Colors.transparent)),
//       ),
//     ),
//   );
// }
