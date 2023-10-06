
import 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:cloud_functions/cloud_functions.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_app_check/firebase_app_check.dart';
export 'package:firebase_auth/firebase_auth.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';




/// add extension to [fb.FirebaseFirestore] to use cache
extension FirestoreDocumentExtension<T> on DocumentReference<T> {
  Future<DocumentSnapshot<T>> getCacheFirst() async {
    try {
      var ds = await get(const GetOptions(source: Source.cache));
      if (!ds.exists) return get(const GetOptions(source: Source.server));
      return ds;
    } catch (_) {
      return get(const GetOptions(source: Source.server));
    }
  }
}

extension FirestoreQueryExtension<T> on Query<T> {
  Future<QuerySnapshot<T>> getCacheFirst() async {
    try {
      var qs = await get(const GetOptions(source: Source.cache));
      if (qs.docs.isEmpty) return get(const GetOptions(source: Source.server));
      return qs;
    } catch (_) {
      return get(const GetOptions(source: Source.server));
    }
  }
}