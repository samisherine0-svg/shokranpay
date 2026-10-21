part of 'HomeCubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class InitialHomeState extends HomeState {}

////////// Categories ////////////

class CategoriesLoadState extends HomeState {}

class CategoriesSuccessState extends HomeState {
  final List<Category> dataList;

  const CategoriesSuccessState(this.dataList);
}

class CategoriesErrorState extends HomeState {
  final String message;

  const CategoriesErrorState(this.message);
}

////////// Account Info ////////////

class AccountInfoLoadState extends HomeState {}

class AccountInfoSuccessState extends HomeState {
  final c2.AccountInfoResponse accountInfo;

  const AccountInfoSuccessState(this.accountInfo);
}

class AccountInfoErrorState extends HomeState {
  final String message;

  const AccountInfoErrorState(this.message);
}
////////// Balance  ////////////

class BalanceSuccessState extends HomeState {
  final c3.BalanceResponse balanceResponse;

  const BalanceSuccessState(this.balanceResponse);
}

class BalanceLoadingState extends HomeState {
}

class BalanceErrorState extends HomeState {
  final String message;

  const BalanceErrorState(this.message);
}

////////// App Info  ////////////

class AppInfoSuccessState extends HomeState {
  final c4.AppInfoResponse appInfoResponse;

  const AppInfoSuccessState(this.appInfoResponse);
}

class AppInfoErrorState extends HomeState {
  final String message;

  const AppInfoErrorState(this.message);
}
