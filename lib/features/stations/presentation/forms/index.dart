import 'package:feather_icons/feather_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import 'package:shared/features/stations/domain/repositories/station_repository_interface.dart';
import 'package:shared/features/stations/presentation/forms/find.dart';
import 'package:shared/shared.dart';

import '../../data/models/station_model.dart';
import '../../data/repositories/repository.dart';
import 'create.dart';
import 'update.dart';

/// [StationsSearchType] is a class to build a query to search
enum StationsSearchType implements SearchType {
  name,
  email;

  IconData get icon {
    switch (this) {
      case StationsSearchType.name:
        return FeatherIcons.user;
      case StationsSearchType.email:
        return FeatherIcons.mail;
    }
  }

  String get field => this.name;
}

/// [ManageStationsView] is a tab for stations
class ManageStationsView<M extends StationModel> extends ModelMnanagerView<M> {
  final StationRepositoryInterface<M> repository;

  ManageStationsView({
    super.key,
  }) : repository = StationRepository.instance as StationRepositoryInterface<M>;

  @override
  State<ManageStationsView> createState() => ManageStationsViewState<M>();
}

class ManageStationsViewState<M extends StationModel> extends State<ManageStationsView> with ModelMnanagerViewMixin<M> {
  var searchType = ValueNotifier(StationsSearchType.name);

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
      models.value = await widget.repository.list(ListRequest()) as ListResult<M>;
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
        ListRequest(searchQuery: SearchQuery(field: type.name, value: query)),
      ) as ListResult<M>;
    } catch (e) {
      print(e);
    }

    loading.value = false;
  }

  List<StationModel> get filteredStations {
    var query = searchController.text.trim();
    if (query.isEmpty) {
      return models.value!.items;
    }
    // search in display name and email and phone number and uid
    return models.value!.items.where((station) {
      return station.toString().contains(query);
    }).toList();
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
                      onSubmitted: (String value) => search(value, searchType.value),
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
                                    label: Text(searchType.value.name.titleCase),
                                  );
                                },
                                menuChildren: [
                                  for (var type in StationsSearchType.values)
                                    MenuItemButton(
                                      leadingIcon: Icon(type.icon),
                                      trailingIcon: searchType.value == type ? const Icon(FluentIcons.checkmark_24_regular) : null,
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
              // table of stations, station is the same as firebase
              // use ListTile for each station
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
                        loading.value ? LinearProgressIndicator(minHeight: 2) : const Divider(height: 2),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (models.value != null)
                              for (StationModel stationRecord in filteredStations)
                                InkWell(
                                  highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  focusColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  hoverColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    showDetailsModelDailog(context, stationRecord);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                                    child: FlexTableItem(
                                      children: [
                                        CircleAvatar(
                                          radius: 15,
                                          child: stationRecord.photoUrl == null
                                              ? Text(
                                                  stationRecord.name?.isNotEmpty == true ? stationRecord.name![0].toUpperCase() : "?",
                                                  style: const TextStyle(fontSize: 18),
                                                )
                                              : null,
                                          backgroundImage: stationRecord.photoUrl == null ? null : NetworkImage(stationRecord.photoUrl!),
                                        ),
                                        Text(
                                          stationRecord.name ?? "No name",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          stationRecord.address.toString() ?? "No phone",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),

                                        SizedBox(
                                          width: 70,
                                          child: Wrap(
                                            spacing: 5,
                                            children: [
                                              for (var technician in stationRecord.technicians)
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
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            border: Border.all(
                                                              color: Theme.of(context).colorScheme.background,
                                                              width: 2,
                                                            ),
                                                            color: Theme.of(context).colorScheme.primaryContainer,

                                                            /// if technician.photoUrl is not null and not empty show the image
                                                            image: technician.photoUrl != null && technician.photoUrl!.isNotEmpty
                                                                ? DecorationImage(
                                                                    image: NetworkImage(technician.photoUrl!),
                                                                    fit: BoxFit.cover,
                                                                  )
                                                                : null,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              technician.displayName![0].toUpperCase(),
                                                              style: const TextStyle(fontSize: 18),
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
                                          builder: (context, controller, child) {
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
                                              leadingIcon: const Icon(FluentIcons.person_tag_28_regular),
                                              child: Text('change roles'),
                                            ),
                                            Divider(),
                                            MenuItemButton(
                                              onPressed: () {
                                                showUpdateModelDailog(context, stationRecord);
                                              },
                                              leadingIcon: const Icon(FluentIcons.edit_28_regular),
                                              child: Text('Edit'),
                                            ),
                                            MenuItemButton(
                                              onPressed: () {
                                                showDeleteModelDailog(context, stationRecord);
                                              },
                                              leadingIcon: Icon(
                                                FluentIcons.delete_28_regular,
                                                color: Theme.of(context).colorScheme.error,
                                              ),
                                              child: Text(
                                                'Remove',
                                                style: TextStyle(color: Theme.of(context).colorScheme.error),
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
                                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                                ),
                              ),
                            if (models.value != null && models.value!.items.isEmpty && !loading.value)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 24.0,
                                      horizontal: 12,
                                    ),
                                    child: Text('No stations found'),
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

  // update station
  Future<void> showCreateModelDailog(BuildContext context) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: CreateStationForm(
        onCreated: (station) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              width: 400.0,
              content: Text('Station ${station.name} updated'),
              action: SnackBarAction(
                label: 'Show',
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  showUpdateModelDailog(context, station);
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

  // update station
  Future<void> showUpdateModelDailog(BuildContext context, StationModel station) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: UpdateStationForm(
        ref: station.ref.toString(),
        model: station,
        onUpdated: (station) {
          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                width: 400.0,
                content: Text('Station ${station.name} updated'),
                action: SnackBarAction(
                  label: 'Show',
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    showUpdateModelDailog(context, station as M);
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

  // delete station, a simple dialog with a text and two buttons
  Future<void> showDeleteModelDailog(BuildContext context, StationModel model) async {
    bool _loading = false;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm delete'),
        content: Text('this action cannot be undone, are you sure you want to continue?'),
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
                                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
              child: _loading ? CircularProgressIndicator.adaptive() : const Text('Delete'),
            );
          }),
        ],
      ),
    );
  }

  @override
  Future<void> showDetailsModelDailog(BuildContext context, StationModel model) async {
    var child = Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: FindStationForm(
        ref: model.ref.id,
        model: model,
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
