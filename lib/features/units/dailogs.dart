
// show profile transactions
import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared/features/units/presentation/forms/update.dart';
import 'package:shared/features/units/sections/items/presentation/forms/update.dart';
import 'package:shared/features/units/sections/presentation/forms/update.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/models/unit_section_item_model.dart';
import 'package:shared/models/unit_section_model.dart';
import 'package:shared/shared.dart';

Future<void> showUnitSectionsDailog(BuildContext context, UnitModel model) async {
  child(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 800),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${model.name} sections"),
        ),
        body: ModelListView<UnitSectionModel>(
          onAddPressed: () async {
            await showUpdateUnitSectionDailog(context, collection: "${model.ref.path}/sections");
          },
          onModelTap: (model) async {
            await showUpdateUnitSectionDailog(context, model: model);
          },
          flexTableItemBuilders: [
            (
              header: const Text("title"),
              config: const FlexTableItemConfig.flex(3),
              builder: (model) {
                return Text(model.title.nullIfEmpty ?? "(No Name)");
              }
            ),
            (
              header: const Text("description"),
              config: const FlexTableItemConfig.flex(1),
              builder: (model) {
                return Text(model.description?.nullIfEmpty ?? "(No description)");
              }
            ),
          ],
          controller: ModelListViewController(
            value: const ModelListViewValue(
              filters: [],
            ),
            description: UnitSectionModel.modelDescription.copyWith(path: "units/${model.ref.id}/sections", actions: [
              ModelAction(
                group: "relations",
                label: "Items",
                icon: const Icon(FluentIcons.list_28_regular),
                single: (context, model) async {
                  if (model != null) {
                    await showUnitSectionItemsDailog(context, model);
                  }
                },
              ),
              ModelAction(
                group: "CRUD",
                label: "edit",
                icon: const Icon(FluentIcons.edit_16_regular),
                single: (context, model) async {
                  if (model != null) {
                    await showUpdateUnitSectionDailog(context, model: model);
                  }
                },
              ),
              ModelAction(
                group: "CRUD",
                label: "delete",
                icon: const Icon(FluentIcons.delete_16_regular),
                single: (context, model) async {
                  if (model != null) {
                    await showDeleteModelDailog(context, model);
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  await showDialog(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      // if (MediaQuery.of(context).size.width > 600) {
      // return child(context);
      // } else {
      return Dialog(
        clipBehavior: Clip.antiAlias,
        child: child(context),
      );
      // }
    },
  );
}

// show profile transactions
Future<void> showUnitSectionItemsDailog(BuildContext context, UnitSectionModel model) async {
  child(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 800),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${model.title} items"),
        ),
        body: ModelListView<UnitSectionItemModel>(
          onAddPressed: () async {
            await showUpdateUnitSectionItemDailog(context, collection: "${model.ref.path}/items");
          },
          onModelTap: (model) async {
            await showUpdateUnitSectionItemDailog(context, model: model);
          },
          flexTableItemBuilders: [
            (
              header: const Text("title"),
              config: const FlexTableItemConfig.flex(3),
              builder: (model) {
                return Text(model.title.nullIfEmpty ?? "(No Name)");
              }
            ),
            (
              header: const Text("description"),
              config: const FlexTableItemConfig.flex(1),
              builder: (model) {
                return Text(model.description?.nullIfEmpty ?? "(No description)");
              }
            ),
          ],
          controller: ModelListViewController(
            value: const ModelListViewValue(
              filters: [],
            ),
            description: UnitSectionItemModel.modelDescription.copyWith(path: "${model.ref.path}/items", actions: [
              ModelAction(
                group: "CRUD",
                label: "edit",
                icon: const Icon(FluentIcons.edit_16_regular),
                single: (context, model) async {
                  if (model != null) {
                    await showUpdateUnitSectionItemDailog(context, model: model);
                  }
                },
              ),
              ModelAction(
                group: "CRUD",
                label: "delete",
                icon: const Icon(FluentIcons.delete_16_regular),
                single: (context, model) async {
                  if (model != null) {
                    await showDeleteModelDailog(context, model);
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  await showDialog(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      // if (MediaQuery.of(context).size.width > 600) {
      // return child(context);
      // } else {
      return Dialog(
        clipBehavior: Clip.antiAlias,
        child: child(context),
      );
      // }
    },
  );
}

// showUpdateUnitSectionItemDailog
Future<UnitSectionItemModel?> showUpdateUnitSectionItemDailog(BuildContext context, {UnitSectionItemModel? model, String? collection}) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: UpdateUnitSectionItemForm(
      model: model,
      onUpdated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Item ${model.title} updated'),
            action: SnackBarAction(
              label: 'Show',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // showUpdateStationModelDailog(context, model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      onCreated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Item ${model.title} created'),
            action: SnackBarAction(
              label: 'Edit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showUpdateUnitSectionItemDailog(context, model: model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      ref: model?.ref.path ?? ("$collection/${Random().nextInt(100000000)}"),
    ),
  );
  return await showDialog<UnitSectionItemModel?>(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      if (MediaQuery.of(context).size.width > 600) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: child,
        );
      } else {
        return Dialog.fullscreen(
          child: child,
        );
      }
    },
  );
}

// showUpdateUnitSectionDailog
Future<UnitSectionModel?> showUpdateUnitSectionDailog(BuildContext context, {UnitSectionModel? model, String? collection}) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: UpdateUnitSectionForm(
      model: model,
      onUpdated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Item ${model.title} updated'),
            action: SnackBarAction(
              label: 'Show',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // showUpdateStationModelDailog(context, model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      onCreated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Item ${model.title} created'),
            action: SnackBarAction(
              label: 'Edit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showUpdateUnitSectionDailog(context, model: model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      ref: model?.ref.path ?? ("$collection/${Random().nextInt(100000000)}"),
    ),
  );
  return await showDialog<UnitSectionModel?>(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      if (MediaQuery.of(context).size.width > 600) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: child,
        );
      } else {
        return Dialog.fullscreen(
          child: child,
        );
      }
    },
  );
}

/// showUpdateUnitDailog
Future<UnitModel?> showUpdateUnitDailog(BuildContext context, {UnitModel? model, String? collection}) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: UpdateUnitForm(
      model: model,
      onUpdated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Unit ${model.name} updated'),
            action: SnackBarAction(
              label: 'Show',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                // showUpdateStationModelDailog(context, model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      onCreated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Unit ${model.name} created'),
            action: SnackBarAction(
              label: 'Edit',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showUpdateUnitDailog(context, model: model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      ref: model?.ref.path ?? ("units/${Random().nextInt(100000000)}"),
    ),
  );
  return await showDialog<UnitModel?>(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      if (MediaQuery.of(context).size.width > 600) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: child,
        );
      } else {
        return Dialog.fullscreen(
          child: child,
        );
      }
    },
  );
}
