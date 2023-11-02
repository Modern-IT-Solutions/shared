import 'package:shared/models/gift_card_model.dart';
import 'package:shared/models/transaction_model.dart';
import 'package:shared/shared.dart';


class GiftCardCreateRequest<T extends GiftCardModel> extends CreateRequest<T> {
  final ModelRef ref;
  ProfileModel? owner;
  String? code;
  DateTime? expiresAt;
  double? amount;
  String? currency;
  int? printIndex;
  int? printTotal;
  TransactionModel? transaction;
  bool? freezed;
  Map<String, dynamic>? metadata;
  DateTime? updatedAt;
  DateTime? createdAt;
  DateTime? deletedAt;

  get data => toMap();

  GiftCardCreateRequest({
    required this.ref,
    this.owner,
    this.code,
    this.expiresAt,
    this.printIndex,
    this.printTotal,
    this.amount,
    this.currency,
    this.transaction,
    this.metadata,
    this.freezed,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super(id: ref.id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'ref': ref.path,
      'owner': owner?.toJson(),
      'code': code,
      'freezed': freezed,
      'expiresAt': expiresAt,
      'amount': amount,
      'currency': currency,
      'transaction': transaction?.toJson(),
      'metadata': {
        'printIndex': printIndex,
        'printTotal': printTotal,
        ...(metadata ?? {}),
      },
      'updatedAt': updatedAt,
      'createdAt': createdAt,
      'deletedAt': deletedAt,
    };
  }
}


class GiftCardUpdateRequest<T extends GiftCardModel> extends UpdateRequest<T> {
  final ModelRef ref;
  ProfileModel? owner;
  String? code;
  DateTime? expiresAt;
  double? amount;
  String? currency;
  TransactionModel? transaction;
  bool? freezed;
  Map<String, dynamic>? metadata;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  get data => toMap();

  GiftCardUpdateRequest({
    required this.ref,
    this.owner,
    this.code,
    this.expiresAt,
    this.amount,
    this.currency,
    this.transaction,
    this.metadata,
    this.freezed,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : super(id: ref.id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'ref': ref.path,
      'owner': owner?.toJson(),
      'code': code,
      'freezed': freezed,
      'expiresAt': expiresAt,
      'amount': amount,
      'currency': currency,
      'transaction': transaction?.toJson(),
      'metadata': metadata,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
    };
  }
}

class GiftCardFindRequest<T extends GiftCardModel> extends FindRequest<T> {
  const GiftCardFindRequest({
    required super.id,
    super.withDeleted,
  });
}
