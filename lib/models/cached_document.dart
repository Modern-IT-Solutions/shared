import 'package:core/core.dart';

class CachedDocument {
  final String ref;
  final Map<String, dynamic> data;
  final DateTime cachedAt;
  final DateTime? expiresAt;

  DateTime? get updatedAtOrCachedAt {
    if (data.containsKey('updatedAt')) {
      if (data['updatedAt'] is Timestamp) {
        return (data['updatedAt'] as Timestamp).toDate();
      } else if (data['updatedAt'] is DateTime) {
        return data['updatedAt'] as DateTime;
      } else if (data['updatedAt'] is int) {
        return DateTime.fromMillisecondsSinceEpoch(data['updatedAt'] as int);
      } else if (data['updatedAt'] is Map) {
        if (data['updatedAt']['seconds'] != null && data['updatedAt']['nanoseconds'] != null) {
          return Timestamp(data['updatedAt']['seconds'], data['updatedAt']['nanoseconds']).toDate();
        } else if (data['updatedAt']['millisecondsSinceEpoch'] != null) {
          return DateTime.fromMillisecondsSinceEpoch(data['updatedAt']['millisecondsSinceEpoch']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    }
    return cachedAt;
  }

  CachedDocument({
    required this.ref,
    required this.data,
    required this.cachedAt,
    this.expiresAt,
  });

  CachedDocument copyWith({
    String? path,
    Map<String, dynamic>? data,
    DateTime? cachedAt,
    DateTime? expiresAt,
  }) {
    return CachedDocument(
      ref: path ?? this.ref,
      data: data ?? this.data,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  String toString() => 'CachedDocument(ref: $ref, data: $data, cachedAt: $cachedAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CachedDocument && other.ref == ref;
  }

  @override
  int get hashCode => ref.hashCode;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'ref': ref,
      'data': _preperEncodeJson(data),
      'cachedAt': cachedAt.millisecondsSinceEpoch,
      'expiresAt': expiresAt?.millisecondsSinceEpoch,
    };
  }

  /// fromJson
  factory CachedDocument.fromJson(Map<String, dynamic> map) {
    return CachedDocument(
      ref: map['ref'],
      data: _preperDecodeJson(map['data']),
      cachedAt: DateTime.fromMillisecondsSinceEpoch(map['cachedAt']),
      expiresAt: map['expiresAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['expiresAt']) : null,
    );
  }

  static Map<String, dynamic> _preperDecodeJson(Map<String, dynamic> map) {
    return map.map((key, value) {
      if (value is Map) {
        if (value['__type__'] == 'Timestamp') {
          return MapEntry(key, Timestamp(value['seconds'], value['nanoseconds']));
        } // DateTime
        else if (value['__type__'] == 'DateTime') {
          return MapEntry(key, Timestamp.fromDate(DateTime.fromMillisecondsSinceEpoch(value['millisecondsSinceEpoch'])));
        } else if (value['__type__'] == 'GeoPoint') {
          return MapEntry(key, GeoPoint(value['latitude'], value['longitude']));
        } else if (value['__type__'] == 'DocumentReference') {
          return MapEntry(key, FirebaseFirestore.instance.doc(value['path']));
        } else {
          return MapEntry(key, _preperDecodeJson(Map<String, dynamic>.from(value)));
        }
      } else if (value is List) {
        return MapEntry(
            key,
            value.map((e) {
              if (e is Map<String, dynamic>) {
                if (e['__type__'] == 'Timestamp') {
                  return Timestamp(e['seconds'], e['nanoseconds']);
                } // DateTime
                else if (e['__type__'] == 'DateTime') {
                  return Timestamp.fromDate(DateTime.fromMillisecondsSinceEpoch(e['millisecondsSinceEpoch']));
                } else if (e['__type__'] == 'GeoPoint') {
                  return GeoPoint(e['latitude'], e['longitude']);
                } else if (e['__type__'] == 'DocumentReference') {
                  return FirebaseFirestore.instance.doc(e['path']);
                } else {
                  return _preperDecodeJson(e);
                }
              } else {
                return e;
              }
            }).toList());
      } else {
        return MapEntry(key, value);
      }
    });
  }

  static Map<String, dynamic> _preperEncodeJson(Map<String, dynamic> map) {
    return map.map((key, value) {
      if (value is Timestamp) {
        return MapEntry(key, {
          '__type__': 'Timestamp',
          'seconds': value.seconds,
          'nanoseconds': value.nanoseconds,
        });
      } //value is DateTime
      else if (value is DateTime) {
        return MapEntry(key, {
          '__type__': 'DateTime',
          'millisecondsSinceEpoch': value.millisecondsSinceEpoch,
        });
      } else if (value is GeoPoint) {
        return MapEntry(key, {
          '__type__': 'GeoPoint',
          'latitude': value.latitude,
          'longitude': value.longitude,
        });
      } else if (value is DocumentReference) {
        return MapEntry(key, {
          '__type__': 'DocumentReference',
          'path': value.path,
        });
      } else if (value is Map<String, dynamic>) {
        return MapEntry(key, _preperEncodeJson(value));
      } else if (value is List) {
        return MapEntry(
            key,
            value.map((e) {
              if (e is Timestamp) {
                return {
                  '__type__': 'Timestamp',
                  'seconds': e.seconds,
                  'nanoseconds': e.nanoseconds,
                };
              } //value is DateTime
              else if (e is DateTime) {
                return {
                  '__type__': 'DateTime',
                  'millisecondsSinceEpoch': e.millisecondsSinceEpoch,
                };
              } else if (e is GeoPoint) {
                return {
                  '__type__': 'GeoPoint',
                  'latitude': e.latitude,
                  'longitude': e.longitude,
                };
              } else if (e is DocumentReference) {
                return {
                  '__type__': 'DocumentReference',
                  'path': e.path,
                };
              } else if (e is Map<String, dynamic>) {
                return _preperEncodeJson(e);
              } else {
                return e;
              }
            }).toList());
      } else {
        return MapEntry(key, value);
      }
    });
  }
}

// CachedCollection
class CachedCollection {
  final String ref;
  final String? query;
  final List<CachedDocument> documents;
  final DateTime cachedAt;
  final DateTime? expiresAt;

  DateTime get updatedAtOrCachedAt {
    if (documents.isNotEmpty) {
      // loop through all documents and find the latest updatedAt
      final updatedAt = documents.map((e) => e.updatedAtOrCachedAt).reduce((value, element) => value!.isAfter(element!) ? value : element);
      if (updatedAt != null) {
        if (updatedAt.microsecondsSinceEpoch > DateTime.now().microsecondsSinceEpoch) {
          return updatedAt;
        }
      }
    }
    return cachedAt;
  }

  CachedCollection({
    required this.ref,
    required this.documents,
    required this.cachedAt,
    this.expiresAt,
    this.query,
  });

  CachedCollection filter({
    bool withTrashed = false,
  }) {
    return copyWith(documents: documents.where((doc) {
      if (!withTrashed && doc.data["deletedAt"] != null) {
        return false;
      }
      return true;
    }).toList());
  }

  CachedCollection copyWith({String? ref, List<CachedDocument>? documents, DateTime? cachedAt, DateTime? expiresAt, String? query}) {
    return CachedCollection(
      ref: ref ?? this.ref,
      query: query ?? this.query,
      documents: documents ?? this.documents,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  /// addAll
  /// takes list of documents and add them to the collection
  /// but first it removes any document that has the same path
  CachedCollection addAllAndClone(List<CachedDocument> docs) {
    for (int i = 0; i < documents.length; i++) {
      final doc = documents[i];
      final match = docs.where((element) {
        return element.ref == doc.ref;
      }).firstOrNull;
      if (match != null) {
        documents[i] = match.copyWith();
        docs.remove(match);
      }
    }
    // unshift all
    documents.insertAll(0, docs);
    return copyWith();
  }

  @override
  String toString() => 'CachedCollection(ref: $ref, documents: $documents, cachedAt: $cachedAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CachedCollection && other.ref == ref && other.query == query;
  }

  @override
  int get hashCode => ref.hashCode;

  /// toJson
  Map<String, dynamic> toJson() {
    return {
      'ref': ref,
      'documents': documents.map((x) => x.toJson()).toList(),
      'cachedAt': cachedAt.millisecondsSinceEpoch,
      'expiresAt': expiresAt?.millisecondsSinceEpoch,
      "query": query
    };
  }

  /// fromJson
  factory CachedCollection.fromJson(Map<String, dynamic> map) {
    return CachedCollection(ref: map['ref'], documents: List<CachedDocument>.from(map['documents']?.map((x) => CachedDocument.fromJson(x))), cachedAt: DateTime.fromMillisecondsSinceEpoch(map['cachedAt']), expiresAt: map['expiresAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['expiresAt']) : null, query: map['query']);
  }
}
