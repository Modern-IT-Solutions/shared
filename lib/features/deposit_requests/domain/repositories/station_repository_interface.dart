
import 'package:core/core.dart';
import 'package:shared/models/deposit_request_model.dart';

import '../request/requests.dart';

/// [DepositRequestRepositoryInterface]
abstract class DepositRequestRepositoryInterface<T extends DepositRequestModel>
    extends RepositoryInterface<T> {

  Future<T> create(DepositRequestCreateRequest<T> request);
  Future<T?> find(FindRequest<T> request);
  Future<ListResult<T>> list([ListRequest<T>? request]);
  Future<void> update(DepositRequestUpdateRequest<T> request);
  Future<void> delete(DeleteRequest<T> request);
}
