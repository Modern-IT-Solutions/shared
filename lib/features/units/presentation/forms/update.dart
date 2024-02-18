import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:recase/recase.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/models/unit_statistics_model.dart';
import 'package:shared/models/unit_subject_model.dart';
import 'package:shared/shared.dart';

import '../../data/models/units_settings_model.dart';
import '../../domain/request/requests.dart';

/// [UpdateUnitForm] is a form to update a new user
class UpdateUnitForm extends StatefulWidget {
  final String ref;
  final UnitModel? model;
  final VoidCallback? onCancel;
  final Null Function(UnitModel station)? onUpdated;
  final Null Function(UnitModel station)? onCreated;
  const UpdateUnitForm({Key? key, this.onUpdated, this.onCreated, this.onCancel, required this.model, required this.ref}) : super(key: key);

  @override
  State<UpdateUnitForm> createState() => _UpdateUnitFormState();
}

class _UpdateUnitFormState extends State<UpdateUnitForm> {
  final _formKey = GlobalKey<FormState>();

  late var request = UnitUpdateRequest(
    ref: widget.model?.ref ?? ModelRef(widget.ref),
    name: widget.model?.name ?? "",
    title: widget.model?.title ?? "",
    description: widget.model?.description,
    createdAt: widget.model?.createdAt ?? DateTime.now(),
    deletedAt: widget.model?.deletedAt,
    updatedAt: widget.model?.updatedAt ?? DateTime.now(),
    visibility: widget.model?.visibility ?? ModelVisibility.visible,
    order: 1000,
    color: widget.model?.color,
    discount: widget.model?.discount ?? 0,
    price: widget.model?.price,
    duration: widget.model?.duration,
    fields: widget.model?.fields,
    statistics: widget.model?.statistics ?? UnitStatisticsModel(),
    subject: widget.model?.subject,
    teacher: widget.model?.teacher ?? getCurrentProfile(),
  );

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
        "statistics": request.statistics?.toJson() ?? {},
      };

      try {
        if (widget.model != null) {
          await updateDocument(path: request.ref.path, data: data);
          widget.onUpdated?.call(widget.model!.copyWith(
            title: request.title ?? widget.model!.title,
            description: request.description ?? widget.model!.description,
            createdAt: request.createdAt ?? widget.model!.createdAt,
            deletedAt: request.deletedAt ?? widget.model!.deletedAt,
            updatedAt: request.updatedAt ?? widget.model!.updatedAt,
            visibility: request.visibility ?? widget.model!.visibility,
          ));
        } else if (widget.ref.nullIfEmpty != null) {
          var item = UnitModel.fromJson(data);
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
            title: const Text('Submit Units'),
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
                        title: Text("Unit Information"),
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
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.card_ui_24_regular)),
                          label: const Text('name'),
                          alignLabelWithHint: true,
                          helperText: 'required *',
                        ),
                      ),
                      const SizedBox(height: 10),
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
                      Divider(),
                      const ListTile(
                        leading: Icon(FluentIcons.paint_brush_32_regular),
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text("Decoration"),
                        enabled: false,
                      ),
                      AppTextFormField(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.duration?.inMinutes.toString(),
                        onChanged: (v) {
                          request.duration = Duration(minutes: int.tryParse(v ?? "0") ?? 0);
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        decoration: InputDecoration(
                            errorText: _errors['duration'],
                            prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                            label: const Text('duration'),
                            alignLabelWithHint: true,
                            suffixIcon: SizedBox(
                              width: 70,
                              child: Center(
                                child: const Text("minutes"),
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        key: Key(request.color.toString()),
                        onTap: (v) async {
                          request.color = await showColorPickerDialog(context, request.color ?? Theme.of(context).colorScheme.primary);
                          setState(() {});
                        },
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.color?.value.toRadixString(16),
                        onChanged: (v) {
                          // if (v.length != 8) return;
                          // setState(() {
                          //   request.color = Color(int.tryParse(v) ?? 0);
                          // });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          (v) {
                            if (v?.length != 8) return "invalid color";
                            return null;
                          }
                        ]),
                        decoration: InputDecoration(
                          errorText: _errors['color'],
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                          label: const Text('color'),
                          alignLabelWithHint: true,
                          // .. circle colored
                          suffixIcon: request.color != null
                              ? Builder(builder: (context) {
                                  try {
                                    return SizedBox(
                                      width: 24,
                                      child: Center(
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            color: request.color,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    );
                                  } catch (e) {
                                    return SizedBox(
                                      width: 70,
                                      child: Center(
                                        child: Container(
                                          width: 70,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Text("ERROR", style: TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                    );
                                  }
                                })
                              : null,
                        ),
                      ),
                      const SizedBox(height: 10),

                      FutureBuilder(
                          future: getUnitsSettings(),
                          builder: (context, snapshot) {
                            List<String> fields = snapshot.data?.fields ??
                                [
                                  "رياضيات",
                                  "علوم تجريبية",
                                  "تقني رياضي",
                                  "آداب و فلسفة",
                                ];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: SizedBox(
                                height: 60,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    const SizedBox(width: 24),
                                    // selectable chips for roles
                                    for (String field in fields) ...[
                                      InputChip(
                                        onSelected: (selected) {
                                          setState(() {
                                            if (selected) {
                                              request.fields = [
                                                ...request.fields ?? [],
                                                field,
                                              ];
                                            } else {
                                              // request.fields!.remove(field);
                                              request.fields = request.fields?.where((element) => element != field).toList() ?? [];
                                            }
                                          });
                                        },
                                        selected: request.fields?.contains(field) ?? false,
                                        label: Text(field.titleCase),
                                      ),
                                      const SizedBox(width: 10)
                                    ],

                                    const SizedBox(width: 24),
                                  ],
                                ),
                              ),
                            );
                          }),
                      // AppTextFormField(
                      //   margin: const EdgeInsets.symmetric(horizontal: 24),
                      //   initialValue: request.fields?.join(","),
                      //   onChanged: (v) {
                      //     if (v.isEmpty) {
                      //       request.fields = null;
                      //     } else {
                      //       request.fields = v.split(",");
                      //     }
                      //   },
                      //   validator: FormBuilderValidators.compose([]),
                      //   decoration: InputDecoration(
                      //     errorText: _errors['fields'],
                      //     prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                      //     label: const Text('fields'),
                      //     alignLabelWithHint: true,
                      //     helperText: 'The fields of the item, required *',
                      //   ),
                      // ),
                      Divider(),
                      const ListTile(
                        leading: Icon(FluentIcons.money_24_regular),
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text("Banking"),
                        enabled: false,
                      ),
                      AppTextFormField(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.discount?.toString(),
                        onChanged: (v) {
                          request.discount = double.tryParse(v);
                        },
                        validator: FormBuilderValidators.compose([
                          // must be positive and <= price
                          (n) {
                            var v = double.tryParse(n.toString());
                            if (v == null) return "required";
                            if (v! < 0) return "must be positive";
                            if (request.price != null && v! > request.price!) return "must be <= price";
                            return null;
                          }
                        ]),
                        decoration: InputDecoration(
                          errorText: _errors['discount'],
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                          label: const Text('discount'),
                          alignLabelWithHint: true,
                          helperText: 'The discount of the item, required *',
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppTextFormField(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        initialValue: request.price?.toString(),
                        onChanged: (v) {
                          request.price = double.tryParse(v);
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          // must be positive and >= discount
                          (v) {
                            var n = double.tryParse(v.toString());
                            if (n == null) return "required";
                            if (n < 0) return "must be positive";
                            if (request.discount != null && n < request.discount!) return "must be >= discount";
                            return null;
                          }
                        ]),
                        decoration: InputDecoration(
                          errorText: _errors['price'],
                          prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                          label: const Text('price'),
                          alignLabelWithHint: true,
                          helperText: 'The price of the item, required *',
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
                      // const SizedBox(height: 10),
                      // AppTextFormField(
                      //   margin: const EdgeInsets.symmetric(horizontal: 24),
                      //   initialValue: request.statistics?.toJson().toString(),
                      //   onChanged: (v) {
                      //     // request.statistics = UnitStatisticsModel.fromJson(v);
                      //   },
                      //   validator: FormBuilderValidators.compose([]),
                      //   decoration: InputDecoration(
                      //     errorText: _errors['statistics'],
                      //     prefixIcon: const SizedBox(child: Icon(FluentIcons.app_title_24_regular)),
                      //     label: const Text('statistics'),
                      //     alignLabelWithHint: true,
                      //     helperText: 'The statistics of the item, required *',
                      //   ),
                      // ),
                      // const SizedBox(height: 10),

                      FutureBuilder(
                          future: getUnitsSettings(),
                          builder: (context, snapshot) {
                            List<String> subjects = snapshot.data?.subjects ??
                                [
                                  "الرياضيات",
                                  "اللغة العربية",
                                  "اللغة الفرنسية",
                                  "اللغة الانجليزية",
                                  "اللغة الاسبانية",
                                  "الفلسفة",
                                  "التاريخ والجغرافيا",
                                  "التربية الاسلامية",
                                  "الفيزياء",
                                ];
                            print(subjects);
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: MenuAnchor(
                                menuChildren: <Widget>[
                                  for (String item in subjects)
                                    MenuItemButton(
                                      child: Text(item),
                                      onPressed: request.subject?.name == item
                                          ? null
                                          : () => setState(
                                                () {
                                                  request.subject = UnitSubjectModel(
                                                    // ref: ref, name: name, createdAt: createdAt, updatedAt: updatedAt
                                                    ref: ModelRef("subjects/$item"),
                                                    name: item,
                                                    createdAt: DateTime.now(),
                                                    updatedAt: DateTime.now(),
                                                  );
                                                },
                                              ),
                                    ),
                                ],
                                builder: (BuildContext context, MenuController controller, Widget? child) {
                                  return ListTile(
                                    leading: const Icon(FluentIcons.class_24_regular),
                                    contentPadding: EdgeInsets.only(left: 12),
                                    visualDensity: VisualDensity(vertical: -3),
                                    title: Text(request.subject?.name ?? "Select subject"),
                                    subtitle: Text("Select subject"),
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
                            );
                          }),
                      const SizedBox(height: 10),

                      // select teacher
                      ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ListTile(
                            leading: request.teacher?.photoUrl.nullIfEmpty != null
                                ? ProfileAvatar(
                                    profile: request.teacher!,
                                  )
                                : const Icon(FluentIcons.people_team_24_regular),
                            contentPadding: EdgeInsets.only(left: 12),
                            visualDensity: VisualDensity(vertical: -3),
                            title: Text(request.teacher?.displayName ?? "Select teacher"),
                            subtitle: Text("Select teacher"),
                            trailing: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: const Icon(FluentIcons.chevron_down_24_regular),
                            ),
                            onTap: () async {
                              if ((can("units.update.any") && widget.model != null) || (can("units.create.any") && widget.model == null)) {
                                setState(() {
                                  request.teacher = getCurrentProfile();
                                });
                                return;
                              }
                              var profiles = await showProfilesPickerDialog(context,
                                  filters: [
                                    IndexViewFilter(
                                      name: "Teachers",
                                      active: true,
                                      local: (model) => model.roles.map((e) => e.name).contains("teacher"),
                                      remote: (query) => query.where("roles", arrayContains: "teacher"),
                                      strict: false,
                                      fixed: true,
                                    )
                                  ],
                                  length: 1);
                              if (profiles != null && profiles.isNotEmpty) {
                                request.teacher = profiles.first;
                                setState(() {});
                              }
                            },
                          ),
                        ),
                        Divider(),
                      ],
                      const ListTile(
                        leading: Icon(FluentIcons.table_move_right_28_regular),
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                        visualDensity: VisualDensity(vertical: -3),
                        title: Text("Model"),
                        enabled: false,
                      ),
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
                      const SizedBox(height: 10),

                      // visibility

                      Padding(
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
                              title: Badge(label: Text("NEW"), child: Text(request.visibility!.name)),
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
                      const SizedBox(height: 20),
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
    );
  }
}
