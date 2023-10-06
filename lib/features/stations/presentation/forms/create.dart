import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:lib/lib.dart';
import 'package:muskey/muskey.dart';
import 'package:recase/recase.dart';
import 'package:shared/shared.dart';
import '../../data/models/station_model.dart';
import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [CreateStationForm] is a form to create a new user
class CreateStationForm extends StatefulWidget {
  final VoidCallback? onCancel;
  final Null Function(StationModel station)? onCreated;
  const CreateStationForm({
    Key? key,
    this.onCreated,
    this.onCancel,
  }) : super(key: key);

  @override
  State<CreateStationForm> createState() => _CreateStationFormState();
}

class _CreateStationFormState extends State<CreateStationForm> {
  final _formKey = GlobalKey<FormState>();

  // final ValueNotifier<Function?> _photoUploadTriger = ValueNotifier(null);
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _addressController;
  late final TextEditingController _photoUrlController;

  late final TextEditingController _phoneTmpController;

  late final ValueNotifier<GeoFirePoint?> _location;
  late final ValueNotifier<List<String>> _phoneNumbers;
  late final ValueNotifier<List<ProfileModel>> _technicians;

  bool _loading = false;
  late String? _error;
  late Map<String, String> _errors;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _photoUrlController = TextEditingController();

    _phoneTmpController = TextEditingController();

