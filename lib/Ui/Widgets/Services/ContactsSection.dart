// import 'package:flutter/material.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import '../../../Utils/Colors/GeneralColor.dart';
// import '../../../Utils/FontSizeFile.dart';
// import '../../../Utils/Language/translation_strings.dart';
// import '../../Screens/Services/ServicesEnquiry.dart';
//
// class ContactsSection extends StatefulWidget {
//   List<Contact> contacts;
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   int indexValue;
//   int paymentType;
//
//   ContactsSection(
//       this.serviceID,
//       this.serviceName,
//       this.currentProviderID,
//       this.providerID,
//       this.providerName,
//       this.categoryID,
//       this.categoryName,
//       this.indexValue,
//       this.paymentType,
//       this.contacts);
//
//   @override
//   _ContactsSection createState() => _ContactsSection(
//       serviceID,
//       serviceName,
//       currentProviderID,
//       providerID,
//       providerName,
//       categoryID,
//       categoryName,
//       indexValue,
//       paymentType,
//       contacts);
// }
//
// class _ContactsSection extends State<ContactsSection> {
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   int indexValue;
//   int paymentType;
//   List<Contact> duplicateItems;
//
//   List<Contact> contacts = [];
//   TextEditingController editingController = TextEditingController();
//
//   _ContactsSection(
//       this.serviceID,
//       this.serviceName,
//       this.currentProviderID,
//       this.providerID,
//       this.providerName,
//       this.categoryID,
//       this.categoryName,
//       this.indexValue,
//       this.paymentType,
//       this.duplicateItems);
//
//   @override
//   void initState() {
//     contacts.addAll(duplicateItems);
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.fromLTRB(15, 15, 15, 5),
//           child: TextField(
//             onChanged: (value) {
//               filterSearchResults(value);
//             },
//             controller: editingController,
//             decoration: InputDecoration(
//               labelText: Translations.of(context)!.search,
//               hintText: Translations.of(context)!.name,
//               prefixIcon: Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(15.0),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
//           child: MediaQuery.removePadding(
//             context: context,
//             removeTop: true,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 2, color: GeneralColor.appColor),
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
//               child: ListView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   itemCount: contacts.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           child: Container(
//                             width: screenWidth,
//                             padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${contacts.elementAt(index).name.first} ${contacts.elementAt(index).name.last}",
//                                   style: TextStyle(
//                                       color: GeneralColor.black,
//                                       fontSize: FontSizeFile.s_size,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 contacts.elementAt(index).phones.isEmpty
//                                     ? Container()
//                                     : Text(
//                                         contacts
//                                             .elementAt(index)
//                                             .phones
//                                             .elementAt(0)
//                                             .number,
//                                         style: TextStyle(
//                                             color: GeneralColor.black,
//                                             fontSize: FontSizeFile.s_size,
//                                             fontWeight: FontWeight.w700),
//                                       ),
//                               ],
//                             ),
//                           ),
//                           onTap: () {
//                             String phone = "";
//                             if (contacts.elementAt(index).phones.isNotEmpty) {
//                               phone = contacts
//                                   .elementAt(index)
//                                   .phones
//                                   .elementAt(0)
//                                   .number;
//                             }
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => ServicesEnquiry(
//                                         serviceID,
//                                         serviceName,
//                                         currentProviderID,
//                                         providerID,
//                                         providerName,
//                                         categoryID,
//                                         categoryName,
//                                         paymentType,
//                                         phone,
//                                         indexValue)));
//                           },
//                         ),
//                         Container(
//                           margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//                           child: Divider(
//                             height: 1,
//                             color: GeneralColor.greyText,
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   void filterSearchResults(String query) {
//     List<Contact> dummySearchList = [];
//     dummySearchList.addAll(duplicateItems);
//     if (query.isNotEmpty) {
//       List<Contact> dummyListData = [];
//       dummySearchList.forEach((item) {
//         if ("${item.name.first} ${item.name.last}".contains(query)) {
//           dummyListData.add(item);
//           print("item" + item.name.first);
//         }
//       });
//       setState(() {
//         contacts.clear();
//         contacts.addAll(dummyListData);
//       });
//       return;
//     } else {
//       print("item empty");
//       setState(() {
//         print(duplicateItems.length.toString());
//
//         contacts.clear();
//         contacts.addAll(duplicateItems);
//       });
//     }
//   }
// }
