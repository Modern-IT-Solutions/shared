// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shared/features/assistances/data/models/assistance_model.dart';
import 'package:shared/shared.dart';

import '../../domain/repositories/station_repository_interface.dart';
import '../../domain/request/requests.dart';
import '../datasources/datasource.dart';

/// [AssistanceRepository] is a class that contains all the CRUD of user
class AssistanceRepository<T extends AssistanceModel>
    extends AssistanceRepositoryInterface<T> {
  final AssistanceDataSource<T> source;

  /// singleton class
  AssistanceRepository(this.source);
  static final instance = AssistanceRepository(AssistancesFirebaseDateSource());


  Future<T> create(AssistanceCreateRequest<T> request) async => await source.create(request as CreateRequest<T>);
  Future<T?> find(FindRequest<T> request) async => await source.find(request);
  Future<ListResult<T>> list([ListRequest<T>? request]) async => await source.list(request??ListRequest<T>());
  Future<void> update(AssistanceUpdateRequest<T> request) async => await source.update(request as UpdateRequest<T>);
  Future<void> delete(DeleteRequest<T> request) async => await source.delete(request);

  void resolveByCall({required String time, required id}) {
    throw UnimplementedError();
  }

  void resolveByIntervention({required String estimatedAt, required String id}) {
    throw UnimplementedError();
  }

  void acceptIntervention(String id) {
    throw UnimplementedError();
  }
  //TODO Add estimaedAt
}

