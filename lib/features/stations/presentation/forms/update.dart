import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:core/features/users/presentation/forms/update_profile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:lib/lib.dart';
import 'package:muskey/muskey.dart';
import 'package:shared/shared.dart';
import '../../data/models/station_model.dart';
import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [UpdateStationForm] is a form to update a new user
class UpdateStationForm extends StatefulWidget {
  final String ref;
  final StationModel model;
  final VoidCallback? onCancel;
  final Null Function(StationModel station)? onUpdated;
  const UpdateStationForm({Key? key, this.onUpdated, this.onCancel, required this.model, required this.ref}) : super(key: key);

  @override
  State<UpdateStationForm> createState() => _UpdateStationFormState();
}

class _UpdateStationFormState extends State<UpdateStationForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = StationUpdateRequest(
    id: widget.model.ref.id,
    name: widget.model.name,
    address: widget.model.address ?? AddressModel(raw: ""),
    email: widget.model.email ?? "",
    photoUrl: widget.model.photoUrl,
    phoneNumbers: widget.model.phoneNumbers,
    technicians: widget.model.technicians,
    owners: widget.model.owners,
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

      try {
        await StationRepository.instance.update(request);
        widget.onUpdated?.call(widget.model.copyWith(
          name: request.name ?? widget.model.name,
          address: request.address ?? widget.model.address,
          email: request.email ?? widget.model.email,
          photoUrl: request.photoUrl ?? widget.model.photoUrl,
          phoneNumbers: request.phoneNumbers ?? widget.model.phoneNumbers,
          technicians: request.technicians ?? widget.model.technicians,
          owners: request.owners ?? widget.model.owners,
        ));
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
                  pinned: true,
                  expandedHeight: 200,
                  floating: true,
                  excludeHeaderSemantics: true,
                  forceElevated: true,
                  primary: true,
                  snap: true,
                  stretch: true,
                  stretchTriggerOffset: 100,
                  flexibleSpace: widget.model.photoUrl == null
                      ? null
                      : FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      widget.model.photoUrl!,
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
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: request.photoUrl == null
                                            ? null
                                            : NetworkImage(
                                                request.photoUrl!,
                                              ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      request.name!,
                                      style: const TextStyle(
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
                  title: const Text('Update Station'),
                  leading: const BackButton(),
                  actions: [
                    TextButton.icon(
                      onPressed: () async {
                        await _submit();
                      },
                      label: const Text('Update'),
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
                            const SizedBox(height: 20),

                            const ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Station Information"),
                              enabled: false,
                            ),

                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.name,
                              onChanged: (v) {
                                request.name = v;
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['name'],
                                prefixIcon: const SizedBox(child: Icon(FluentIcons.person_24_regular)),
                                label: const Text('Name'),
                                alignLabelWithHint: true,
                                helperText: 'The name of the user, required *',
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// phone number
                            AppTextFormField.upload(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.photoUrl,
                              onChanged: (v) {
                                request.photoUrl = v;
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.url()
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['photoUrl'],
                                prefixIcon: const Icon(FluentIcons.image_28_regular),
                                label: const Text('Photo url'),
                                alignLabelWithHint: true,
                                helperText: 'direct link to the photo',
                              ),
                            ),
                            const SizedBox(height: 10),

                            /// email
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.email,
                              onChanged: (v) {
                                request.email = v;
                              },
                              validator: FormBuilderValidators.compose([
                                // FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['email'],
                                prefixIcon: const Icon(FluentIcons.mail_24_regular),
                                label: const Text('Email'),
                                alignLabelWithHint: true,
                                helperText: 'can be null, but must be valid if provided',
                              ),
                            ),
                            const SizedBox(height: 10),
                            // / phone number
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 24),
                                Flexible(
                                  child: AppTextFormField(
                                    controller: _phoneTmpController,
                                    inputFormatters: [
                                      MuskeyFormatter(
                                        masks: [
                                          '#########'
                                        ],
                                        overflow: OverflowBehavior.forbidden(),
                                      )
                                    ],
                                    validator: (v) {
                                      if (v == null || v.isEmpty) return null;
                                      var valicator = FormBuilderValidators.compose([
                                        // FormBuilderValidators.required(),
                                        FormBuilderValidators.numeric(),
                                        FormBuilderValidators.equalLength(9),
                                      ]);
                                      return valicator(v);
                                    },
                                    decoration: InputDecoration(
                                      // border radius only for the left side
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(40),
                                        ),
                                      ),
                                      errorText: _errors['phone'],
                                      prefixIcon: const Icon(FluentIcons.phone_24_regular),
                                      prefixText: "+213",
                                      label: const Text('Phone Number'),
                                      alignLabelWithHint: true,
                                      helperText: 'must be 9 digits, without 0',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  child: FilledButton.icon(
                                    // radius only for the left side
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(40),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_phoneTmpController.text.isNotEmpty) {
                                        request.phoneNumbers = [
                                          ...request.phoneNumbers!,
                                          '+213' + _phoneTmpController.text
                                        ];
                                        _phoneTmpController.clear();
                                      }
                                    },
                                    label: const Text('Add'),
                                    icon: const Icon(FluentIcons.add_24_regular),
                                  ),
                                ),
                                const SizedBox(width: 24),
                              ],
                            ),
                            Wrap(
                              children: [
                                for (var phone in request.phoneNumbers ?? [])
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Chip(
                                      label: Text(phone),
                                      onDeleted: () {
                                        // _phoneNumbers.value = [
                                        //   ..._phoneNumbers.value..remove(phone)
                                        // ];
                                        setState(() {
                                          request.phoneNumbers = [
                                            ...request.phoneNumbers!..remove(phone)
                                          ];
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),

                            const Divider(),
                            // address
                            const ListTile(
                              leading: Icon(FluentIcons.location_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Address"),
                              enabled: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppTextFormField(
                                      key:  Key((request.address?.state).toString()),
                                      initialValue: (request.address?.state),
                                      onTap: (v) async {
                                        var state = await showStatePicker(context);
                                        if (state != v) {
                                          setState(() {
                                            request.address = request.address?.copyWith(city: null);
                                          });
                                        }
                                        print(state);
                                        if (state != null) {
                                          setState(() {
                                            request.address = request.address?.copyWith(state: state.toLowerCase());
                                          });
                                        }
                                      },
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      decoration: InputDecoration(
                                        errorText: _errors['state'],
                                        prefixIcon: const Icon(FluentIcons.location_24_regular),
                                        label: const Text('State'),
                                        alignLabelWithHint: true,
                                        helperText: 'The state of the address, required *',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: AppTextFormField(
                                      key:  Key((request.address?.city).toString()),
                                      initialValue: (request.address?.city),
                                      onTap: (value) async {
                                        var city = await showCityPicker(context, state: request.address?.state);
                                        if (city != null) {
                                          setState(() {
                                            request.address = request.address?.copyWith(
                                              city: city["commune_name_ascii"].toString().toLowerCase(),
                                            );
                                          });
                                        }
                                      },
                                      enabled: request.address?.state != null,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                      ]),
                                      decoration: InputDecoration(
                                        errorText: _errors['city'],
                                        prefixIcon: const Icon(FluentIcons.location_24_regular),
                                        label: const Text('City'),
                                        alignLabelWithHint: true,
                                        helperText: 'The city of the address, required *',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // raw
                            AppTextFormField(
                              initialValue: request.address?.raw,
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              onChanged: (v) async {
                                request.address = request.address?.copyWith(raw: v);
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['raw'],
                                prefixIcon: const Icon(FluentIcons.location_24_regular),
                                label: const Text('Raw'),
                                alignLabelWithHint: true,
                                helperText: 'The raw address, required *',
                              ),
                            ),
                            const Divider(),
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
                                    for (var tech in 
                                    request.technicians!.values.toList()
                                    )
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
                            const Divider(),
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: const VisualDensity(vertical: -3),
                              title: const Text("Owners"),
                              enabled: false,
                              trailing: IconButton(
                                icon: const Icon(FluentIcons.add_24_regular),
                                onPressed: () async {
                                  var profiles = await showProfilesPickerDialog(context, filters: [
                                    IndexViewFilter(
                                      name: "Clients",
                                      active: true,
                                      local: (model) => model.roles.contains(Role("client")),
                                      remote: (query) => query.where("roles", arrayContains: "client"),
                                      strict: false,
                                      fixed: true,
                                    )
                                  ]);
                                  // profiles?.removeWhere((element) => _owners.value.containsKey(element.ref.id));
                                  profiles?.removeWhere((element) => request.owners!.containsKey(element.ref.id));
                                  if (profiles != null) {
                                    // _owners.value = {
                                    //   ..._owners.value,
                                    //   ...Map.fromEntries(
                                    //     profiles.map(
                                    //       (e) => MapEntry(e.ref.id, e),
                                    //     ),
                                    //   ),
                                    // };
                                    // _owners.notifyListeners();
                                    setState(() {
                                      request.owners = {
                                        ...request.owners!,
                                      }..addEntries(
                                          profiles.map(
                                            (e) => MapEntry(e.ref.id, e),
                                          ),
                                        );
                                    });
                                  }
                                },
                              ),
                            ),
                            Column(
                                  children: [
                                    for (var owner in 
                                    request.owners!.values.toList()
                                    )
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24),
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                                          onTap: () async {
                                            //
                                          },
                                          leading: CircleAvatar(
                                            backgroundImage: owner.photoUrl.isEmpty
                                                ? null
                                                : NetworkImage(
                                                    owner.photoUrl,
                                                  ),
                                            child: owner.photoUrl != null ? null : const Icon(FluentIcons.person_24_regular),
                                          ),
                                          title: Text(owner.displayName),
                                          trailing: IconButton(
                                            icon: const Icon(FluentIcons.delete_24_regular),
                                            onPressed: () {
                                              // _owners.value = {
                                              //   ..._owners.value,
                                              // }..removeWhere((key, value) => value.ref.id == owner.ref.id);
                                              setState(() {
                                                request.owners = {
                                                  ...request.owners!..removeWhere((key, value) => value.ref.id == owner.ref.id)
                                                };
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
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
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 12),
                            //   child: SwitchListTile(
                            //     contentPadding: EdgeInsets.only(left: 12),
                            //     visualDensity: VisualDensity(vertical: -3),
                            //     title: Text('Email Verified'),
                            //     value: _emailVerified,
                            //     onChanged: (e) => setState(() {
                            //       _emailVerified = e;
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
