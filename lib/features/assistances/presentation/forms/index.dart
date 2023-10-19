import 'package:feather_icons/feather_icons.dart';
import 'package:shared/features/assistances/presentation/forms/find.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:shared/features/assistances/data/models/assistance_model.dart';
import 'package:shared/shared.dart';

import '../../data/repositories/repository.dart';
import '../../domain/repositories/station_repository_interface.dart';
import 'create.dart';
import 'update.dart';

/// [AssistancesSearchType] is a class to build a query to search
enum AssistancesSearchType implements SearchType {
  stationName,
  note;

  IconData get icon {
    switch (this) {
      case AssistancesSearchType.stationName:
        return FluentIcons.gas_pump_24_regular;
      case AssistancesSearchType.note:
        return FluentIcons.note_28_regular;
      default:
        return FeatherIcons.box;
    }
  }

  String get field {
    switch (this) {
      case AssistancesSearchType.stationName:
        return 'station.name';
      case AssistancesSearchType.note:
        return 'note';
    }
  }
}

/// [ManageAssistancesView] is a tab for assistances
class ManageAssistancesView<M extends AssistanceModel>
    extends ModelMnanagerView<M> {
  final AssistanceRepositoryInterface<M> repository;

  ManageAssistancesView({
    super.key,
  }) : repository =
            AssistanceRepository.instance as AssistanceRepositoryInterface<M>;

  @override
  State<ManageAssistancesView> createState() => ManageAssistancesViewState<M>();
}

