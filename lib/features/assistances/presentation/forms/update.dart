import 'package:core/core.dart';
import 'package:core/features/users/presentation/dailogs.dart';
import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:shared/features/assistances/data/models/assistance_model.dart';
import 'package:shared/features/stations/presentation/forms/dailogs.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/shared.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../domain/request/requests.dart';

/// [UpdateAssistanceForm] is a form to update a new user
class UpdateAssistanceForm extends StatefulWidget {
  final String ref;
  final AssistanceModel? model;
  final VoidCallback? onCancel;
  final Null Function(AssistanceModel station)? onUpdated;
  final Null Function(AssistanceModel station)? onCreated;
  const UpdateAssistanceForm({Key? key, this.onUpdated, this.onCreated, this.onCancel, required this.model, required this.ref}) : super(key: key);

  @override
  State<UpdateAssistanceForm> createState() => _UpdateAssistanceFormState();
}

class _UpdateAssistanceFormState extends State<UpdateAssistanceForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = AssistanceUpdateRequest(
    ref: widget.model?.ref ?? ModelRef(widget.ref),
    attachments: widget.model?.attachments,
    date: widget.model?.date,
    intervention: widget.model?.intervention,
    nextInterventionDate: widget.model?.nextInterventionDate,
    note: widget.model?.note,
    reviewer: widget.model?.reviewer,
    station: widget.model?.station,
    status: widget.model?.status,
    technicians: widget.model?.technicians,
    createdAt: widget.model?.createdAt ?? DateTime.now(),
    deletedAt: widget.model?.deletedAt,
    updatedAt: widget.model?.updatedAt ?? DateTime.now(),
    visibility: ModelVisibility.visible,
  );

  // late final TextEditingController _nameController;
  // late final TextEditingController _emailController;
  // late final TextEditingController _addressController;
  // late final TextEditingController _photoUrlController;

  final TextEditingController _phoneTmpController = TextEditingController();

  // late final ValueNotifier<GeoFirePoint?> _location;
  // late final ValueNotifier<List<String>> _phoneNumbers;
  // late final ValueNotifier<Map<String, ProfileModel>> _technicians;
  // late final ValueNotifier<Map<String, ProfileModel>> _owners;

  bool _loading = false;
  late String? _error;
  late Map<String, String> _errors;

  @override
  void initState() {
    super.initState();
    _error = null;
    _errors = {};
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errors = {};
        _error = null;
        _loading = true;
      });
      var data = {
        ...request.data,
      };

      try {
        if (widget.model != null) {
          await updateDocument(path: request.ref.path, data: data);
          widget.onUpdated?.call(widget.model!.copyWith(
            ref: request.ref,
            attachments: request.attachments ?? widget.model?.attachments ?? [],
            date: request.date ?? widget.model!.date,
            intervention: request.intervention ?? widget.model?.intervention,
            nextInterventionDate: request.nextInterventionDate ?? widget.model?.nextInterventionDate,
            note: request.note ?? widget.model?.note ?? "",
            reviewer: request.reviewer ?? widget.model?.reviewer,
            station: request.station ?? widget.model!.station,
            status: request.status ?? widget.model!.status,
            technicians: request.technicians ?? widget.model!.technicians,
            createdAt: request.createdAt ?? widget.model?.createdAt ?? DateTime.now(),
            deletedAt: request.deletedAt ?? widget.model?.deletedAt,
            updatedAt: request.updatedAt ?? widget.model?.updatedAt ?? DateTime.now(),
          ));
        } else if (widget.ref.nullIfEmpty != null) {
          var item = AssistanceModel.fromJson(data);
          await setDocument(path: request.ref.path, data: data);
          widget.onCreated?.call(item);
        } else {
          throw Exception('CODE:IAE, ref is empty, can not create new item without ref ');
        }
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
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(
                    FluentIcons.people_error_24_regular,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _error = null;
                      });
                    },
                    icon: const Icon(
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
                  // pinned: true,
                  // expandedHeight: 200,
                  // floating: true,
                  // excludeHeaderSemantics: true,
                  // forceElevated: true,
                  // primary: true,
                  // snap: true,
                  // stretch: true,
                  // stretchTriggerOffset: 100,
                  backgroundColor: Colors.transparent,
                  title: const Text('Submit Assistance'),
                  leading: const BackButton(),
                  actions: [
                    TextButton.icon(
                      onPressed: () async {
                        await _submit();
                      },
                      label: const Text('Submit'),
                      icon: const Icon(FluentIcons.checkmark_24_regular),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: ConstrainedBox(
                      /// max width is 600
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 10),

                            const ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Assistance Information"),
                              enabled: false,
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).colorScheme.background,
                                backgroundImage: request.station?.photoUrl.nullIfEmpty == null ? null : NetworkImage(request.station!.photoUrl),
                                child: request.station?.photoUrl.nullIfEmpty != null ? null : Text(request.station!.name.firstCharOrNull),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text(request.station?.name ?? "Station"),
                              subtitle: Text(request.station?.address.raw ?? "Address"),
                              onTap: () {
                                showDetailsStationModelDailog(context, request.station!);
                              },
                            ),
                            Divider(),
                            const ListTile(
                              leading: Icon(FluentIcons.person_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Current reviewer"),
                              enabled: false,
                            ),
                            // reviewer
                            if (request.reviewer != null)
                              ListTile(
                                leading: const Icon(FluentIcons.person_24_regular),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                visualDensity: const VisualDensity(vertical: -3),
                                title: Text(request.reviewer!.displayName),
                                subtitle: Text("Reviewer"),
                                onTap: () {
                                  showDetailsProfileModelDailog(context, request.reviewer!);
                                },
                              )
                            else
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text("No Reviewer"),
                                ),
                              ),

                            Divider(),
                            const ListTile(
                              leading: Icon(FluentIcons.shield_error_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Problem details"),
                              enabled: false,
                            ),
                            AppTextFormField(
                              enabled: false,
                              mode: AppTextFormFieldMode.dateTime,
                              initialValue: request.date?.toIso8601String(),
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              onChanged: (v) async {
                                request.date = DateTime.tryParse(v);
                              },
                              validator: (v) {
                                if (v == null || v.isEmpty) {
                                  return "Date is required";
                                }
                                return null;
                              },
                              decoration: InputDecoration(errorText: _errors['date'], prefixIcon: const Icon(FluentIcons.calendar_32_regular), label: const Text('Time of the problem'), alignLabelWithHint: true, border: InputBorder.none, fillColor: Colors.transparent),
                            ),
                            AppTextFormField(
                              enabled: false,
                              initialValue: request.note,
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              onChanged: (v) async {
                                request.note = v;
                              },
                              decoration: InputDecoration(errorText: _errors['note'], prefixIcon: const Icon(FluentIcons.note_24_regular), label: const Text('Client note'), alignLabelWithHint: true, border: InputBorder.none, fillColor: Colors.transparent),
                            ),
                            Divider(),
                            const ListTile(
                              leading: Icon(FluentIcons.document_20_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Attachments"),
                              enabled: false,
                            ),
                            for (AttachmentModel item in request.attachments ?? [])
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: ListTile(
                                  leading: const Icon(FluentIcons.document_20_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: Text(item.name ?? "Attachment"),
                                  subtitle: Text(item.mimeType ?? "Unknown"),
                                  onTap: () async {
                                    try {
                                      await launchUrlString(item.src);
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(e.toString()),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            Divider(),
                            const ListTile(
                              leading: Icon(FluentIcons.status_24_regular),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Current status"),
                              enabled: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MenuAnchor(
                                menuChildren: <Widget>[
                                  for (final item in AssistanceStatus.values)
                                    MenuItemButton(
                                      leadingIcon: request.visibility == item ? const Icon(FluentIcons.checkmark_24_regular) : const Icon(FluentIcons.clear_formatting_24_regular),
                                      child: Text(item.name.titleCase),
                                      onPressed: request.status == item
                                          ? null
                                          : () => setState(
                                                () {
                                                  request.status = item;
                                                },
                                              ),
                                    ),
                                ],
                                builder: (BuildContext context, MenuController controller, Widget? child) {
                                  return ListTile(
                                    leading: const Icon(FluentIcons.people_team_24_regular),
                                    contentPadding: EdgeInsets.only(left: 12),
                                    visualDensity: VisualDensity(vertical: -3),
                                    title: Text(request.status!.name.titleCase),
                                    subtitle: Text("Select Status"),
                                    trailing: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: const Icon(FluentIcons.chevron_down_24_regular),
                                    ),
                                    onTap: () {
                                      if (controller.isOpen) {
                                        controller.close();
                                      } else {
                                        controller.open();
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                            Divider(),

                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: const VisualDensity(vertical: -3),
                              title: const Text("Technicians"),
                              enabled: false,
                              trailing: IconButton(
                                icon: const Icon(FluentIcons.add_24_regular),
                                onPressed: () async {
                                  var profiles = await showProfilesPickerDialog(context, filters: [
                                    IndexViewFilter(
                                      name: "Technicians",
                                      active: true,
                                      local: (model) => model.roles.contains(Role("technician")),
                                      remote: (query) => query.where("roles", arrayContains: "technician"),
                                      strict: false,
                                      fixed: true,
                                    )
                                  ]);
                                  // profiles?.removeWhere((element) => _technicians.value.containsKey(element.ref.id));
                                  profiles?.removeWhere((element) => request.technicians!.containsKey(element.ref.id));
                                  if (profiles != null) {
                                    // _technicians.value = {
                                    //   ..._technicians.value,
                                    //   ...Map.fromEntries(
                                    //     profiles.map(
                                    //       (e) => MapEntry(e.ref.id, e),
                                    //     ),
                                    //   ),
                                    // };
                                    // // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                    // _technicians.notifyListeners();
                                    setState(() {
                                      request.technicians = {
                                        ...request.technicians!,
                                      }..addEntries(
                                          profiles.map(
                                            (e) => MapEntry(e.ref.id, e),
                                          ),
                                        );
                                    });
                                  }
                                  // var technicians = await showDialog<Map<String, ProfileModel>>(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return SelectTechniciansDialog(selected: _technicians.value);
                                  //   },
                                  // );
                                  // if (technicians != null) {
                                  //   _technicians.value = technicians;
                                  // }
                                },
                              ),
                            ),
                            Column(
                              children: [
                                for (var tech in request.technicians!.values.toList())
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                                      onTap: () async {
                                        //
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: tech.photoUrl.isEmpty
                                            ? null
                                            : NetworkImage(
                                                tech.photoUrl,
                                              ),
                                        child: tech.photoUrl != null ? null : const Icon(FluentIcons.person_24_regular),
                                      ),
                                      title: Text(tech.displayName),
                                      trailing: IconButton(
                                        icon: const Icon(FluentIcons.delete_24_regular),
                                        onPressed: () {
                                          // _technicians.value = {
                                          //   ..._technicians.value,
                                          // }..removeWhere((key, value) => value.ref.id == tech.ref.id);
                                          setState(() {
                                            request.technicians = {
                                              ...request.technicians!..removeWhere((key, value) => value.ref.id == tech.ref.id)
                                            };
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            // intervention is model
                            Divider(),
                            const ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Intervention Information"),
                              enabled: false,
                            ),
                            if (request.intervention != null)
                              Card(
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                child: ListTile(
                                  leading: const Icon(FluentIcons.gas_pump_24_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: Text(request.intervention!.description ?? "No description"),
                                  subtitle: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(request.intervention!.type.name),
                                      Divider(),
                                      Text("Intervated at: " + DateFormat.yMMMMEEEEd().format(request.intervention!.date)),
                                      Divider(),
                                      Text("Created at: " + DateFormat.yMMMMEEEEd().format(request.intervention!.createdAt)),
                                      Text("Updated at: " + DateFormat.yMMMMEEEEd().format(request.intervention!.updatedAt)),
                                    ],
                                  ),
                                  onTap: () {
                                    // showDetailsInterventionModelDailog(context, request.intervention!);
                                  },
                                ),
                              )
                            else
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text("No Intervention"),
                                ),
                              ),
                            const SizedBox(
                              height: 20,
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 12),
                            //   child: SwitchListTile(
                            //     secondary:
                            //         const Icon(FluentIcons.presence_blocked_24_regular),
                            //     contentPadding: EdgeInsets.only(left: 12),
                            //     visualDensity: VisualDensity(vertical: -3),
                            //     title: Text('Blocked'),
                            //     value: _disabled,
                            //     onChanged: (e) => setState(() {
                            //       _disabled = e;
                            //     }),
                            //   ),
                            // ),
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
