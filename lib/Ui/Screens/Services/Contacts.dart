// import 'package:pioneerspay/Ui/Screens/Services/ServicesEnquiry.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';
// import 'package:pioneerspay/Ui/Widgets/Services/ContactsSection.dart';
//
// import '../../../Cubit/ServicesCubit/ServicesCubit.dart';
// import '../../../Utils/Colors/GeneralColor.dart';
// import '../../../Utils/FontSizeFile.dart';
// import '../../Utils/AppBarCustom.dart';
// import '../../Utils/NetworkErrorFullPage.dart';
// import '../../Utils/ProgressWidget.dart';
// import '../../Utils/UtilsFunctions.dart';
//
// class Contacts extends StatefulWidget {
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
//   Contacts(
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
//   _Contacts createState() => _Contacts(
//         serviceID,
//         serviceName,
//         currentProviderID,
//         providerID,
//         providerName,
//         categoryID,
//         categoryName,
//         index,
//         paymentType,
//       );
// }
//
// class _Contacts extends State<Contacts> {
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
//   _Contacts(
//       this.serviceID,
//       this.serviceName,
//       this.currentProviderID,
//       this.providerID,
//       this.providerName,
//       this.categoryID,
//       this.categoryName,
//       this.indexValue,
//       this.paymentType);
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQuery = MediaQuery.of(context);
//     double marginTop = mediaQuery.padding.top;
//     return Scaffold(
//       backgroundColor: GeneralColor.white,
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
//             child: AppBarCustom(
//               "",
//               () {},
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const ClampingScrollPhysics(),
//               child: BlocProvider(
//                 create: (_) => ServicesCubit()..getContacts(),
//                 child: BlocConsumer<ServicesCubit, ServicesState>(
//                   listener: (context, state) {},
//                   builder: (context, state) {
//                     if (state is LoadState) {
//                       return ProgressWidget();
//                     } else if (state is ContactsSuccessState) {
//                       return ContactsSection(
//                           serviceID,
//                           serviceName,
//                           currentProviderID,
//                           providerID,
//                           providerName,
//                           categoryID,
//                           categoryName,
//                           indexValue,
//                           paymentType,
//                           state.contacts);
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
// }
