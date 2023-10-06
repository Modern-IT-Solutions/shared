import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import '../../../models/deposit_request_model.dart';
import 'forms/find.dart';
import 'package:timeago/timeago.dart' as timeago;

@override
Future<DepositRequestModel?> showDetailsDepositRequestModellDailog(BuildContext context, DepositRequestModel model) async {
  child(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: FindDepositRequestForm(
        id: model.ref.id,
        depositRequest: model,
        onAccepted: (depositRequest) {
          Navigator.of(context).pop(depositRequest);
        },
        onRejected: (depositRequest) {
          Navigator.of(context).pop(depositRequest);
        },
        actions: [
          // edit

          IconButton(
            onPressed: () {
              showDepositRequestModelHistoryDailog(context, model);
            },
            icon: const Icon(FluentIcons.search_20_regular),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              // showUpdateModelDailog(context, model);
            },
            icon: const Icon(FluentIcons.edit_16_regular),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }

  return await showDialog<DepositRequestModel?>(
    context: context,
    builder: (context) {
      if (MediaQuery.of(context).size.width > 600) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: child(context),
        );
      } else {
        return Dialog.fullscreen(
          child: child(context),
        );
      }
    },
  );
}

Future<void> showDepositRequestModelHistoryDailog(BuildContext context, DepositRequestModel model) async {
  var controller = ModelListViewController<DepositRequestModel>(
    value: ModelListViewValue(
      forceFilter: true,
      filters: [
        IndexViewFilter(
          name: "all",
          active: true,
          local: (_model) {
            var r = _model.ref != model.ref && _model.uid == model.uid;
            return r;
          },
          remote: (query) => query.where("profile.uid", isEqualTo: model.uid),
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(
          name: "pending",
          active: false,
          local: (_model) => _model.status == DepositRequestStatus.pending && _model.ref != model.ref && _model.uid == model.uid,
          remote: (query) => query.where("profile.uid", isEqualTo: model.uid),
          strict: false,
          fixed: true,
        ),
        // accepted
        IndexViewFilter(
          name: "accepted",
          local: (_model) => _model.status == DepositRequestStatus.accepted && _model.ref != model.ref && _model.uid == model.uid,
          remote: (query) => query.where("profile.uid", isEqualTo: model.uid),
          strict: false,
          fixed: true,
        ),
        // rejected
        IndexViewFilter(
          name: "rejected",
          local: (_model) => _model.status == DepositRequestStatus.pending && _model.ref != model.ref && _model.uid == model.uid,
          remote: (query) => query.where("profile.uid", isEqualTo: model.uid),
          strict: false,
          fixed: true,
        ),
      ],
    ),
    description: DepositRequestModel.description.copyWith(
      actions: [
        ModelAction(
          label: "Show details",
          group: "CRUD",
          icon: Icon(FluentIcons.search_20_regular),
          single: (context, model) async {
            return await showDetailsDepositRequestModellDailog(context, model!);
          },
        ),
        // show history
        // ModelAction(
        //   label: "Show history",
        //   group: "related",
        //   icon: Icon(FluentIcons.history_20_regular),
        //   single: (context, model) async {
        //     await showDepositRequestModelHistoryDailog(context, model!);
        //   },
        // ),
      ],
    ),
  );
  child(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 801, maxHeight: MediaQuery.of(context).size.height * .8),
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: ModelListView<DepositRequestModel>(
            onModelTap: (model) async {
              await showDetailsDepositRequestModellDailog(context, model);
            },
            flexTableItemBuilders: [
              (
                header: const SizedBox(),
                config: const FlexTableItemConfig.square(40),
                builder: (model) {
                  var firstLetters = (model.profile.displayName.nullIfEmpty ?? "?")[0].toUpperCase();
                  return CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    backgroundImage: model.profile.photoUrl.nullIfEmpty == null ? null : NetworkImage(model.profile.photoUrl),
                    child: model.profile.photoUrl.nullIfEmpty != null ? null : Text(firstLetters),
                  );
                }
              ),
              (
                header: const Text("Name/Sender"),
                config: const FlexTableItemConfig.flex(2),
                builder: (model) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.fullName ?? "(No name)",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (model.profile.displayName.isNotEmpty)
                        Text(
                          model.profile.displayName,
                          // depositRequestRecord.ref.id,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  );
                }
              ),
              (
                header: const Text("Status"),
                config: const FlexTableItemConfig.flex(1),
                builder: (model) {
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: model.status.color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Flexible(
                        child: Text(
                          model.status.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                }
              ),
              (
                header: const Text("Amount"),
                config: const FlexTableItemConfig.flex(1),
                builder: (model) {
                  return Text("${model.amount} DZD");
                }
              ),
              if (constraints.maxWidth > 800) ...[
                (
                  header: const Text("Note"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      model.note ?? "(No note)",
                      style: Theme.of(context).textTheme.caption,
                    );
                  }
                ),
                (
                  header: const Text("UpdatedAt"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      timeago.format(model.updatedAt),
                      style: Theme.of(context).textTheme.caption,
                    );
                  }
                ),
              ],
              if (constraints.maxWidth > 1200) ...[
                (
                  header: const Text("Address"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(model.address ?? "(No address)");
                  }
                ),
                (
                  header: const Text("attachment"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    String? attachment = model.attachments?.firstOrNull?.src;
                    // action chip to open the attachment
                    return ActionChip(
                      avatar: const Icon(FluentIcons.attach_12_regular),
                      label: const Text("Open"),
                      onPressed: attachment == null
                          ? null
                          : () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) {
                                    return AttatchmentViewer(firstImageUrl: attachment);
                                  },
                                ),
                              );
                            },
                    );
                  }
                ),
              ]
            ],
            controller: controller,
          ),
        );
      }),
    );
  }

  await showDialog(
    context: context,
    builder: (context) {
      // if (MediaQuery.of(context).size.width > 600) {
      return Dialog(
        insetPadding: EdgeInsets.all(15),
        clipBehavior: Clip.antiAlias,
        child: child(context),
      );
      // } else {
      //   return Dialog.fullscreen(
      //     child: child(context),
      //   );
      // }
    },
  );
}
