import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared/models/transaction_model.dart';
import 'package:shared/models/unit_model.dart';
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

// showExtendedDepositRequestModelDailog
// it show 3 columns 1 same as find dailog and 2 other columns one for history and the other for the details (wallet...)
Future<DepositRequestModel?> showExtendedDepositRequestModelDailog(BuildContext context, DepositRequestModel drmodel) async {
  child(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(maxWidth: 800),
      child: Row(
        children: [
          SizedBox(
            width: 400,
            child: FindDepositRequestForm(
              id: drmodel.ref.id,
              depositRequest: drmodel,
              onAccepted: (depositRequest) {
                Navigator.of(context).pop(depositRequest);
              },
              onRejected: (depositRequest) {
                Navigator.of(context).pop(depositRequest);
              },
              actions: [
                IconButton(
                  onPressed: () {
                    showDepositRequestModelHistoryDailog(context, drmodel);
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
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                // depositRequests/transections/units
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Column(
                    children: [
                      Expanded(
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: "Deposit Requests",
                            ),
                            Tab(
                              text: "Transections",
                            ),
                            Tab(
                              text: "Units",
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    // depositRequests
                    ModelListView<DepositRequestModel>(
                      controller: ModelListViewController<DepositRequestModel>(
                        value: ModelListViewValue(
                          forceFilter: true,
                          filters: [
                            IndexViewFilter(
                              name: "all",
                              active: true,
                              local: (_model) {
                                var r = _model.ref != drmodel.ref && _model.uid == drmodel.uid;
                                return r;
                              },
                              remote: (query) => query.where("profile.uid", isEqualTo: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                            IndexViewFilter(
                              name: "pending",
                              active: false,
                              local: (_model) => _model.status == DepositRequestStatus.pending && _model.ref != drmodel.ref && _model.uid == drmodel.uid,
                              remote: (query) => query.where("profile.uid", isEqualTo: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                            // accepted
                            IndexViewFilter(
                              name: "accepted",
                              local: (_model) => _model.status == DepositRequestStatus.accepted && _model.ref != drmodel.ref && _model.uid == drmodel.uid,
                              remote: (query) => query.where("profile.uid", isEqualTo: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                            // rejected
                            IndexViewFilter(
                              name: "rejected",
                              local: (_model) => _model.status == DepositRequestStatus.pending && _model.ref != drmodel.ref && _model.uid == drmodel.uid,
                              remote: (query) => query.where("profile.uid", isEqualTo: drmodel.uid),
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
                      ),
                      onModelTap: (model) async {
                        await showDetailsDepositRequestModellDailog(context, model);
                      },
                      flexTableItemBuilders: [
                        (
                          header: const Text(""),
                          config: const FlexTableItemConfig.square(30),
                          builder: (model) {
                            return Center(
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  color: model.status.color,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
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
                              avatar: const Icon(FluentIcons.image_24_regular),
                              label: const Text("Compare"),
                              onPressed: attachment == null
                                  ? null
                                  : () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          fullscreenDialog: true,
                                          builder: (context) {
                                            return CompereAttatchmentViewer(
                                              images: [
                                                attachment,
                                                if (drmodel.attachments?.first.src.nullIfEmpty != null) drmodel.attachments!.first.src,
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                            );
                          }
                        ),
                      ],
                    ),
                    // transections
                    ModelListView<TransactionModel>(
                      controller: ModelListViewController<TransactionModel>(
                        value: ModelListViewValue(
                          forceFilter: true,
                          filters: [
                            IndexViewFilter(
                              name: "all",
                              active: true,
                              local: (_model) {
                                var r = _model.ref != drmodel.ref && _model.uid == drmodel.uid;
                                return r;
                              },
                              remote: (query) => query.where("uids", arrayContains: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                            IndexViewFilter(
                              name: "pending",
                              active: false,
                              local: (_model) => _model.status == TransactionStatus.pending && _model.ref != drmodel.ref && _model.uid == drmodel.uid,
                              remote: (query) => query.where("uids", arrayContains: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                            // accepted
                            IndexViewFilter(
                              name: "success",
                              local: (_model) => _model.status == TransactionStatus.success && _model.ref != drmodel.ref && _model.uid == drmodel.uid,
                              remote: (query) => query.where("uids", arrayContains: drmodel.uid),
                              strict: false,
                              fixed: true,
                            ),
                          ],
                        ),
                        description: TransactionModel.description.copyWith(
                          actions: [
                            ModelAction(
                              label: "Show details",
                              group: "CRUD",
                              icon: Icon(FluentIcons.search_20_regular),
                              single: (context, model) async {
                                // return await showDetailsTransactionModelDailog(context, model!);
                              },
                            ),
                            // show history
                            // ModelAction(
                            //   label: "Show history",
                            //   group: "related",
                            //   icon: Icon(FluentIcons.history_20_regular),
                            //   single: (context, model) async {
                            //     await showTransactionModelHistoryDailog(context, model!);
                            //   },
                            // ),
                          ],
                        ),
                      ),
                      onModelTap: (model) async {
                        //
                      },
                      flexTableItemBuilders: [
                        (
                          header: const Text(""),
                          config: const FlexTableItemConfig.size(width: 50),
                          builder: (model) {
                            if (model.from == drmodel.uid) {
                              return Center(
                                child: Badge(
                                  label: Text("BUY"),
                                  backgroundColor: model.amount == 0 ? Theme.of(context).colorScheme.onBackground : Colors.red,
                                ),
                              );
                            } else {
                              return Center(
                                child: Badge(
                                  label: Text("IN"),
                                  textColor: Colors.white,
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          }
                        ),
                        (
                          header: const Text("Amount"),
                          config: const FlexTableItemConfig.flex(1),
                          builder: (model) {
                            return Text("${model.amount} DZD");
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
                    ),

                    // units (where ref contains model.profile.customClaims.products)
                    FutureBuilder(
                        future: getModelDocument(
                          path: "profiles/${drmodel.uid}",
                          fromJson: ProfileModel.fromJson,
                        ),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData || snapshot.data == null) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                          var userProfile = snapshot.data!;

                          return ModelListView<UnitModel>(
                            flexTableItemBuilders: [
                              (
                                header: const SizedBox(),
                                config: const FlexTableItemConfig.square(40),
                                builder: (model) {
                                  var firstLetters = (model.teacher.displayName.nullIfEmpty ?? "?")[0].toUpperCase();
                                  return CircleAvatar(
                                    backgroundColor: model.color,
                                    backgroundImage: model.teacher.photoUrl.nullIfEmpty == null ? null : NetworkImage(model.teacher.photoUrl),
                                    child: model.teacher.photoUrl.nullIfEmpty != null ? null : Text(firstLetters),
                                  );
                                }
                              ),
                              (
                                header: const Text("Unit"),
                                config: const FlexTableItemConfig.flex(2),
                                builder: (model) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        model.name.nullIfEmpty ?? "(No name)",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        model.title.nullIfEmpty ?? model.description,
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
                                          color: model.visibility.color,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Flexible(
                                        child: Text(
                                          model.visibility.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              ),
                              (
                                header: const Text("total price"),
                                config: const FlexTableItemConfig.flex(1),
                                builder: (model) {
                                  if (model.total == 0) {
                                    return const Center(
                                      child: Badge(
                                        label: Text("FREE UNIT"),
                                      ),
                                    );
                                  }
                                  return Text("${model.total} DZD");
                                }
                              ),
                              (
                                header: const Text("UpdatedAt"),
                                config: const FlexTableItemConfig.flex(2),
                                builder: (model) {
                                  return Text(
                                    timeago.format(model.updatedAt),
                                    style: Theme.of(context).textTheme.bodySmall,
                                  );
                                }
                              ),
                            ],
                            controller: ModelListViewController<UnitModel>(
                              value: ModelListViewValue(
                                forceFilter: true,
                                filters: [
                                  //all
                                  IndexViewFilter(
                                    name: "all",
                                    active: true,
                                    local: (model) {
                                      return userProfile!.products.contains(model.ref.path);
                                    },
                                    strict: false,
                                    fixed: true,
                                  ),
                                  IndexViewFilter(
                                    name: "visible",
                                    active: false,
                                    local: (model) => model.visibility == ModelVisibility.visible && userProfile!.products.contains(model.ref.path),
                                    remote: (query) => query.where("visibility", isEqualTo: ModelVisibility.visible.name),
                                    strict: false,
                                    fixed: true,
                                  ),
                                  IndexViewFilter(
                                    name: "hidden",
                                    local: (model) => model.visibility == ModelVisibility.hidden && userProfile!.products.contains(model.ref.path),
                                    remote: (query) => query.where("visibility", isEqualTo: ModelVisibility.hidden.name),
                                    strict: false,
                                    fixed: true,
                                  ),
                                  // free
                                  IndexViewFilter(
                                    name: "free",
                                    local: (model) => model.price == 0 && userProfile!.products.contains(model.ref.path),
                                    remote: (query) => query.where("price", isEqualTo: 0),
                                    strict: false,
                                    fixed: true,
                                  ),
                                  // paid
                                  IndexViewFilter(
                                    name: "paid",
                                    local: (model) => model.price > 0 && userProfile!.products.contains(model.ref.path),
                                    remote: (query) => query.where("price", isGreaterThan: 0).orderBy("price"),
                                    strict: false,
                                    fixed: true,
                                  ),
                                ],
                              ),
                              description: UnitModel.modelDescription.copyWith(),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
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
