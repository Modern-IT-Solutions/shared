import 'package:shared/features/assistances/assistances.dart';
import 'package:shared/shared.dart';




abstract class AssistanceDataSource<T extends AssistanceModel>
    extends DataSource<T> implements CFLUDInterface<T> {}

class AssistancesFirebaseDateSource extends AssistanceDataSource<AssistanceModel>
  with FirestoreDataSourceMixin<AssistanceModel>
 {
  @override
  String get cref => 'assistances';
  fromFirestore(snapshot, _) => AssistanceModel.fromJson(
    {'ref': snapshot.reference.path, ...snapshot.data()!}
  );
}



