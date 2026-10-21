// import 'package:flutter/material.dart';
// import 'package:pioneerspay/Datebase/Entity/Parameter.dart';
// import 'package:pioneerspay/Ui/Screens/Services/Contacts.dart';
// import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
// import 'package:pioneerspay/Utils/FontSizeFile.dart';
//
// class ParameterTile extends StatefulWidget {
//   Parameter parameter;
//   TextEditingController controller;
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   int index;
//   int paymentType;
//
//   ParameterTile(
//       this.parameter,
//       this.controller,
//       this.serviceID,
//       this.serviceName,
//       this.currentProviderID,
//       this.providerID,
//       this.providerName,
//       this.categoryID,
//       this.categoryName,
//       this.index,
//       this.paymentType);
//
//   @override
//   _ParameterTile createState() => _ParameterTile(
//       parameter,
//       controller,
//       serviceID,
//       serviceName,
//       currentProviderID,
//       providerID,
//       providerName,
//       categoryID,
//       categoryName,
//       index,
//       paymentType);
// }
// class _ParameterTile extends State<ParameterTile> {
//   Parameter parameter;
//   TextEditingController controller;
//   late TextInputType textInputType;
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   int index;
//   int paymentType;
//
//   _ParameterTile(
//       this.parameter,
//       this.controller,
//       this.serviceID,
//       this.serviceName,
//       this.currentProviderID,
//       this.providerID,
//       this.providerName,
//       this.categoryID,
//       this.categoryName,
//       this.index,
//       this.paymentType);
//
//   @override
//   void initState() {
//
//     if (parameter.controleType == 0||parameter.controleType == 3) {
//       textInputType = TextInputType.number;
//     } else {
//       textInputType = TextInputType.text;
//     }
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Container(
//       margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: size.width,
//             margin: const EdgeInsets.fromLTRB(2, 0, 2, 5),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   parameter.nameAr,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: FontSizeFile.xs_size,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 parameter.controleType == 3
//                     ? InkWell(
//                   child: Image.asset(
//                     'assets/images/contact.png',
//                     width: 30,
//                     height: 30,
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Contacts(
//                                 serviceID,
//                                 serviceName,
//                                 currentProviderID,
//                                 providerID,
//                                 providerName,
//                                 categoryID,
//                                 categoryName,
//                                 index,
//                                 paymentType)));
//                   },
//                 )
//                     : Container(),
//               ],
//             ),
//           ),
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               color: GeneralColor.white,
//               borderRadius: BorderRadius.circular(10.0),
//               shape: BoxShape.rectangle,
//               border: Border.all(width: 2, color: GeneralColor.appColor),
//             ),
//             child: Center(
//               child: TextField(
//                 style: TextStyle(
//                     color: GeneralColor.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: FontSizeFile.l_size),
//                 textAlign: TextAlign.center,
//                 controller: controller,
//                 keyboardType: textInputType,
//                 decoration: const InputDecoration(
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//           )
//
//         ],
//       ),
//     );
//   }
// }
