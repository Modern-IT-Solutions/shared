import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/shared.dart';

import 'transaction_model.dart';

part 'gift_card_model.freezed.dart';
part 'gift_card_model.g.dart';

@freezed
class GiftCardModel with _$GiftCardModel implements Model {

  factory GiftCardModel({
    @ModelRefSerializer()
    required ModelRef ref,
    ProfileModel? owner,
    
    ///
    /// Gift Card info
    required String code,
    // expiration date
    @NullableTimestampDateTimeSerializer()
    DateTime? expiresAt,
    required double amount,
    required String currency,
    TransactionModel? transaction,
    // freezed
    @Default(false) bool freezed,    
    // next intervention date
    @Default({}) Map<String,dynamic> metadata,
    @TimestampDateTimeSerializer()
    required DateTime createdAt,
    @TimestampDateTimeSerializer()
    required DateTime updatedAt,
    @NullableTimestampDateTimeSerializer()
    DateTime? deletedAt,
  }) = _GiftCardModel;

  factory GiftCardModel.fromJson(Map<String, dynamic> json) => _$GiftCardModelFromJson(json);

 static ModelDescription<GiftCardModel> get description => ModelDescription<GiftCardModel>(
        fields: {
          FieldDescription(
            name: "owner uid",
            nullable: true,
            type: FieldType.text,
            map: (m) => m.owner?.uid,
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
            map: (m) => m.transaction?.uids,
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