
part of 'ReportsCubit.dart';

@immutable
abstract class ReportsState {
  const ReportsState();
}

class InitialReportsState extends ReportsState {
}


////////// Pending bills ////////////

class PendingBillsLoadState extends ReportsState {}

class PendingBillsSuccessState extends ReportsState {
  final PendingBillsResponse pendingBillsResponse;

  const PendingBillsSuccessState(this.pendingBillsResponse);
}

class PendingBillsErrorState extends ReportsState {
  final String message;

  const PendingBillsErrorState(this.message);
}

////////// Daily credit ////////////

class DailyCreditLoadState extends ReportsState {}

class DailyCreditSuccessState extends ReportsState {
  final DailyCreditResponse dailyCreditResponse;

  const DailyCreditSuccessState(this.dailyCreditResponse);
}

class DailyCreditErrorState extends ReportsState {
  final String message;

  const DailyCreditErrorState(this.message);
}