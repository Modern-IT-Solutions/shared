// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:shared/shared.dart';

import '../../domain/repositories/station_repository_interface.dart';
import '../../domain/request/requests.dart';
import '../datasources/datasource.dart';
import '../models/station_model.dart';

/// [StationRepository] is a class that contains all the CRUD of user
class StationRepository<T extends StationModel>
    extends StationRepositoryInterface<T> {
  final StationDataSource<T> source;

  /// singleton class
  StationRepository(this.source);
  static final instance = StationRepository(StationsFirebaseDateSource());


  Future<T> create(StationCreateRequest<T> request) async => await source.create(request as CreateRequest<T>);
  Future<T?> find(FindRequest<T> request) async => await source.find(request);
  Future<ListResult<T>> list([ListRequest<T>? request]) async => await source.list(request??ListRequest<T>());
  Future<void> update(StationUpdateRequest<T> request) async => await source.update(request as UpdateRequest<T>);
  Future<void> delete(DeleteRequest<T> request) async => await source.delete(request);
}

