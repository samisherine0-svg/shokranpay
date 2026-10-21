
part of 'ServicesCubit.dart';

@immutable
abstract class ServicesState {
  const ServicesState();
}

class InitialServicesState extends ServicesState {}

class ErrorState extends ServicesState {
  final String message;

  const ErrorState(this.message);
}
class LoadState extends ServicesState {
}


class ProvidersSuccessState extends ServicesState {
  final List<Provider> dataList;

  const ProvidersSuccessState(this.dataList);
}

class ServicesSuccessState extends ServicesState {
  final List<Service> dataList;

  const ServicesSuccessState(this.dataList);
}

class ParameterSuccessState extends ServicesState {
  final List<Parameter> dataList;

  const ParameterSuccessState(this.dataList);
}

// class ContactsSuccessState extends ServicesState {
//   final List<Contact> contacts;
//
//   const ContactsSuccessState(this.contacts);
// }


