// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:core/core.dart';

import '../../data/models/station_model.dart';
import '../../stations.dart';
import 'create.dart';
import 'find.dart';
import 'update.dart';

// update station
Future<StationModel?> showCreateStationModelDailog(BuildContext context) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: CreateStationForm(
      ref: "",
      onCreated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Station ${model.name} updated'),
            action: SnackBarAction(
              label: 'Show',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showUpdateStationModelDailog(context, model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
    ),
  );
  return await showDialog<StationModel?>(
    context: context,
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

// update station
Future<StationModel?> showUpdateStationModelDailog(BuildContext context, StationModel model) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: UpdateStationForm(
      model: model,
      onUpdated: (model) {
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 400.0,
            content: Text('Station ${model.name} updated'),
            action: SnackBarAction(
              label: 'Show',
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                showUpdateStationModelDailog(context, model);
              },
            ),
          ),
        );
        Navigator.of(context).pop(model);
        // load();
      },
      ref: '',
    ),
  );
  return await showDialog<StationModel?>(
    context: context,
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

// delete station, a simple dialog with a text and two buttons
Future<bool?> showDeleteStationModelDailog(BuildContext context, StationModel model) async {
  bool _loading = false;
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirm delete'),
      content: const Text('this action cannot be undone, are you sure you want to continue?'),
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
                      await StationRepository.instance.delete(DeleteRequest(model.ref.id));
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
                      Navigator.of(context).pop(true);
                      // load();
                    } catch (e) {}
                    setState(() {
                      _loading = false;
                    });
                  },
            child: _loading ? const CircularProgressIndicator.adaptive() : const Text('Delete'),
          );
        }),
      ],
    ),
  );
}

@override
Future<void> showDetailsStationModelDailog(BuildContext context, StationModel model) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: FindStationForm(
      id: model.ref.id,
      model: model,
      actions: [
        // edit
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            showUpdateStationModelDailog(context, model);
          },
          icon: const Icon(FluentIcons.edit_16_regular),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    ),
  );
  await showDialog(
    context: context,
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

// editO