    _location = ValueNotifier<GeoFirePoint?>(null);
    _phoneNumbers = ValueNotifier<List<String>>([]);
    _technicians = ValueNotifier<List<ProfileModel>>([]);

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
      var createRequest = StationCreateRequest(
        name: _nameController.text,
        address: Address(
          raw: _addressController.text,
          location: _location.value ?? const GeoFirePoint(GeoPoint(0, 0)),
        ),
        email: _emailController.text,
        photoUrl: _photoUrlController.text,
        phoneNumbers: _phoneNumbers.value,
        technicians: _technicians.value,
      );
      try {
        widget.onCreated
            ?.call(await StationRepository.instance.create(createRequest));
      }
      // FirebaseFunctionsException
      on FirebaseFunctionsException catch (e) {
        setState(() {
          _error = e.message;
          if (e.details != null &&
              e.details['code'].toString().contains('phone')) {
            _errors['phone'] = e.details['message'];
          } else if (e.details != null &&
              e.details['code'].toString().contains('email')) {
            _errors['email'] = e.details['message'];
          } else if (e.details != null &&
              e.details['code'].toString().contains('password')) {
            _errors['password'] = e.details['message'];
          } else if (e.details != null &&
              e.details['code'].toString().toLowerCase().contains('name')) {
            _errors['name'] = e.details['message'];
          } else if (e.details != null &&
              e.details['code'].toString().toLowerCase().contains('photo')) {
            _errors['photo'] = e.details['message'];
          } else {
            _error = e.message;
          }
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
                ListenableBuilder(
                    listenable: Listenable.merge([
                      _photoUrlController,
                      _nameController,
                    ]),
                    builder: (context, _) {
                      return SliverAppBar(
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
                              Positioned(
                                left: 0,
                                right: 0,
                                child: CachedNetworkImage(
                                  imageUrl: _photoUrlController.text,
                                  errorWidget: (context, url, error) => Image(
                                    image:
                                        AssetImage("ColorImageProvider.petals.url"),
                                        fit: BoxFit.cover,
                                  ),
                                  placeholder: (context, url) => Image(
                                    image:
                                        AssetImage("ColorImageProvider.leaves.url"),
                                        fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(0.8),
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
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            blurRadius: 5,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                          _photoUrlController.text,
                                        ),
                                        // child: IconButton(
                                        //   onPressed: ()=>_photoUploadTriger.value?.call(),
                                        //   icon: Icon(
                                        //     FluentIcons.camera_24_regular,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      _nameController.text.isEmpty?
                                      '[Station Name]'
                                      : _nameController.text.titleCase,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(
                                          _nameController.text.isEmpty ? 0.5 : 1,
                                        ),
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
                        title: const Text('Create Station'),
                        leading: const BackButton(),
                        actions: [
                          TextButton.icon(
                            onPressed: () async {
                              await _submit();
                            },
                            label: const Text('Create'),
                            icon: const Icon(FluentIcons.checkmark_24_regular),
                          ),
                          const SizedBox(width: 12),
                        ],
                      );
                    }),
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("Station Information"),
                              enabled: false,
                            ),

                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _nameController,
                              // fileUploadTriger: _photoUploadTriger,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['name'],
                                prefixIcon: const SizedBox(
                                    child: Icon(
                                        FluentIcons.person_24_regular)),
                                label: const Text('Name'),
                                alignLabelWithHint: true,
                                helperText: 'The name of the user, required *',
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// phone number
                            AppTextFormField.upload(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _photoUrlController,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.url()]),
                              decoration: InputDecoration(
                                errorText: _errors['photoUrl'],
                                prefixIcon:
                                    const Icon(FluentIcons.image_28_regular),
                                label: const Text('Photo url'),
                                alignLabelWithHint: true,
                                helperText: 'direct link to the photo',
                              ),
                            ),
                            const SizedBox(height: 10),

                            /// email
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _emailController,
                              validator: FormBuilderValidators.compose([
                                // FormBuilderValidators.required(),
                                FormBuilderValidators.email(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['email'],
                                prefixIcon:
                                    const Icon(FluentIcons.mail_24_regular),
                                label: const Text('Email'),
                                alignLabelWithHint: true,
                                helperText:
                                    'can be null, but must be valid if provided',
                              ),
                            ),
                            const SizedBox(height: 10),

                            /// password
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _addressController,
                              validator: (v) {
                                if (v?.isNotEmpty != true) {
                                  return 'address is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                errorText: _errors['address'],
                                prefixIcon:
                                    const Icon(FluentIcons.location_24_regular),
                                label: const Text('Address'),
                                alignLabelWithHint: true,
                                helperText: 'required',
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
                                        masks: ['#########'],
                                        overflow: OverflowBehavior.forbidden(),
                                      )
                                    ],
                                    validator: (v) {
                                      if (v == null || v.isEmpty) return null;
                                      var valicator =
                                          FormBuilderValidators.compose([
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
                                      prefixIcon: const Icon(
                                          FluentIcons.phone_24_regular),
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
                                        _phoneNumbers.value = [
                                          ..._phoneNumbers.value,
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
                                ValueListenableBuilder<List<String>>(
                                  valueListenable: _phoneNumbers,
                                  builder: (context, value, child) {
                                    return Wrap(
                                      children: [
                                        for (var phone in value)
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Chip(
                                              label: Text(phone),
                                              onDeleted: () {
                                                _phoneNumbers.value = [
                                                  ..._phoneNumbers.value
                                                    ..remove(phone)
                                                ];
                                              },
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                            const Divider(),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: const VisualDensity(vertical: -3),
                              title: const Text("Technicians"),
                              enabled: false,
                              trailing: IconButton(
                                icon: const Icon(FluentIcons.add_24_regular),
                                onPressed: () async {
                                  var technicians =
                                      await showDialog<List<ProfileModel>>(
                                    context: context,
                                    builder: (context) {
                                      return SelectTechniciansDialog(
                                          selected: _technicians.value);
                                    },
                                  );
                                  if (technicians != null) {
                                    _technicians.value = technicians;
                                  }
                                },
                              ),
                            ),
                            ValueListenableBuilder<List<ProfileModel>>(
                              valueListenable: _technicians,
                              builder: (context, value, child) {
                                return Column(
                                  children: [
                                    for (var tech in value)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24),
                                        child: ListTile(
                                          contentPadding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          onTap: () async {
                                            //
                                          },
                                          leading: CircleAvatar(
                                            backgroundImage:
                                                tech.photoUrl == null
                                                    ? null
                                                    : NetworkImage(
                                                        tech.photoUrl ?? '',
                                                      ),
                                            child: tech.photoUrl != null
                                                ? null
                                                : const Icon(FluentIcons
                                                    .person_24_regular),
                                          ),
                                          title: Text(tech.displayName ?? ''),
                                          trailing: IconButton(
                                            icon: const Icon(
                                                FluentIcons.delete_24_regular),
                                            onPressed: () {
                                              _technicians.value = [
                                                ..._technicians.value
                                                  ..remove(tech)
                                              ];
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 10),
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
