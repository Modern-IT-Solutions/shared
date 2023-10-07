import 'package:freezed_annotation/freezed_annotation.dart';

import '../shared.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel implements Model {
  factory TransactionModel({
    @ModelRefSerializer() required ModelRef ref,
    required String uid,
    required TransactionStatus status,
    @Default(TransactionType.transfer)
    TransactionType type,
    /// [product] is the ref path of the product that the transaction is related to.
    String? product,
    required String from,
    required String to,
    required List<String> uids,
    String? promocode,
    required double amount,
    @Default("DZD") String currency,
    @Default({}) Map<String, dynamic> metadata,
    String? details,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    
  @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);

  static ModelDescription<TransactionModel> get description => ModelDescription<TransactionModel>(
        fields: {
          FieldDescription(
            name: "details",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.details,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "amount",
            type: FieldType.number,
            map: (m) => m.amount,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "currency",
            type: FieldType.text,
            map: (m) => m.currency,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "uids",
            type: FieldType.listText,
            map: (m) => m.uids,
          ),
          FieldDescription(
            name: "createdAt",
            type: FieldType.datetime,
            map: (m) => m.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "updatedAt",
            type: FieldType.datetime,
            map: (m) => m.updatedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "deletedAt",
            nullable: true,
            type: FieldType.datetime,
            map: (m) => m.deletedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "ref",
            type: FieldType.reference,
            map: (m) => m.ref,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "from",
            type: FieldType.reference,
            map: (m) => m.from,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "to",
            type: FieldType.reference,
            map: (m) => m.to,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "type",
            type: FieldType.text,
            map: (m) => m.type,
            group: FieldGroup.secondary,
          ),
        },
        name: "Transaction",
        path: "transactions",
        fromJson: TransactionModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
          title: model.type.name + " " + model.amount.toString() + " " + model.currency,
        ),
        actions: [],
      );
}

/// enum [TransactionStatus] is an enum that represents the status of the transaction.
enum TransactionStatus {
  /// TransactionStatus.pending
  pending,

  /// TransactionStatus.success
  success,

  /// TransactionStatus.failed
  failed,
}

enum TransactionType {
  deposit,
  withdraw,
  purchase,
  refund,
  transfer,
}

// StudentTransactionType get type => amount >= 0
//     ? StudentTransactionType.withdrawal
//     : StudentTransactionType.deposit;
// IconData get icon => type == StudentTransactionType.withdrawal
//     ? FluentIcons.money_settings_20_regular
//     : FluentIcons.money_hand_24_regular;

/// extension for type and icon of the transaction.
extension TransactionTypeExtension on TransactionModel {
  TransactionType get type => from == getAuth().currentProfile?.uid ? TransactionType.withdraw : TransactionType.deposit;
}
