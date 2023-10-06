import 'package:cloud_functions/cloud_functions.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lib/lib.dart';

import '../../data/models/station_model.dart';
import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [FindStationForm] is a form to update a new user
class FindStationForm extends StatefulWidget {
  final String id;
  final StationModel? station;
  final VoidCallback? onCancel;
  final void Function(StationModel? station)? onFinded;
  final List<Widget> actions;
  const FindStationForm({
    Key? key,
    this.onFinded,
    this.onCancel,
    required this.id,
    required this.station,
    this.actions = const [],
  }) : super(key: key);

  @override
  State<FindStationForm> createState() => _FindStationFormState();
}

class _FindStationFormState extends State<FindStationForm> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  late String? _error;
  StationModel? station;
  @override
  void initState() {
    super.initState();
    station = widget.station;
    if (station == null) {
      find();
    }
    _error = null;
  }

  Future<void> find() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _error = null;
        _loading = true;
      });
      var request = StationFindRequest(
        id: widget.id,
      );
      try {
        station = await StationRepository.instance.find(request);
        widget.onFinded?.call(station);
      }
      // FirebaseFunctionsException
      on FirebaseFunctionsException catch (e) {
        setState(() {
          _error = e.message;
        });
      } catch (e) {
        setState(() {
          _error = e.toString();
        });
        rethrow;
      }

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: _loading,
      child: Column(
        children: [
          // show error if not null, in box with red background rounded corners and icon and dismiss button
          if (_error != null)
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    FluentIcons.people_error_24_regular,
                    color: Colors.red,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _error!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _error = null;
                      });
                    },
                    icon: Icon(
                      FluentIcons.dismiss_24_regular,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200,
                  floating: true,
                  excludeHeaderSemantics: true,
                  forceElevated: true,
                  primary: true,
                  snap: true,
                  stretch: true,
                  stretchTriggerOffset: 100,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: station?.photoUrl == null
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(
                                      station!.photoUrl!,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                                Colors.transparent,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 3,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: station?.photoUrl == null
                                      ? null
                                      : NetworkImage(
                                          station!.photoUrl.toString(),
                                        ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              station?.name == null
                                  ? TextPlaceholder()
                                  : Text(
                                      station!.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text('Find Station'),
                  leading: const BackButton(),
                  actions: [
                    ...widget.actions,
                  ],
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: ConstrainedBox(
                      /// max width is 600
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 20),
                            ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: station?.name == null ? TextPlaceholder() : Text(station!.name),
                              subtitle: Text(
                                'Name',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: Icon(FluentIcons.location_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: station?.name == null ? TextPlaceholder() : Text(station!.address.raw),
                              subtitle: Text(
                                'Address',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: Icon(FluentIcons.location_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: station?.name == null ? TextPlaceholder() : Text("${station!.address.location?.geopoint.latitude}, ${station!.address.location?.geopoint.longitude}"),
                              subtitle: Text(
                                'Location',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: Icon(FluentIcons.phone_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: station?.name == null
                                  ? TextPlaceholder()
                                  : Text(
                                      station!.phoneNumbers.map((e) => e).join(', '),
                                    ),
                              subtitle: Text(
                                'Phone Numbers',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ListTile(
                              leading: Icon(FluentIcons.mail_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: station?.name == null ? TextPlaceholder() : Text(station!.email.toString()),
                              subtitle: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
