

import 'package:shared/shared.dart';

import '../../assistances.dart';

/// [AssistanceRepositoryInterface]
abstract class AssistanceRepositoryInterface<T extends AssistanceModel>
    extends RepositoryInterface<T> {

  Future<T> create(AssistanceCreateRequest<T> request);
  Future<T?> find(FindRequest<T> request);
  Future<ListResult<T>> list([ListRequest<T>? request]);
  Future<void> update(AssistanceUpdateRequest<T> request);
  Future<void> delete(DeleteRequest<T> request);
}
