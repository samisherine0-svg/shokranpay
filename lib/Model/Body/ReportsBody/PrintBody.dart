import 'dart:convert';
/// TransactionNumber : 90

PrintBody printBodyFromJson(String str) => PrintBody.fromJson(json.decode(str));
String printBodyToJson(PrintBody data) => json.encode(data.toJson());
class PrintBody {
  PrintBody({
      int? transactionNumber,}){
    _transactionNumber = transactionNumber;
}

  PrintBody.fromJson(dynamic json) {
    _transactionNumber = json['TransactionNumber'];
  }
  int? _transactionNumber;
PrintBody copyWith({  int? transactionNumber,
}) => PrintBody(  transactionNumber: transactionNumber ?? _transactionNumber,
);
  int? get transactionNumber => _transactionNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TransactionNumber'] = _transactionNumber;
    return map;
  }

}