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
import 'package:shared/models/unit_model.dart';
import 'package:shared/models/unit_section_item_model.dart';
import 'package:shared/shared.dart';
import '../../data/models/station_model.dart';
import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [UpdateUnitSectionItemForm] is a form to update a new user
class UpdateUnitSectionItemForm extends StatefulWidget {
  final String ref;
  final UnitSectionItemModel? model;
  final VoidCallback? onCancel;
  final Null Function(UnitSectionItemModel station)? onUpdated;
  final Null Function(UnitSectionItemModel station)? onCreated;
  const UpdateUnitSectionItemForm({Key? key, this.onUpdated, this.onCreated, this.onCancel, required this.model, required this.ref}) : super(key: key);

  @override
  State<UpdateUnitSectionItemForm> createState() => _UpdateUnitSectionItemFormState();
}

class _UpdateUnitSectionItemFormState extends State<UpdateUnitSectionItemForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = UnitSectionItemUpdateRequest(
    ref: widget.model?.ref ?? ModelRef(widget.ref),
    title: widget.model?.title ?? "",
    description: widget.model?.description,
    isFree: widget.model?.isFree ?? false,
    order: widget.model?.order ?? 100000000,
    type: widget.model?.type ?? UnitSectionItemType.video,
    url: widget.model?.url ?? "",
    hash: widget.model?.hash ?? "",
    poster: widget.model?.poster,
    isLive: widget.model?.isLive ?? false,
    useYoutubePlayer: widget.model?.useYoutubePlayer ?? false,
    createdAt: widget.model?.createdAt ?? DateTime.now(),
    deletedAt: widget.model?.deletedAt,
    updatedAt: widget.model?.updatedAt ?? DateTime.now(),
    visibility: widget.model?.visibility ?? ModelVisibility.visible,
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
      var hash = request.hash ?? widget.model?.hash;
      if (hash != null && hash.length <= 20) {
        hash = await getSecurity().encryptVideo(hash);
      }
      setState(() {
        _errors = {};
        _error = null;
        _loading = true;
      });
      var data = {
        ...request.data,
        'hash': hash,
      };

      try {
        if (widget.model != null) {
          await updateDocument(path: request.ref.path, data: data);
          widget.onUpdated?.call(widget.model!.copyWith(
            title: request.title ?? widget.model!.title,
            description: request.description ?? widget.model!.description,
            isFree: request.isFree ?? widget.model!.isFree,
            order: request.order ?? widget.model!.order,
            type: request.type ?? widget.model!.type,
            url: request.url ?? widget.model!.url,
            hash: hash ?? widget.model!.hash,
            poster: request.poster ?? widget.model!.poster,
            isLive: request.isLive ?? widget.model!.isLive,
            useYoutubePlayer: request.useYoutubePlayer ?? widget.model!.useYoutubePlayer,
            createdAt: request.createdAt ?? widget.model!.createdAt,
            deletedAt: request.deletedAt ?? widget.model!.deletedAt,
            updatedAt: request.updatedAt ?? widget.model!.updatedAt,
            visibility: request.visibility ?? widget.model!.visibility,
          ));
        } else if (widget.ref.nullIfEmpty != null) {
          var item = UnitSectionItemModel.fromJson(data);
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
                  title: const Text('Submit UnitSectionItem'),
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
                            SegmentedButton<UnitSectionItemType>(
                              segments: [
                                for (var type in UnitSectionItemType.values) ButtonSegment(value: type, label: Text(type.name), icon: Icon(Icons.calendar_view_day)),
                              ],
                              selected: {
                                request.type!
                              },
                              onSelectionChanged: (Set<UnitSectionItemType> newSelection) {
                                setState(() {
                                  // By default there is only a single segment that can be
                                  // selected at one time, so its value is always the first
                                  // item in the selected set.
                                  request.type = newSelection.first;
                                });
                              },
                            ),
                            const SizedBox(height: 20),

                            const ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("UnitSectionItem Information"),
                              enabled: false,
                            ),

                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.title,
                              onChanged: (v) {
                                request.title = v;
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['title'],
                                prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                label: const Text('title'),
                                alignLabelWithHint: true,
                                helperText: 'The title of the item, required *',
                              ),
                            ),

                            const SizedBox(height: 10),

                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.description,
                              onChanged: (v) {
                                request.description = v;
                              },
                              validator: FormBuilderValidators.compose([]),
                              decoration: InputDecoration(
                                errorText: _errors['description'],
                                prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                label: const Text('description'),
                                alignLabelWithHint: true,
                                helperText: 'The description of the item, required *',
                              ),
                            ),

                            const SizedBox(height: 10),

                            // order
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              initialValue: request.order?.toString(),
                              onChanged: (v) {
                                request.order = int.tryParse(v);
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['order'],
                                prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                label: const Text('order'),
                                alignLabelWithHint: true,
                                helperText: 'The order of the item, required *',
                              ),
                            ),

                            /// url AppTextFormField.upload
                            if (request.type == UnitSectionItemType.doc)
                              AppTextFormField.upload(
                                key: const Key('url'),
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                initialValue: request.url,
                                onChanged: (v) {
                                  request.url = v;
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: InputDecoration(
                                  errorText: _errors['url'],
                                  prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                  label: const Text('url'),
                                  alignLabelWithHint: true,
                                  helperText: 'The url of the item, required *',
                                ),
                              )
                            else if (request.type == UnitSectionItemType.quiz || request.type == UnitSectionItemType.live)
                              AppTextFormField(
                                key: const Key('url'),
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                initialValue: request.url,
                                onChanged: (v) {
                                  request.url = v;
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: InputDecoration(
                                  errorText: _errors['url'],
                                  prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                  label: const Text('url'),
                                  alignLabelWithHint: true,
                                  helperText: 'The url of the item, required *',
                                ),
                              )
                            else if (request.type == UnitSectionItemType.video)
                              AppTextFormField(
                                key: const Key('hash'),
                                margin: const EdgeInsets.symmetric(horizontal: 24),
                                initialValue: request.hash,
                                onChanged: (v) {
                                  request.hash = v;
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(),
                                ]),
                                decoration: InputDecoration(
                                  errorText: _errors['hash'],
                                  prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                                  label: const Text('hash'),
                                  alignLabelWithHint: true,
                                  helperText: 'The hash of the item, required *',
                                ),
                              ),
                            Divider(),
                            // isLive
                            if (request.type == UnitSectionItemType.video)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: SwitchListTile(
                                  secondary: const Icon(FluentIcons.video_security_24_regular),
                                  contentPadding: EdgeInsets.only(left: 12),
                                  visualDensity: VisualDensity(vertical: -3),
                                  title: Text('isLive'),
                                  value: request.isLive ?? false,
                                  onChanged: (e) => setState(() {
                                    request.isLive = e;
                                  }),
                                ),
                              ),
                            // useYoutubePlayer
                            if (request.type == UnitSectionItemType.video)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: SwitchListTile(
                                  secondary: const Icon(FluentIcons.video_security_24_regular),
                                  contentPadding: EdgeInsets.only(left: 12),
                                  visualDensity: VisualDensity(vertical: -3),
                                  title: Text('useYoutubePlayer'),
                                  value: request.useYoutubePlayer ?? false,
                                  onChanged: (e) => setState(() {
                                    request.useYoutubePlayer = e;
                                  }),
                                ),
                              ),
                            // isFree
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: SwitchListTile(
                                secondary: const Icon(FluentIcons.money_24_regular),
                                contentPadding: EdgeInsets.only(left: 12),
                                visualDensity: VisualDensity(vertical: -3),
                                title: Text('isFree'),
                                value: request.isFree ?? false,
                                onChanged: (e) => setState(() {
                                  request.isFree = e;
                                }),
                              ),
                            ),
                            Divider(),

                            Badge(
                              label: Text("NEW"),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: MenuAnchor(
                                  menuChildren: <Widget>[
                                    for (final item in ModelVisibility.values)
                                      MenuItemButton(
                                        leadingIcon: request.visibility == item ? const Icon(FluentIcons.checkmark_24_regular) : const Icon(FluentIcons.clear_formatting_24_regular),
                                        trailingIcon: Icon(item.icon),
                                        child: Text(item.name),
                                        onPressed: request.visibility == item
                                            ? null
                                            : () => setState(
                                                  () {
                                                    request.visibility = item;
                                                  },
                                                ),
                                      ),
                                  ],
                                  builder: (BuildContext context, MenuController controller, Widget? child) {
                                    return ListTile(
                                      leading: const Icon(FluentIcons.people_team_24_regular),
                                      contentPadding: EdgeInsets.only(left: 12),
                                      visualDensity: VisualDensity(vertical: -3),
                                      title: Text(request.visibility!.name),
                                      subtitle: Text("Select visibility"),
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
