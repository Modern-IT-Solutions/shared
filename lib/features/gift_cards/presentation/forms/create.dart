import 'dart:math';

import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared/models/gift_card_model.dart';
import 'package:shared/shared.dart';

import '../../domain/request/requests.dart';

/// [CreateGiftCardForm] is a form to create a new user
class CreateGiftCardForm extends StatefulWidget {
  final String? ref;
  final VoidCallback? onCancel;
  final void Function(GiftCardModel model)? onCreated;
  final void Function(List<GiftCardModel> models)? onCreateMultiple;
  const CreateGiftCardForm({Key? key, this.onCreated, this.onCreateMultiple, this.onCancel, this.ref}) : super(key: key);

  @override
  State<CreateGiftCardForm> createState() => _CreateGiftCardFormState();
}

class _CreateGiftCardFormState extends State<CreateGiftCardForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = GiftCardCreateRequest(
    ref: widget.ref?.nullIfEmpty == null ? ModelRef.random("giftCards") : ModelRef(widget.ref!),
    currency: "DZD",
  );

  bool _loading = false;
  double? _progress;
  late String? _error;
  late Map<String, String> _errors;

  @override
  void initState() {
    super.initState();
    _error = null;
    _errors = {};

    // generate code
    if (request.code?.nullIfEmpty == null) {
      request.code = generateCode();
    }
  }

  String generateCode() {
    // code is 11 characters A-Z 0-9
    var code = "";
    var random = Random();
    for (var i = 0; i < 11; i++) {
      var n = random.nextInt(36);
      if (n < 10) {
        code += n.toString();
      } else {
        code += String.fromCharCode(n + 55);
      }
    }
    return code;
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
        if (_creationType == "single") {
          var item = GiftCardModel.fromJson({
            ...data,
            "createdAt": Timestamp.now(),
            "updatedAt": Timestamp.now(),
          });
          await setDocument(path: request.ref.path, data: data);
          widget.onCreated?.call(item);
        } else {
          setState(() {
            _loading = true;
            _progress = 0.0;
          });
          var items = <GiftCardModel>[];
          for (var i = 1; i <= _quantity!; i++) {
            var item = GiftCardModel.fromJson({
              ...data,
              "ref": request.ref.path + "_$i",
              "code": generateCode(),
              // inject rootid in metadata
              "metadata": <String, dynamic>{
                ...(data['metadata'] ?? {}),
                "rootId": request.ref.id,
                "subId": i,
              },
              "createdAt": Timestamp.now(),
              "updatedAt": Timestamp.now(),
            });
            await setDocument(path: item.ref.path, data: item.toJson());
            items.add(item);
            setState(() {
              _progress = i / _quantity!;
            });
          }
          setState(() {
            _progress = null;
            _loading = false;
          });
          widget.onCreateMultiple?.call(items);
        }
        // var item = GiftCardModel.fromJson(data);
        // await setDocument(path: request.ref.path, data: data);
        // widget.onCreated?.call(item);
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
        _progress = null;
      });
    }
  }

  String? _creationType = 'single';
  int? _quantity;

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: _loading,
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
            title: const Text('Submit GiftCards'),
            leading: const BackButton(),
            actions: [
              TextButton.icon(
                onPressed: () async {
                  await _submit();
                },
                label: _loading && _progress != null
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          value: _progress,
                        ))
                    : const Text('Submit'),
                icon: const Icon(FluentIcons.checkmark_24_regular),
              ),
              const SizedBox(width: 12),
            ],
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                /// max width is 600
                constraints: const BoxConstraints(maxWidth: 600),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // segments: single,multiple
                      SegmentedButton(
                        segments: [
                          ButtonSegment(
                            label: const Text('Single'),
                            value: 'single',
                            icon: Icon(FluentIcons.tap_single_20_regular),
                          ),
                          ButtonSegment(
                            label: const Text('Multiple'),
                            value: 'multiple',
                            icon: Icon(FluentIcons.tap_double_20_regular),
                          ),
                        ],
                        selected: {
                          _creationType
                        },
                        onSelectionChanged: (v) {
                          setState(() {
                            _creationType = v.first;
                          });
                        },
                      ),

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
                        title: Text("GiftCard Information"),
                        enabled: false,
                      ),

                      AppTextFormField(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.amount?.toString(),
                        onChanged: (v) {
                          request.amount = double.tryParse(v);
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          // must be positive
                          (v) {
                            var n = double.tryParse(v.toString());
                            if (n == null) return "required";
                            if (n < 0) return "must be positive";
                            return null;
                          }
                        ]),
                        decoration: InputDecoration(
                          errorText: _errors['amount'],
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.card_ui_24_regular)),
                          label: const Text('amount'),
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: 14),
                      if (_creationType == "single") ...[
                        AppTextFormField(
                          key: UniqueKey(),
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          initialValue: request.code,
                          onChanged: (v) {
                            request.code = v;
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.equalLength(11),
                          ]),
                          decoration: InputDecoration(
                            errorText: _errors['code'],
                            prefixIcon: const SizedBox(child: Icon(FluentIcons.code_24_regular)),
                            label: const Text('code'),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ] else ...[
                        // quantity
                        AppTextFormField(
                          key: UniqueKey(),
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          initialValue: _quantity?.toString(),
                          onChanged: (v) {
                            _quantity = int.tryParse(v);
                          },
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                            FormBuilderValidators.min(1),
                            FormBuilderValidators.max(10000),
                          ]),
                          decoration: InputDecoration(
                            errorText: _errors['quantity'],
                            prefixIcon: const SizedBox(child: Icon(FluentIcons.card_ui_20_regular)),
                            label: const Text('quantity'),
                            alignLabelWithHint: true,
                          ),
                        ),
                      ],
                      const SizedBox(height: 14),

                      // expiresAt
                      AppTextFormField(
                        key: ValueKey(request.expiresAt?.toIso8601String()),
                        mode: AppTextFormFieldMode.dateTime,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.expiresAt?.toIso8601String(),
                        onChanged: (v) {
                          setState(() {
                            request.expiresAt = DateTime.tryParse(v);
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.calendar_24_regular)),
                          label: const Text('Expires At'),
                          alignLabelWithHint: true,
                        ),
                        // must be after today, and before 1 year
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          (v) {
                            var n = DateTime.tryParse(v.toString());
                            if (n == null) return "required";
                            if (n.isBefore(DateTime.now())) return "must be after today";
                            if (n.isAfter(DateTime.now().add(const Duration(days: 365)))) return "must be before 1 year";
                            return null;
                          }
                        ]),
                      ),

                      const SizedBox(height: 14),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: SwitchListTile(
                          secondary: const Icon(FluentIcons.presence_blocked_24_regular),
                          contentPadding: const EdgeInsets.only(left: 12),
                          visualDensity: const VisualDensity(vertical: -3),
                          title: const Text('Freezed'),
                          subtitle: const Text('temporarily blocked from use'),
                          value: request.freezed ?? false,
                          onChanged: (e) => setState(() {
                            request.freezed = e;
                          }),
                        ),
                      ),
                      Divider(),
                      const ListTile(
                        leading: Icon(FluentIcons.data_bar_horizontal_24_regular),
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text("Metadata"),
                        enabled: false,
                      ),
                      // select supplier
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: request.owner?.photoUrl.nullIfEmpty != null
                              ? CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(request.owner!.photoUrl),
                                )
                              : const Icon(FluentIcons.people_team_24_regular),
                          contentPadding: EdgeInsets.only(left: 12),
                          visualDensity: VisualDensity(vertical: -3),
                          title: Text(request.owner?.displayName ?? "Select supplier"),
                          subtitle: Text("Select the supplier"),
                          trailing: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: const Icon(FluentIcons.chevron_down_24_regular),
                          ),
                          onTap: () async {
                            var profiles = await showProfilesPickerDialog(context,
                                filters: [
                                  IndexViewFilter(
                                    name: "Suppliers",
                                    active: true,
                                    local: (model) => model.roles.map((e) => e.name).contains("supplier"),
                                    remote: (query) => query.where("roles", arrayContains: "supplier"),
                                    strict: false,
                                    fixed: true,
                                  )
                                ],
                                length: 1);
                            if (profiles != null && profiles.isNotEmpty) {
                              request.owner = profiles.first;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                      Divider(),
                      const ListTile(
                        leading: Icon(FluentIcons.data_bar_horizontal_24_regular),
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text("Readonly"),
                        enabled: false,
                      ),
                      AppTextFormField(
                        key: UniqueKey(),
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: _creationType == "single" ? request.ref.path : request.ref.path + "_{index}",
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {
                          // request.date = DateTime.tryParse(v);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('ID'),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),
                      AppTextFormField(
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: request.createdAt?.toIso8601String() ?? "(Not created)",
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {
                          // request.date = DateTime.tryParse(v);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('Creation date'),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),
                      AppTextFormField(
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: request.createdAt?.toIso8601String() ?? "(Not created)",
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {
                          // request.date = DateTime.tryParse(v);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('Last Create date'),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),
                      AppTextFormField(
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: request.deletedAt?.toIso8601String() ?? "(Not deleted)",
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {},
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('Deletion date'),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
