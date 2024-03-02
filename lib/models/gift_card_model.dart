import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import 'transaction_model.dart';

part 'gift_card_model.freezed.dart';
part 'gift_card_model.g.dart';

@freezed
class GiftCardModel with _$GiftCardModel implements Model {
  factory GiftCardModel({
    @ModelRefSerializer() required ModelRef ref,
    ProfileModel? owner,
    /// Gift Card info
    required String code,
    // expiration date
    @NullableTimestampDateTimeSerializer() DateTime? expiresAt,
    required double amount,
    required String currency,
    TransactionModel? transaction,
    // freezed
    @Default(false) bool freezed,
    // next intervention date
    @Default({}) Map<String, dynamic> metadata,
    @TimestampDateTimeSerializer() required DateTime createdAt,
    @TimestampDateTimeSerializer() required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer() DateTime? deletedAt,
  }) = _GiftCardModel;

  factory GiftCardModel.fromJson(Map<String, dynamic> json) => _$GiftCardModelFromJson(json);

  static ModelDescription<GiftCardModel> get description => ModelDescription<GiftCardModel>(
        fields: {
          FieldDescription(
            name: "owner name",
            path: "owner.displayName",
            nullable: true,
            type: FieldType.text,
            map: (m) {
              return m.owner?.displayName;
            },
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "owner uid",
            path: "owner.uid",
            nullable: true,
            type: FieldType.text,
            map: (m) {
              return m.owner?.uid;
            },
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "user (student) uid",
            path: "transaction.uid",
            nullable: true,
            type: FieldType.text,
            map: (m) {
              return m.transaction?.uid;
            },
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "code",
            path: "code",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.code,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "Amount",
            path: "amount",
            type: FieldType.number,
            map: (m) => m.amount,
            group: FieldGroup.primary,
          ),
          FieldDescription(
            name: "Currency",
            path: "currency",
            type: FieldType.text,
            map: (m) => m.currency,
            group: FieldGroup.hidden,
          ),
          FieldDescription(
            name: "Users IDs",
            path: "uids",
            type: FieldType.listText,
            map: (m) => m.transaction?.uids,
          ),
          FieldDescription(
            name: "used At",
            path: "transaction.createdAt",
            type: FieldType.datetime,
            map: (m) => m.transaction?.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "ref",
            path: "ref",
            type: FieldType.text,
            map: (m) => m.ref,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "createdAt",
            path: "createdAt",
            type: FieldType.datetime,
            map: (m) => m.createdAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "updatedAt",
            path: "updatedAt",
            type: FieldType.datetime,
            map: (m) => m.updatedAt,
            group: FieldGroup.metadata,
          ),
          FieldDescription(
            name: "deletedAt",
            path: "deletedAt",
            nullable: true,
            type: FieldType.datetime,
            map: (m) => m.deletedAt,
            group: FieldGroup.metadata,
          ),
        },
        name: "Gift Cards",
        path: "giftCards",
        fromJson: GiftCardModel.fromJson,
        tileBuilder: (model) => ModelGeneralData(
          title: model.amount.toString() + " " + model.currency,
        ),
        actions: [],
      );
}
