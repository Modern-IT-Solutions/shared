// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:core/core.dart';
import 'package:shared/features/deposit_requests/domain/repositories/station_repository_interface.dart';
import 'package:shared/models/deposit_request_model.dart';

import '../../domain/request/requests.dart';
import '../datasources/datasource.dart';

/// [DepositRequestRepository] is a class that contains all the CRUD of user
class DepositRequestRepository<T extends DepositRequestModel>
    extends DepositRequestRepositoryInterface<T> {
  final DepositRequestDataSource<T> source;

  /// singleton class
  DepositRequestRepository(this.source);
  static final instance = DepositRequestRepository(DepositRequestsFirebaseDateSource());


  Future<T> create(DepositRequestCreateRequest<T> request) async => await source.create(request as CreateRequest<T>);
  Future<T?> find(FindRequest<T> request) async => await source.find(request);
  Future<ListResult<T>> list([ListRequest<T>? request]) async => await source.list(request??ListRequest<T>());
  Future<void> update(DepositRequestUpdateRequest<T> request) async => await source.update(request as UpdateRequest<T>);
  Future<void> delete(DeleteRequest<T> request) async => await source.delete(request);

  // accept request
  Future<void> accept(FindRequest<T> request,{double? amount}) async => await source.accept(request,amount:amount);
  // reject request
  Future<void> reject(FindRequest<T> request,{String? reason}) async => await source.reject(request,reason:reason);

}

