
// import 'package:shared/shared.dart';

// import '../models/station_model.dart';

// abstract class StationDataSource<T extends StationModel>
//     extends DataSource<T> implements CFLUDInterface<T> {}

// class StationsFirebaseDateSource extends StationDataSource<StationModel>
//   with FirestoreDataSourceMixin<StationModel>
//  {
//   @override
//   String get cref => 'stations';
//   @override
//   fromFirestore(snapshot, _) => StationModel.fromJson(
//     {'ref': snapshot.reference.path, ...snapshot.data()!}
//   );
// }