class ManageAssistancesViewState<M extends AssistanceModel>
    extends State<ManageAssistancesView> with ModelMnanagerViewMixin<M> {
  var searchType = ValueNotifier(AssistancesSearchType.stationName);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      load();
    });
  }

  Future<void> load() async {
    loading.value = true;
    try {
      models.value =
          await widget.repository.list(ListRequest()) as ListResult<M>;
    } catch (e) {
      print(e);
    }
    // await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
  }

  /// [search] is a function to search for profiles
  /// it takes a [query] and a [type] to search by
  Future<void> search(String query, SearchType type) async {
    loading.value = true;
    try {
      models.value = await widget.repository.list(
        ListRequest(searchQuery: SearchQuery(field: type.field, value: query)),
      ) as ListResult<M>;
      print(models.value);
    } catch (e) {
      print(e);
    }

    loading.value = false;
  }

  List<AssistanceModel> get filteredAssistances {
    var query = searchController.text.trim();
    if (true || query.isEmpty) {
      return models.value!.items;
    }
    // search in display name and email and phone number and uid
    // return models.value!.items.where((assistance) {
    //   return assistance..contains(query) == true ||
    //       assistance.address.contains(query) == true ||
    //       // assistance.?.contains(query) == true ||
    //       assistance.ref.contains(query);
    // }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([
        loading,
      ]),
      builder: (context, _) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SizedBox(
                    child: FilledButton.icon(
                      onPressed: () => showCreateModelDailog(context),
                      label: const Text('Add'),
                      icon: const Icon(FeatherIcons.plus),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: AppTextFormField.min(
                      enabled: !loading.value,
                      onSubmitted: (String value) =>
                          search(value, searchType.value),
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(FluentIcons.search_24_regular),
                        label: Text('Search'),
                        alignLabelWithHint: true,
                        suffixIcon: ListenableBuilder(
                            listenable: searchType,
                            builder: (context, _) {
                              return MenuAnchor(
                                builder: (context, controller, __) {
                                  return TextButton.icon(
                                    icon: const Icon(
                                      FluentIcons.filter_24_regular,
                                    ),
                                    onPressed: () => controller.open(),
                                    label:
                                        Text(searchType.value.name.titleCase),
                                  );
                                },
                                menuChildren: [
                                  for (var type in AssistancesSearchType.values)
                                    MenuItemButton(
                                      leadingIcon: Icon(type.icon),
                                      trailingIcon: searchType.value == type
                                          ? const Icon(
                                              FluentIcons.checkmark_24_regular)
                                          : null,
                                      onPressed: searchType.value == type
                                          ? null
                                          : () {
                                              searchType.value = type;
                                            },
                                      child: Text(type.name.titleCase),
                                    ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              // table of assistances, assistance is the same as firebase
              // use ListTile for each assistance
              FlexTable(
                selectable: false,
                scrollable: true,
                // the space bitween each item called gap
                configs: const [
                  FlexTableItemConfig.square(30),
                  FlexTableItemConfig.flex(2),
                  FlexTableItemConfig.flex(3),
                  FlexTableItemConfig.flex(2),
                  FlexTableItemConfig.square(40),
                ],
                child: ListenableBuilder(
                  listenable: searchController,
                  builder: (context, child) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: const FlexTableItem(children: [
                            SizedBox(),
                            Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Address',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Techs',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(),
                          ]),
                        ),
                        loading.value
                            ? LinearProgressIndicator(minHeight: 2)
                            : const Divider(height: 2),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (models.value != null)
                              for (AssistanceModel assistanceRecord
                                  in filteredAssistances)
                                InkWell(
                                  highlightColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  focusColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  hoverColor: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    showDetailsModelDailog(
                                        context, assistanceRecord);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 8),
                                    child: FlexTableItem(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: assistanceRecord
                                                      .station.photoUrl ==
                                                  null
                                              ? Text(
                                                  assistanceRecord.station.name
                                                              ?.isNotEmpty ==
                                                          true
                                                      ? assistanceRecord
                                                          .station.name![0]
                                                          .toUpperCase()
                                                      : "?",
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                )
                                              : null,
                                          backgroundImage: assistanceRecord
                                                      .station.photoUrl ==
                                                  null
                                              ? null
                                              : NetworkImage(assistanceRecord
                                                  .station.photoUrl!),
                                        ),
                                        Text(
                                          assistanceRecord.station.name ??
                                              "No name",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          assistanceRecord.station.address
                                                  .toString() ??
                                              "No phone",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),

                                        SizedBox(
                                          width: 70,
                                          child: Wrap(
                                            spacing: 5,
                                            children: [
                                              for (var technician
                                                  in assistanceRecord
                                                      .technicians.values)
                                                SizedBox(
                                                  width: 25,
                                                  height: 40,
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        child: Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .background,
                                                              width: 2,
                                                            ),
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .primaryContainer,

                                                            /// if technician.photoUrl is not null and not empty show the image
                                                            image: technician
                                                                            .photoUrl !=
                                                                        null &&
                                                                    technician
                                                                        .photoUrl!
                                                                        .isNotEmpty
                                                                ? DecorationImage(
                                                                    image: NetworkImage(
                                                                        technician
                                                                            .photoUrl!),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )
                                                                : null,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              technician
                                                                  .displayName![
                                                                      0]
                                                                  .toUpperCase(),
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),

                                        // IconButton(
                                        //   icon: const Icon(FeatherIcons.moreVertical),
                                        //   onPressed: () {},
                                        // ),
                                        MenuAnchor(
                                          builder:
                                              (context, controller, child) {
                                            return IconButton(
                                              onPressed: () {
                                                if (controller.isOpen) {
                                                  controller.close();
                                                } else {
                                                  controller.open();
                                                }
                                              },
                                              icon: const Icon(Icons.more_vert),
                                            );
                                          },
                                          menuChildren: [
                                            SizedBox(
                                              height: 8,
                                            ),
                                            MenuItemButton(
                                              onPressed: () {},
                                              leadingIcon: const Icon(
                                                  FluentIcons
                                                      .person_tag_28_regular),
                                              child: Text('change roles'),
                                            ),
                                            Divider(),
                                            MenuItemButton(
                                              onPressed: () {
                                                showUpdateModelDailog(
                                                    context, assistanceRecord);
                                              },
                                              leadingIcon: const Icon(
                                                  FluentIcons.edit_28_regular),
                                              child: Text('Edit'),
                                            ),
                                            MenuItemButton(
                                              onPressed: () {
                                                showDeleteModelDailog(
                                                    context, assistanceRecord);
                                              },
                                              leadingIcon: Icon(
                                                FluentIcons.delete_28_regular,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                              ),
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            if (loading.value)
                              Center(
                                child: Container(
                                  margin: EdgeInsets.all(24.0),
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator.adaptive(
                                      strokeWidth: 2),
                                ),
                              ),
                            if (models.value != null &&
                                models.value!.items.isEmpty &&
                                !loading.value)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.0,
                                      horizontal: 12,
                                    ),
                                    child: Text('No assistances found'),
                                  ),
                                  // refresh
                                  OutlinedButton(
                                    onPressed: load,
                                    child: Text("Refresh"),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // update assistance
  Future<void> showCreateModelDailog(BuildContext context) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: CreateAssistanceForm(
        onCreated: (assistance) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                width: 400.0,
                content: Text('Assistance ${assistance.station.name} updated'),
                action: SnackBarAction(
                  label: 'Show',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    showUpdateModelDailog(context, assistance);
                  },
                )),
          );
          Navigator.of(context).pop();
          load();
        },
      ),
    );
    await showDialog(
      context: context,
      builder: (context) {
        if (MediaQuery.of(context).size.width > 600)
          return Dialog(
            clipBehavior: Clip.antiAlias,
            child: child,
          );
        else
          return Dialog.fullscreen(
            child: child,
          );
      },
    );
  }

  // update assistance
  Future<void> showUpdateModelDailog(
      BuildContext context, AssistanceModel assistance) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: UpdateAssistanceForm(
        ref: assistance.ref.toString(),
        model: assistance,
        onUpdated: (assistance) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              width: 400.0,
              content: Text('Assistance ${assistance.station.name} updated'),
              action: SnackBarAction(
                label: 'Show',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  showUpdateModelDailog(context, assistance as M);
                },
              ),
            ),
          );
          Navigator.of(context).pop();
          load();
        },
      ),
    );
    await showDialog(
      context: context,
      builder: (context) {
        if (MediaQuery.of(context).size.width > 600)
          return Dialog(
            clipBehavior: Clip.antiAlias,
            child: child,
          );
        else
          return Dialog.fullscreen(
            child: child,
          );
      },
    );
  }

  // delete assistance, a simple dialog with a text and two buttons
  Future<void> showDeleteModelDailog(
      BuildContext context, AssistanceModel model) async {
    bool _loading = false;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm delete'),
        content: Text(
            'this action cannot be undone, are you sure you want to continue?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          StatefulBuilder(builder: (context, setState) {
            return TextButton(
              onPressed: _loading
                  ? null
                  : () async {
                      setState(() {
                        _loading = true;
                      });
                      try {
                        await widget.repository.delete(DeleteRequest(model.ref.id));
                        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                          SnackBar(
                              behavior: SnackBarBehavior.floating,
                              width: 400.0,
                              content: Text('${model.ref.id} deleted'),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              )),
                        );
                        Navigator.of(context).pop();
                        load();
                      } catch (e) {}
                      setState(() {
                        _loading = false;
                      });
                    },
              child: _loading
                  ? CircularProgressIndicator.adaptive()
                  : const Text('Delete'),
            );
          }),
        ],
      ),
    );
  }

  @override
  Future<void> showDetailsModelDailog(
      BuildContext context, AssistanceModel model) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: FindAssistanceForm(
        id: model.ref.id,
        assistance: model,
        actions: [
          // edit
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              showUpdateModelDailog(context, model);
            },
            icon: const Icon(FluentIcons.edit_16_regular),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
    await showDialog(
      context: context,
      builder: (context) {
        if (MediaQuery.of(context).size.width > 600)
          return Dialog(
            clipBehavior: Clip.antiAlias,
            child: child,
          );
        else
          return Dialog.fullscreen(
            child: child,
          );
      },
    );
  }
}
