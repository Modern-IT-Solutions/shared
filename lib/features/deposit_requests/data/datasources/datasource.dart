
import 'package:core/core.dart';
import 'package:shared/models/deposit_request_model.dart';

abstract class DepositRequestDataSource<T extends DepositRequestModel>
    extends DataSource<T> implements CFLUDInterface<T> {
  Future<void> accept(FindRequest<T> request,{double? amount});
  Future<void> reject(FindRequest<T> request,{String? reason});
}

class DepositRequestsFirebaseDateSource extends DepositRequestDataSource<DepositRequestModel>
  with FirestoreDataSourceMixin<DepositRequestModel>
 {
  @override
  String get cref => 'depositRequests';
  @override
  fromFirestore(snapshot, _) => DepositRequestModel.fromJson(
    { ...snapshot.data()!,'ref': snapshot.reference.path}
  );

  @override
  Future<void> accept(FindRequest<DepositRequestModel> request,{double? amount}) async {
    // use firebase functions depositRequests_accept
    var fn = FirebaseFunctions.instance.httpsCallable('depositRequests_accept');
    await fn.call({
      "depositRequestId": request.id,
      "amount": amount,
    });
    print('depositRequests_accept called');
  }

  @override
  Future<void> reject(FindRequest<DepositRequestModel> request,{String? reason}) async {
    // use firebase functions depositRequests_reject
    var fn = FirebaseFunctions.instance.httpsCallable('depositRequests_reject');
    await fn.call({
      "depositRequestId": request.id,
      "reason": reason,
    });
    print('depositRequests_reject called');
  }
}



