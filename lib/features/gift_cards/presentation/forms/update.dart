import 'dart:math';

import 'package:core/features/users/presentation/dailogs.dart';
import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared/features/profiles/dailogs.dart';
import 'package:shared/models/gift_card_model.dart';
import 'package:shared/shared.dart';

import '../../domain/request/requests.dart';

/// [UpdateGiftCardForm] is a form to update a new user
class UpdateGiftCardForm extends StatefulWidget {
  final String ref;
  final GiftCardModel? model;
  final VoidCallback? onCancel;
  final Null Function(GiftCardModel station)? onUpdated;
  final Null Function(GiftCardModel station)? onCreated;
  const UpdateGiftCardForm({Key? key, this.onUpdated, this.onCreated, this.onCancel, required this.model, required this.ref}) : super(key: key);

  @override
  State<UpdateGiftCardForm> createState() => _UpdateGiftCardFormState();
}

class _UpdateGiftCardFormState extends State<UpdateGiftCardForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = GiftCardUpdateRequest(
    ref: widget.model?.ref ?? ModelRef(widget.ref),
    createdAt: widget.model?.createdAt ?? DateTime.now(),
    deletedAt: widget.model?.deletedAt,
    updatedAt: widget.model?.updatedAt ?? DateTime.now(),
    owner: widget.model?.owner,
    code: widget.model?.code,
    expiresAt: widget.model?.expiresAt,
    amount: widget.model?.amount,
    currency: widget.model?.currency.nullIfEmpty ?? "DZD",
    transaction: widget.model?.transaction,
    metadata: widget.model?.metadata,
    freezed: widget.model?.freezed,
  );

  bool _loading = false;
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
        if (widget.model != null) {
          await updateDocument(path: request.ref.path, data: data);
          widget.onUpdated?.call(widget.model!.copyWith(
            createdAt: request.createdAt ?? widget.model!.createdAt,
            deletedAt: request.deletedAt ?? widget.model!.deletedAt,
            updatedAt: request.updatedAt ?? widget.model!.updatedAt,
            owner: request.owner ?? widget.model!.owner,
            code: request.code ?? widget.model!.code,
            expiresAt: request.expiresAt ?? widget.model!.expiresAt,
            amount: request.amount ?? widget.model!.amount,
            currency: request.currency ?? widget.model!.currency,
            metadata: request.metadata ?? widget.model!.metadata,
            transaction: request.transaction ?? widget.model!.transaction,
            freezed: request.freezed ?? widget.model!.freezed,
          ));
        } else if (widget.ref.nullIfEmpty != null) {
          var item = GiftCardModel.fromJson(data);
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
                label: const Text('Submit'),
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
                      AppTextFormField(
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
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: request.createdAt?.toIso8601String(),
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
                        initialValue: request.updatedAt?.toIso8601String(),
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {
                          // request.date = DateTime.tryParse(v);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('Last Update date'),
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
                      AppTextFormField(
                        enabled: false,
                        mode: AppTextFormFieldMode.dateTime,
                        initialValue: (request.transaction != null ? request.transaction!.createdAt : null)?.toIso8601String() ?? "(Not used)",
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        onChanged: (v) async {},
                        decoration: InputDecoration(
                          prefixIcon: const Icon(FluentIcons.calendar_32_regular),
                          label: const Text('USED AT'),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        ),
                      ),
                      // used by
                      if (request.transaction != null)
                        ListTile(
                          leading: const Icon(FluentIcons.people_team_24_regular),
                          contentPadding: const EdgeInsets.only(left: 12),
                          visualDensity: const VisualDensity(vertical: -3),
                          title: Text(request.transaction!.uid),
                          subtitle: Text("Used by"),
                          trailing: const Icon(FluentIcons.chevron_right_24_regular),
                          onTap: () async {
                            var model = await getModelDocument(path: "profiles/${request.transaction!.uid}", fromJson: ProfileModel.fromJson);
                            if (model != null) await showExtendedStudentModelDailog(context, model);
                          },
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
