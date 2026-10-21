import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'lang/messages_all.dart';

class Translations {
  static Future<Translations> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translations();
    });
  }

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  String get appName {
    return Intl.message(
      'appName',
      name: 'appName',
    );
  }

  String get userName {
    return Intl.message(
      'userName',
      name: 'userName',
    );
  }

  String get password {
    return Intl.message(
      'password',
      name: 'password',
    );
  }

  String get saveData {
    return Intl.message(
      'saveData',
      name: 'saveData',
    );
  }

  String get help {
    return Intl.message(
      'help',
      name: 'help',
    );
  }

  String get createAcc {
    return Intl.message(
      'createAcc',
      name: 'createAcc',
    );
  }


  String get listOfMerchants {
    return Intl.message(
      'listOfMerchants',
      name: 'listOfMerchants',
    );
  }
  String get followMerchantBalances {
    return Intl.message(
      'followMerchantBalances',
      name: 'followMerchantBalances',
    );
  }

  String get raiseDeposit {
    return Intl.message(
      'raiseDeposit',
      name: 'raiseDeposit',
    );
  }

  String get followDeposits {
    return Intl.message(
      'followDeposits',
      name: 'followDeposits',
    );
  }

  String get orderNumber2
  {
    return Intl.message(
      'orderNumber2',
      name: 'orderNumber2',
    );
  }

  String get depositImage
  {
    return Intl.message(
      'depositImage',
      name: 'depositImage',
    );
  }

  String get forgetPass {
    return Intl.message(
      'forgetPass',
      name: 'forgetPass',
    );
  }

  String get showAndroidID {
    return Intl.message(
      'showAndroidID',
      name: 'showAndroidID',
    );
  }

  String get fillAllData {
    return Intl.message(
      'fillAllData',
      name: 'fillAllData',
    );
  }

  String get mustUpdateApp {
    return Intl.message(
      'mustUpdateApp',
      name: 'mustUpdateApp',
    );
  }

  String get userNotFound {
    return Intl.message(
      'userNotFound',
      name: 'userNotFound',
    );
  }

  String get userBlocked {
    return Intl.message(
      'userBlocked',
      name: 'userBlocked',
    );
  }

  String get fillData {
    return Intl.message(
      'fillData',
      name: 'fillData',
    );
  }

  String get centerName {
    return Intl.message(
      'centerName',
      name: 'centerName',
    );
  }

  String get centerNumber {
    return Intl.message(
      'centerNumber',
      name: 'centerNumber',
    );
  }

  String get phoneNum {
    return Intl.message(
      'phoneNum',
      name: 'phoneNum',
    );
  }

  String get enterCode {
    return Intl.message(
      'enterCode',
      name: 'enterCode',
    );
  }

  String get confirmCode {
    return Intl.message(
      'confirmCode',
      name: 'confirmCode',
    );
  }

  String get resendCode {
    return Intl.message(
      'resendCode',
      name: 'resendCode',
    );
  }

  String get login {
    return Intl.message(
      'login',
      name: 'login',
    );
  }

  String get doneSend {
    return Intl.message(
      'doneSend',
      name: 'doneSend',
    );
  }

  String get services {
    return Intl.message(
      'services',
      name: 'services',
    );
  }

  String get requestBalance {
    return Intl.message(
      'requestBalance',
      name: 'requestBalance',
    );
  }

  String get reports {
    return Intl.message(
      'reports',
      name: 'reports',
    );
  }

  String get processes {
    return Intl.message(
      'processes',
      name: 'processes',
    );
  }

  String get search {
    return Intl.message(
      'search',
      name: 'search',
    );
  }

  String get showReceipts {
    return Intl.message(
      'showReceipts',
      name: 'showReceipts',
    );
  }

  String get showTickets {
    return Intl.message(
      'showTickets',
      name: 'showTickets',
    );
  }

  String get dailyCredit {
    return Intl.message(
      'dailyCredit',
      name: 'dailyCredit',
    );
  }

  String get collectedCommission {
    return Intl.message(
      'collectedCommission',
      name: 'collectedCommission',
    );
  }

  String get returnedReports {
    return Intl.message(
      'returnedReports',
      name: 'returnedReports',
    );
  }

  String get transferBalance {
    return Intl.message(
      'transferBalance',
      name: 'transferBalance',
    );
  }

  String get createNewAcc {
    return Intl.message(
      'createNewAcc',
      name: 'createNewAcc',
    );
  }

  String get agentsCredits {
    return Intl.message(
      'agentsCredits',
      name: 'agentsCredits',
    );
  }

  String get uploadReceipt {
    return Intl.message(
      'uploadReceipt',
      name: 'uploadReceipt',
    );
  }

  String get addTicket {
    return Intl.message(
      'addTicket',
      name: 'addTicket',
    );
  }

  String get sendMyPlace {
    return Intl.message(
      'sendMyPlace',
      name: 'sendMyPlace',
    );
  }

  String get airCharge {
    return Intl.message(
      'airCharge',
      name: 'airCharge',
    );
  }

  String get chargeCards {
    return Intl.message(
      'chargeCards',
      name: 'chargeCards',
    );
  }

  String get mobileBills {
    return Intl.message(
      'mobileBills',
      name: 'mobileBills',
    );
  }

  String get landPhoneBill {
    return Intl.message(
      'landPhoneBill',
      name: 'landPhoneBill',
    );
  }

  String get internetBills {
    return Intl.message(
      'internetBills',
      name: 'internetBills',
    );
  }

  String get fawryPay {
    return Intl.message(
      'fawryPay',
      name: 'fawryPay',
    );
  }

  String get errorPleaseTryAgain {
    return Intl.message(
      'errorPleaseTryAgain',
      name: 'errorPleaseTryAgain',
    );
  }

  String get waitMoments {
    return Intl.message(
      'waitMoments',
      name: 'waitMoments',
    );
  }

  String get financialTransactions {
    return Intl.message(
      'financialTransactions',
      name: 'financialTransactions',
    );
  }

  String get generalFacilities {
    return Intl.message(
      'generalFacilities',
      name: 'generalFacilities',
    );
  }

  String get onlinePayment {
    return Intl.message(
      'onlinePayment',
      name: 'onlinePayment',
    );
  }

  String get education {
    return Intl.message(
      'education',
      name: 'education',
    );
  }

  String get insurances {
    return Intl.message(
      'insurances',
      name: 'insurances',
    );
  }

  String get channels {
    return Intl.message(
      'channels',
      name: 'channels',
    );
  }

  String get credit {
    return Intl.message(
      'credit',
      name: 'credit',
    );
  }

  String get creditType {
    return Intl.message(
      'creditType',
      name: 'creditType',
    );
  }

  String get viewDeposits {
    return Intl.message(
      'viewDeposits',
      name: 'viewDeposits',
    );
  }

  String get customerNumber {
    return Intl.message(
      'customerNumber',
      name: 'customerNumber',
    );
  }

  String get merchantCode {
    return Intl.message(
      'merchantCode',
      name: 'merchantCode',
    );
  } String get accountDateOpen {
    return Intl.message(
      'accountDateOpen',
      name: 'accountDateOpen',
    );
  }
  String get machineType {
    return Intl.message(
      'machineType',
      name: 'machineType',
    );
  }  String get machineSerial {
    return Intl.message(
      'machineSerial',
      name: 'machineSerial',
    );
  }

  String get other {
    return Intl.message(
      'other',
      name: 'other',
    );
  }

  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
    );
  }

  String get notifications {
    return Intl.message(
      'notifications',
      name: 'notifications',
    );
  }

  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
    );
  }

  String get contacting {
    return Intl.message(
      'contacting',
      name: 'contacting',
    );
  }

  String get tickets {
    return Intl.message(
      'tickets',
      name: 'tickets',
    );
  }

  String get syndicates {
    return Intl.message(
      'syndicates',
      name: 'syndicates',
    );
  }

  String get games {
    return Intl.message(
      'games',
      name: 'games',
    );
  }

  String get donations {
    return Intl.message(
      'donations',
      name: 'donations',
    );
  }

  String get installments {
    return Intl.message(
      'installments',
      name: 'installments',
    );
  }

  String get requestProducts {
    return Intl.message(
      'requestProducts',
      name: 'requestProducts',
    );
  }

  String get internetCodes {
    return Intl.message(
      'internetCodes',
      name: 'internetCodes',
    );
  }

  String get offers {
    return Intl.message(
      'offers',
      name: 'offers',
    );
  }

  String get enquiry {
    return Intl.message(
      'enquiry',
      name: 'enquiry',
    );
  }

  String get send {
    return Intl.message(
      'send',
      name: 'send',
    );
  }

  String get amount {
    return Intl.message(
      'amount',
      name: 'amount',
    );
  }

  String get pay {
    return Intl.message(
      'pay',
      name: 'pay',
    );
  }

  String get commission {
    return Intl.message(
      'commission',
      name: 'commission',
    );
  }

  String get serviceCost {
    return Intl.message(
      'serviceCost',
      name: 'serviceCost',
    );
  }

  String get totalAmount {
    return Intl.message(
      'totalAmount',
      name: 'totalAmount',
    );
  }

  String get oldPass {
    return Intl.message(
      'oldPass',
      name: 'oldPass',
    );
  }

  String get newPass {
    return Intl.message(
      'newPass',
      name: 'newPass',
    );
  }

  String get confirmNewPass {
    return Intl.message(
      'confirmNewPass',
      name: 'confirmNewPass',
    );
  }

  String get processDone {
    return Intl.message(
      'processDone',
      name: 'processDone',
    );
  }

  String get changeLang {
    return Intl.message(
      'changeLang',
      name: 'changeLang',
    );
  }

  String get arabic {
    return Intl.message(
      'arabic',
      name: 'arabic',
    );
  }

  String get english {
    return Intl.message(
      'english',
      name: 'english',
    );
  }

  String get change {
    return Intl.message(
      'change',
      name: 'change',
    );
  }

  String get print {
    return Intl.message(
      'print',
      name: 'print',
    );
  }

  String get female {
    return Intl.message(
      'female',
      name: 'female',
    );
  }

  String get available {
    return Intl.message(
      'available',
      name: 'available',
    );
  }

  String get book {
    return Intl.message(
      'book',
      name: 'book',
    );
  }

  String get updateMyData {
    return Intl.message(
      'updateMyData',
      name: 'updateMyData',
    );
  }

  String get confirmData {
    return Intl.message(
      'confirmData',
      name: 'confirmData',
    );
  }

  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
    );
  }

  String get registerFirst {
    return Intl.message(
      'registerFirst',
      name: 'registerFirst',
    );
  }

  String get from {
    return Intl.message(
      'from',
      name: 'from',
    );
  }

  String get to {
    return Intl.message(
      'to',
      name: 'to',
    );
  }

  String get showReports {
    return Intl.message(
      'showReports',
      name: 'showReports',
    );
  }

  String get enterReportNum {
    return Intl.message(
      'enterReportNum',
      name: 'enterReportNum',
    );
  }

  String get commissionForPeriod {
    return Intl.message(
      'commissionForPeriod',
      name: 'commissionForPeriod',
    );
  }

  String get chooseLang {
    return Intl.message(
      'chooseLang',
      name: 'chooseLang',
    );
  }

  String get show {
    return Intl.message(
      'show',
      name: 'show',
    );
  }

  String get results {
    return Intl.message(
      'results',
      name: 'results',
    );
  }

  String get noReports {
    return Intl.message(
      'noReports',
      name: 'noReports',
    );
  }

  String get date {
    return Intl.message(
      'date',
      name: 'date',
    );
  }

  String get balanceBefore {
    return Intl.message(
      'balanceBefore',
      name: 'balanceBefore',
    );
  }

  String get balanceAfter {
    return Intl.message(
      'balanceAfter',
      name: 'balanceAfter',
    );
  }

  String get details {
    return Intl.message(
      'details',
      name: 'details',
    );
  }

  String get rePrint {
    return Intl.message(
      'rePrint',
      name: 'rePrint',
    );
  }

  String get status {
    return Intl.message(
      'status',
      name: 'status',
    );
  }

  String get collectedCommForPeriod {
    return Intl.message(
      'collectedCommForPeriod',
      name: 'collectedCommForPeriod',
    );
  }

  String get noCommission {
    return Intl.message(
      'noCommission',
      name: 'noCommission',
    );
  }

  String get noReceipts {
    return Intl.message(
      'noReceipts',
      name: 'noReceipts',
    );
  }

  String get orderNumber {
    return Intl.message(
      'orderNumber',
      name: 'orderNumber',
    );
  }

  String get agentName {
    return Intl.message(
      'agentName',
      name: 'agentName',
    );
  }

  String get name {
    return Intl.message(
      'name',
      name: 'name',
    );
  }

  String get consumer {
    return Intl.message(
      'consumer',
      name: 'consumer',
    );
  }

  String get retrieved {
    return Intl.message(
      'retrieved',
      name: 'retrieved',
    );
  }

  String get addedBalance {
    return Intl.message(
      'addedBalance',
      name: 'addedBalance',
    );
  }

  String get convertedFromHim {
    return Intl.message(
      'convertedFromHim',
      name: 'convertedFromHim',
    );
  }

  String get transformer {
    return Intl.message(
      'transformer',
      name: 'transformer',
    );
  }

  String get profit {
    return Intl.message(
      'profit',
      name: 'profit',
    );
  }

  String get commissionDifference {
    return Intl.message(
      'commissionDifference',
      name: 'commissionDifference',
    );
  }

  String get title {
    return Intl.message(
      'title',
      name: 'title',
    );
  }

  String get description {
    return Intl.message(
      'description',
      name: 'description',
    );
  }

  String get add {
    return Intl.message(
      'add',
      name: 'add',
    );
  }

  String get notes {
    return Intl.message(
      'notes',
      name: 'notes',
    );
  }

  String get clientName {
    return Intl.message(
      'clientName',
      name: 'clientName',
    );
  }

  String get fullNameClient {
    return Intl.message(
      'fullNameClient',
      name: 'fullNameClient',
    );
  }

  String get ticketAdded {
    return Intl.message(
      'ticketAdded',
      name: 'ticketAdded',
    );
  }

  String get sendDone {
    return Intl.message(
      'sendDone',
      name: 'sendDone',
    );
  }

  String get notEnoughCredit {
    return Intl.message(
      'notEnoughCredit',
      name: 'notEnoughCredit',
    );
  }

  String get uploadRec {
    return Intl.message(
      'uploadRec',
      name: 'uploadRec',
    );
  }

  String get bank {
    return Intl.message(
      'bank',
      name: 'bank',
    );
  }

  String get personalProfile {
    return Intl.message(
      'personalProfile',
      name: 'personalProfile',
    );
  }

  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
    );
  }

  String get changePass {
    return Intl.message(
      'changePass',
      name: 'changePass',
    );
  }

  String get retryPass {
    return Intl.message(
      'retryPass',
      name: 'retryPass',
    );
  }

  String get invalidPass {
    return Intl.message(
      'invalidPass',
      name: 'invalidPass',
    );
  }

  String get doneChangePassword {
    return Intl.message(
      'doneChangePassword',
      name: 'doneChangePassword',
    );
  }

  String get notFoundCredits {
    return Intl.message(
      'notFoundCredits',
      name: 'notFoundCredits',
    );
  }

  String get operationID {
    return Intl.message(
      'operationID',
      name: 'operationID',
    );
  }

  String get chargeCode {
    return Intl.message(
      'chargeCode',
      name: 'chargeCode',
    );
  }

  String get serial {
    return Intl.message(
      'serial',
      name: 'serial',
    );
  }

  String get cardValue {
    return Intl.message(
      'cardValue',
      name: 'cardValue',
    );
  }

  String get cancelBook {
    return Intl.message(
      'cancelBook',
      name: 'cancelBook',
    );
  }

  String get update {
    return Intl.message(
      'update',
      name: 'update',
    );
  }

  String get callUs {
    return Intl.message(
      'callUs',
      name: 'callUs',
    );
  }

  String get aboutUs {
    return Intl.message(
      'aboutUs',
      name: 'aboutUs',
    );
  }

  String get favourite {
    return Intl.message(
      'favourite',
      name: 'favourite',
    );
  }

  String get myPoints {
    return Intl.message(
      'myPoints',
      name: 'myPoints',
    );
  }

  String get changeDate {
    return Intl.message(
      'changeDate',
      name: 'changeDate',
    );
  }

  String get cancelReservation {
    return Intl.message(
      'cancelReservation',
      name: 'cancelReservation',
    );
  }

  String get areSureCancelReservation {
    return Intl.message(
      'areSureCancelReservation',
      name: 'areSureCancelReservation',
    );
  }

  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
    );
  }

  String get no {
    return Intl.message(
      'no',
      name: 'no',
    );
  }

  String get detectProblem {
    return Intl.message(
      'detectProblem',
      name: 'detectProblem',
    );
  }

  String get doctorDidNotAttend {
    return Intl.message(
      'doctorDidNotAttend',
      name: 'doctorDidNotAttend',
    );
  }

  String get clinicHasPostponed {
    return Intl.message(
      'clinicHasPostponed',
      name: 'clinicHasPostponed',
    );
  }

  String get clinicAddressIncorrect {
    return Intl.message(
      'clinicAddressIncorrect',
      name: 'clinicAddressIncorrect',
    );
  }

  String get noReservationThroughApp {
    return Intl.message(
      'noReservationThroughApp',
      name: 'noReservationThroughApp',
    );
  }

  String get prescriptionHelp {
    return Intl.message(
      'prescriptionHelp',
      name: 'prescriptionHelp',
    );
  }

  String get otherProblem {
    return Intl.message(
      'otherProblem',
      name: 'otherProblem',
    );
  }

  String get happyReceiveOpinionsSuggestions {
    return Intl.message(
      'happyReceiveOpinionsSuggestions',
      name: 'happyReceiveOpinionsSuggestions',
    );
  }

  String get writeComment {
    return Intl.message(
      'writeComment',
      name: 'writeComment',
    );
  }

  String get updateReservation {
    return Intl.message(
      'updateReservation',
      name: 'updateReservation',
    );
  }

  String get currentReservation {
    return Intl.message(
      'currentReservation',
      name: 'currentReservation',
    );
  }

  String get thanks {
    return Intl.message(
      'thanks',
      name: 'thanks',
    );
  }

  String get specializedIn {
    return Intl.message(
      'specializedIn',
      name: 'specializedIn',
    );
  }

  String get promoCodes {
    return Intl.message(
      'promoCodes',
      name: 'promoCodes',
    );
  }

  String get reservationHasBeenSuccessfullyChanged {
    return Intl.message(
      'reservationHasBeenSuccessfullyChanged',
      name: 'reservationHasBeenSuccessfullyChanged',
    );
  }

  String get bookedWith {
    return Intl.message(
      'bookedWith',
      name: 'bookedWith',
    );
  }

  String get day {
    return Intl.message(
      'day',
      name: 'day',
    );
  }

  String get contactUs {
    return Intl.message(
      'contactUs',
      name: 'contactUs',
    );
  }

  String get weHappyForAsking {
    return Intl.message(
      'weHappyForAsking',
      name: 'weHappyForAsking',
    );
  }

  String get addYourMsg {
    return Intl.message(
      'addYourMsg',
      name: 'addYourMsg',
    );
  }

  String get forExtraInfo {
    return Intl.message(
      'forExtraInfo',
      name: 'forExtraInfo',
    );
  }

  String get fifo {
    return Intl.message(
      'fifo',
      name: 'fifo',
    );
  }

  String get entryAppointment {
    return Intl.message(
      'entryAppointment',
      name: 'entryAppointment',
    );
  }

  String get reservationType {
    return Intl.message(
      'reservationType',
      name: 'reservationType',
    );
  }

  String get errUpdate {
    return Intl.message(
      'errUpdate',
      name: 'errUpdate',
    );
  }

  String get updateSuccess {
    return Intl.message(
      'updateSuccess',
      name: 'updateSuccess',
    );
  }

  String get successProcess {
    return Intl.message(
      'successProcess',
      name: 'successProcess',
    );
  }

  String get operTime {
    return Intl.message(
      'operTime',
      name: 'operTime',
    );
  }

  String get operDate {
    return Intl.message(
      'operDate',
      name: 'operDate',
    );
  }

  String get serviceCode {
    return Intl.message(
      'serviceCode',
      name: 'serviceCode',
    );
  }

  String get accNumber {
    return Intl.message(
      'accNumber',
      name: 'accNumber',
    );
  }

  String get operNumber {
    return Intl.message(
      'operNumber',
      name: 'operNumber',
    );
  }

  String get refNumber {
    return Intl.message(
      'refNumber',
      name: 'refNumber',
    );
  }

  String get acceptedNumber {
    return Intl.message(
      'acceptedNumber',
      name: 'acceptedNumber',
    );
  }

  String get transactionsReports {
    return Intl.message(
      'transactionsReports',
      name: 'transactionsReports',
    );
  }

  String get billsReports {
    return Intl.message(
      'billsReports',
      name: 'billsReports',
    );
  }

  String get choosePrinter {
    return Intl.message(
      'choosePrinter',
      name: 'choosePrinter',
    );
  }

  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
    );
  }

  String get bluetoothPrinter {
    return Intl.message(
      'bluetoothPrinter',
      name: 'bluetoothPrinter',
    );
  }

  String get mobiwirePrinter {
    return Intl.message(
      'mobiwirePrinter',
      name: 'mobiwirePrinter',
    );
  }

  String get printerSettings {
    return Intl.message(
      'printerSettings',
      name: 'printerSettings',
    );
  }

  String get sellersServices {
    return Intl.message(
      'sellersServices',
      name: 'sellersServices',
    );
  }

  String get pendingBills {
    return Intl.message(
      'pendingBills',
      name: 'pendingBills',
    );
  }

  String get email {
    return Intl.message(
      'email',
      name: 'email',
    );
  }

  String get userCode {
    return Intl.message(
      'userCode',
      name: 'userCode',
    );
  }

  String get serviceCredit {
    return Intl.message(
      'serviceCredit',
      name: 'serviceCredit',
    );
  }

  String get cashCredit {
    return Intl.message(
      'cashCredit',
      name: 'cashCredit',
    );
  }

  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
    );
  }

  String get discountedCredit {
    return Intl.message(
      'discountedCredit',
      name: 'discountedCredit',
    );
  }

  String get processesNumber {
    return Intl.message(
      'processesNumber',
      name: 'processesNumber',
    );
  }

  String get detailedReport {
    return Intl.message(
      'detailedReport',
      name: 'detailedReport',
    );
  }

  String get nationalID {
    return Intl.message(
      'nationalID',
      name: 'nationalID',
    );
  }

  String get shopName {
    return Intl.message(
      'shopName',
      name: 'shopName',
    );
  }

  String get firstName {
    return Intl.message(
      'firstName',
      name: 'firstName',
    );
  }

  String get lastName {
    return Intl.message(
      'lastName',
      name: 'lastName',
    );
  }

  String get selectFiles {
    return Intl.message(
      'selectFiles',
      name: 'selectFiles',
    );
  }

  String get editPhotos {
    return Intl.message(
      'editPhotos',
      name: 'editPhotos',
    );
  }

  String get gov {
    return Intl.message(
      'gov',
      name: 'gov',
    );
  }

  String get city {
    return Intl.message(
      'city',
      name: 'city',
    );
  }

  String get village {
    return Intl.message(
      'village',
      name: 'village',
    );
  }
  String get share {
    return Intl.message(
      'share',
      name: 'share',
    );
  }
}
