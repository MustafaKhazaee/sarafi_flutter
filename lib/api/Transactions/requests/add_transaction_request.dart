
import 'package:sarafi/api/Transactions/enums/transaction_status_enum.dart';
import 'package:sarafi/api/Transactions/enums/transaction_type_enum.dart';

class AddTransactionQuery {
  final String Amount;
  final String FromAccountId;
  final String ToAccountId;
  final String DateTime;
  final TransactionStatus Status;
  final String Remarks;
  final String SlipPhoto;
  AddTransactionQuery(this.Amount, this.FromAccountId, this.ToAccountId, this.DateTime, this.Status, this.Remarks, this.SlipPhoto);

  Map<String, dynamic> toJson () => {
    "Amount": Amount,
    "FromAccountId": FromAccountId,
    "ToAccountId": ToAccountId,
    "DateTime": DateTime,
    "TransactionStatus": TransactionStatus,
    "TransactionType": TransactionType,
    "Remarks": Remarks,
    "SlipPhoto": SlipPhoto
  };
}