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
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              // Divider(),
              // const ListTile(
              //   leading: Icon(FluentIcons.person_24_regular),
              //   contentPadding: EdgeInsets.symmetric(horizontal: 24),
              //   visualDensity: VisualDensity(vertical: -3),
              //   title: Text("Current reviewer"),
              //   enabled: false,
              // ),
              // // reviewer
              // if (request.reviewer != null)
              //   ListTile(
              //     leading: const Icon(FluentIcons.person_24_regular),
              //     contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              //     visualDensity: const VisualDensity(vertical: -3),
              //     title: Text(request.reviewer!.displayName),
              //     subtitle: Text("Reviewer"),
              //     onTap: () {
              //       showDetailsProfileModelDailog(context, request.reviewer!);
              //     },
              //   )
              // else
              //   const Center(
              //     child: Padding(
              //       padding: EdgeInsets.all(12),
              //       child: Text("No Reviewer"),
              //     ),
              //   ),
              Divider(),
              const ListTile(
                leading: Icon(FluentIcons.star_28_regular),
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                visualDensity: VisualDensity(vertical: -3),
                title: Text("Assistance feedback"),
                enabled: false,
              ),
              // reviewer
              if (widget.model?.feedback != null)
                Card(
                  margin: const EdgeInsets.only(
                    bottom: 14,
                    left: 24,
                    right: 24,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: ProfileAvatar(profile: widget.model!.feedback!.profile),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                          visualDensity: const VisualDensity(vertical: -3),
                          title: Row(
                            children: [
                              Text(widget.model!.feedback!.profile.displayName),
                              const SizedBox(width: 8),
                              if (widget.model?.feedback?.profile != null)
                              DataFlagWidget(
                                custom: widget.model!.feedback!.profile.roles.firstOrNull?.name ?? "?"
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcATop,
                                    shaderCallback: (Rect bounds) {
                                      // widget.model!.feedback!.rate is (0 - 1) and we need (0 - 5) ANS APPLY ceil
                                      return LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.amber,
                                          Colors.grey.withOpacity(0.5),
                                        ],
                                        stops: [
                                          widget.model!.feedback!.rate,
                                          widget.model!.feedback!.rate,
                                        ],
                                      ).createShader(bounds);
                                    },
                                    child: Row(
                                      children: [
                                        for (int i = 0; i < 5; i++) Icon(FluentIcons.star_24_filled, color: Colors.black),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text((widget.model!.feedback!.rate * 5).toStringAsFixed(1)),
                                ],
                              ),
                              Divider(),
                              widget.model!.feedback!.note?.nullIfEmpty == null ? DataFlagWidget.empty() : Text(widget.model!.feedback!.note!),
                            ],
                          ),
                          onTap: () {
                            showDetailsProfileModelDailog(context, widget.model!.feedback!.profile);
                          },
                        ),
                        // const SizedBox(height: 10),
                        // Text(widget.model!.feedback!.date != null ? DateFormat.yMMMMEEEEd().format(widget.model!.feedback!.date!) : "No date"),
                        // const SizedBox(height: 10),
                        // Text(widget.model!.feedback!.reviewer?.displayName ?? "No reviewer"),
                      ],
                    ),
                  ),
                )
              else
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text("No feedback yet"),
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
                        leadingIcon: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: item.color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Text(item.name.titleCase),
                        onPressed: request.status == item
                            ? null
                            : () => setState(
                                  () {
                                    request.status = item;
                                    _submit();
                                  },
                                ),
                      ),
                  ],
                  builder: (BuildContext context, MenuController controller, Widget? child) {
                    return ListTile(
                      leading: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: request.status?.color,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
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
              // Divider(),
              if (false) ...[
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
                                    local: (model) => model.roles.map((e) => e.name).contains("technician"),

                          remote: (query) => query.where("roles", arrayContains: "technician"),
                          strict: false,
                          fixed: true,
                        )
                      ]);
                      if (profiles != null) {
                        setState(() {
                          request.technicians = [
                            ...?request.technicians?.where((e) => !profiles.any((c) => c.ref.path == e.ref.path)),
                            ...profiles
                          ];
                        });
                      }
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (ProfileModel tech in request.technicians ?? [])
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                          onTap: () async {
                            showUpdateProfileModelDailog(context, tech);
                          },
                          leading: CircleAvatar(
                            backgroundImage: tech.photoUrl.isEmpty ? null : NetworkImage(tech.photoUrl),
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
                                request.technicians = [
                                  ...?request.technicians?.where((e) => e.ref.path != tech.ref.path),
                                ];
                              });
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ],
              SizedBox(height: 20),

              // // intervention is model
              // Divider(),
              // const ListTile(
              //   leading: Icon(FluentIcons.gas_pump_24_regular),
              //   contentPadding: EdgeInsets.symmetric(horizontal: 24),
              //   visualDensity: VisualDensity(vertical: -3),
              //   title: Text("Intervention Information"),
              //   enabled: false,
              // ),
              // if (request.intervention != null) ...[
              //   AppTextFormField(
              //     enabled: false,
              //     initialValue: request.intervention!.intervener == null ? "(No intervener)" : request.intervention!.intervener!.displayName,
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(FluentIcons.person_24_regular),
              //       label: const Text('Intervener'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     initialValue: request.intervention!.description.nullIfEmpty == null ? "(Nothing)" : request.intervention!.description,
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(FluentIcons.text_align_left_16_regular),
              //       label: const Text('Details'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     initialValue: request.intervention!.status.name,
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         Icons.circle,
              //         color: request.intervention!.status.color,
              //       ),
              //       label: const Text('Status'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     initialValue: request.intervention!.type.name,
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(request.intervention!.type.icon),
              //       label: const Text('Type'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     mode: AppTextFormFieldMode.dateTime,
              //     initialValue: request.intervention!.date?.toIso8601String(),
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     onChanged: (v) async {
              //       request.date = DateTime.tryParse(v);
              //     },
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(FluentIcons.calendar_3_day_28_regular),
              //       label: const Text('Intervation date'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     mode: AppTextFormFieldMode.dateTime,
              //     initialValue: request.intervention!.createdAt?.toIso8601String(),
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     onChanged: (v) async {
              //       request.date = DateTime.tryParse(v);
              //     },
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(FluentIcons.calendar_32_regular),
              //       label: const Text('Creation date'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     mode: AppTextFormFieldMode.dateTime,
              //     initialValue: request.intervention!.createdAt?.toIso8601String(),
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     onChanged: (v) async {
              //       request.date = DateTime.tryParse(v);
              //     },
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(FluentIcons.calendar_32_regular),
              //       label: const Text('Last Update date'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              //   AppTextFormField(
              //     enabled: false,
              //     mode: AppTextFormFieldMode.dateTime,
              //     initialValue: request.intervention!.deletedAt?.toIso8601String() ?? "(Not deleted)",
              //     margin: const EdgeInsets.symmetric(horizontal: 24),
              //     onChanged: (v) async {
              //       request.date = DateTime.tryParse(v);
              //     },
              //     decoration: InputDecoration(
              //       prefixIcon: const Icon(FluentIcons.calendar_32_regular),
              //       label: const Text('Deletion date'),
              //       alignLabelWithHint: true,
              //       border: InputBorder.none,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              // ] else
              //   const Center(
              //     child: Padding(
              //       padding: EdgeInsets.all(12),
              //       child: Text("No Intervention"),
              //     ),
              //   ),
              // const SizedBox(
              //   height: 20,
              // ),

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
    );
  }
}
