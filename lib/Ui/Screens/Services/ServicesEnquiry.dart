// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
// import 'package:pioneerspay/Datebase/Entity/Parameter.dart';
// import 'package:pioneerspay/Model/Body/ServicesBody/EnquiryBody.dart';
// import 'package:pioneerspay/Ui/Screens/Services/Services.dart';
// import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
// import 'package:pioneerspay/Ui/Utils/NetworkErrorFullPage.dart';
// import 'package:pioneerspay/Ui/Utils/Progress.dart';
// import 'package:pioneerspay/Ui/Utils/RoundedButton.dart';
// import 'package:pioneerspay/Ui/Utils/UtilsFunctions.dart';
// import 'package:pioneerspay/Ui/Widgets/Services/ParameterTile.dart';
// import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
// import 'package:pioneerspay/Utils/Language/translation_strings.dart';
//
// class ServicesEnquiry extends StatefulWidget {
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   int paymentType;
//   String phone;
//   int indexValue;
//
//
//   ServicesEnquiry(this.serviceID, this.serviceName, this.currentProviderID,this.providerID,
//       this.providerName,this.categoryID,this.categoryName,this.paymentType  ,this.phone,
//   this.indexValue);
//
//
//   @override
//   _ServicesEnquiry createState() =>
//       _ServicesEnquiry(serviceID, serviceName, currentProviderID,providerID, providerName,
//           categoryID,categoryName,paymentType,phone,indexValue);
// }
//
// class _ServicesEnquiry extends State<ServicesEnquiry> {
//   String serviceID;
//   String serviceName;
//   String currentProviderID;
//   String providerID;
//   String providerName;
//   String categoryID;
//   String categoryName;
//   List<TextEditingController>? _controllers = [];
//   int paymentType;
//   String phone;
//   int indexValue;
//
//
//   _ServicesEnquiry(this.serviceID, this.serviceName, this.currentProviderID,this.providerID,
//       this.providerName,this.categoryID,this.categoryName,this.paymentType,  this.phone,
//       this.indexValue);
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQuery = MediaQuery.of(context);
//     double marginTop = mediaQuery.padding.top;
//     return Scaffold(
//       backgroundColor: GeneralColor.wGrey,
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
//             child: AppBarCustom(
//               serviceName,
//                     () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => Services(providerID, providerName,categoryID,categoryName)));
//
//               },
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const ClampingScrollPhysics(),
//               child: BlocProvider(
//                 create: (_) =>
//                     ServicesCubit()..getLocalParameters(serviceID, context),
//                 child: BlocConsumer<ServicesCubit, ServicesState>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     if (state is ParameterSuccessState) {
//                       return setParameters(state.dataList);
//                     } else if (state is ErrorState) {
//                       UtilsFunctions.createToast(state.message);
//                       return NetworkErrorFullPage();
//                     } else {
//                       return Container();
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   setParameters(List<Parameter> list) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//       child: Container(
//         padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
//         child: Column(
//           children: [
//             MediaQuery.removePadding(
//               context: context,
//               removeTop: true,
//               child: ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: list.length,
//                 itemBuilder: (context, index) {
//                   _controllers!.add(TextEditingController());
//                   if (indexValue != -1) {
//                     _controllers![indexValue].text = phone;
//                   }
//                   return ParameterTile(
//                       list[index],
//                       _controllers![index],
//                       serviceID,
//                       serviceName,
//                       currentProviderID,
//                       providerID,
//                       providerName,
//                       categoryID,
//                       categoryName,
//                       index,
//                       paymentType);                },
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
//               child: RoundedButton(
//                 Translations.of(context)!.enquiry,
//                 () {
//                   validate(list);
//                 },
//                 GeneralColor.appColor,
//                 GeneralColor.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   validate(List<Parameter> list) {
//     List<Fields> listFields = [];
//     for (int i = 0; i < list.length; i++) {
//       if (_controllers!.elementAt(i).text.isEmpty) {
//         UtilsFunctions.createToast(Translations.of(context)!.fillAllData);
//         break;
//       } else {
//         Fields fields =
//             Fields(id: list[i].id, value: _controllers!.elementAt(i).text);
//         listFields.add(fields);
//       }
//     }
//     EnquiryBody enquiryBody = EnquiryBody(
//         fields: listFields,
//         currentServiceProviderId: int.parse(currentProviderID),
//         serviceId: serviceID);
//     Progress.show(context);
//     BlocProvider.of<ServicesCubit>(context)
//         .enquiryServices(context, "V1", enquiryBody, serviceID, serviceName,paymentType);
//   }
// }
