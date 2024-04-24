// showExtendedDepositRequestModelDailog
// it show 3 columns 1 same as find dailog and 2 other columns one for history and the other for the details (wallet...)
import 'package:core/features/users/presentation/find.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:shared/features/deposit_requests/presentation/dailogs.dart';
import 'package:shared/features/gift_cards/presentation/forms/dailogs.dart';
import 'package:shared/features/units/dailogs.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/models/gift_card_model.dart';
import 'package:shared/models/transaction_model.dart';
import 'package:shared/shared.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously

// ignore: depend_on_referenced_packages
import 'package:core/features/users/presentation/dailogs.dart';
import 'package:core/features/users/presentation/forms/create_profile.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shared/features/transactions/dailogs.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recase/recase.dart';
import 'package:shared/features/deposit_requests/presentation/dailogs.dart';
import 'package:shared/features/deposit_requests/presentation/forms/find.dart';
import 'package:shared/features/stations/presentation/forms/dailogs.dart';
import 'package:shared/features/stations/stations.dart';
import 'package:shared/features/units/presentation/forms/dailogs.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/models/gift_card_model.dart';
import 'package:shared/models/transaction_model.dart';
import 'package:shared/models/unit_model.dart';
import 'package:shared/shared.dart';
import 'package:core/features/users/presentation/find.dart';
import 'package:timeago/timeago.dart' as timeago;
// DateFormat
import 'package:intl/intl.dart';

Future<void> showExtendedStudentModelDailog(BuildContext context, ProfileModel profile) async {
  final giftCardsController = ModelListViewController<GiftCardModel>(
    value: ModelListViewValue(
      profilesFilters: [
        const ModelListProfileFilter(path: "profile.uid")
      ],
      forceFilter: true,
      rootQuery: (query) => query.where("transaction.uid", isEqualTo: profile.uid),
      filters: [
        // all
        IndexViewFilter(
          name: "All",
          active: true,
          local: (model) => true,
          remote: (query) => query,
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(
          name: "Not used",
          active: false,
          local: (model) => model.transaction == null,
          remote: (query) => query.where("transaction", isNull: true),
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(
          name: "Used",
          active: false,
          local: (model) => model.transaction != null,
          remote: (query) => query.where("transaction", isNull: false).orderBy('transaction'),
          strict: false,
          fixed: true,
        ),
        // assgined/not assigned
        IndexViewFilter(
          name: "Assigned",
          active: false,
          local: (model) => model.owner != null,
          remote: (query) => query.where("owner", isNull: false).orderBy('owner'),
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(
          name: "Not assigned",
          active: false,
          local: (model) => model.owner == null,
          remote: (query) => query.where("owner", isNull: true),
          strict: false,
          fixed: true,
        ),
      ],
    ),
    description: GiftCardModel.description.copyWith(
      actions: [],
    ),
  );
  final giftCardOrdersController = ModelListViewController<GiftCardOrderModel>(
    value: ModelListViewValue(
      profilesFilters: [
        const ModelListProfileFilter(path: "profile.uid")
      ],
      forceFilter: true,
      rootQuery: (query) => query.where("profile.uid", isEqualTo: profile.uid),
      filters: [
        // all
        IndexViewFilter(
          name: "All",
          active: true,
          local: (model) => true,
          remote: (query) => query,
          strict: false,
          fixed: true,
        ),
        for (var status in OrderStatus.values)
          IndexViewFilter(
            name: status.name,
            active: false,
            local: (model) => model.status == status,
            remote: (query) => query.where("status", isEqualTo: status.name),
            strict: false,
            fixed: true,
          ),
      ],
    ),
    description: GiftCardOrderModel.description,
  );
  final transectionsController = ModelListViewController<TransactionModel>(
    value: ModelListViewValue(
      rootQuery: (query) => query.where("uids", arrayContains: profile.uid),
      profilesFilters: [
        const ModelListProfileFilter(name: "income", path: "to"),
        const ModelListProfileFilter(name: "outcome", path: "from"),
      ],
      forceFilter: true,
      filters: [
        // all
        IndexViewFilter(
          name: "All",
          active: true,
          local: (model) => true,
          remote: (query) => query,
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(name: "income", local: (model) => model.to == profile.uid, remote: (query) => query.where("to", isEqualTo: profile.uid), strict: false, fixed: true, mixWithRootQuery: false),
        IndexViewFilter(name: "outcome", local: (model) => model.from == profile.uid, remote: (query) => query.where("from", isEqualTo: profile.uid), strict: false, fixed: true, mixWithRootQuery: false),
        for (var type in TransactionType.values)
          IndexViewFilter(
            name: type.name,
            local: (model) => model.type == type,
            remote: (query) => query.where("type", isEqualTo: type.name),
            strict: false,
            fixed: true,
          ),
        for (var status in TransactionStatus.values)
          IndexViewFilter(
            name: status.name,
            local: (model) => model.status == status,
            remote: (query) => query.where("status", isEqualTo: status.name),
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
          icon: const Icon(FluentIcons.search_20_regular),
          single: (context, model) async {},
        ),
        // make it pending
        for (var status in TransactionStatus.values)
          ModelAction(
            label: "as ${status.name}",
            group: "CRUD",
            icon: const Icon(FluentIcons.clock_20_regular),
            single: (context, model) async {
              if (model != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    width: 400.0,
                    content: Text('updating to ${status.name}...'),
                  ),
                );
                await updateDocument(
                  path: model.ref.path,
                  data: {
                    "status": status.name,
                  },
                );
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    width: 400.0,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    content: Text(
                      'Updated to ${status.name} done!',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                );
              }
            },
            multiple: (context, models) async {
              if (models != null) {
                var loading = false;
                var progress = 0.0;
                String? error;
                await showDialog(
                  useRootNavigator: false,
                  context: context,
                  builder: (context) => StatefulBuilder(builder: (context, setState) {
                    return AlertDialog(
                      title: Text('Confirm ${status.name} ${models.length} items'),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('are you sure you want to continue?'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: loading
                              ? null
                              : () async {
                                  loading = true;
                                  error = null;
                                  setState(() {});
                                  try {
                                    for (var model in models) {
                                      await updateDocument(
                                        path: model.ref.path,
                                        data: {
                                          "status": status.name,
                                        },
                                      );
                                      progress += 1.0 / models.length;
                                      setState(() {});
                                    }
                                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        width: 400.0,
                                        content: Text('${models.length} items updated to ${status.name} successfully!'),
                                        action: SnackBarAction(
                                          label: 'Close',
                                          onPressed: () {
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          },
                                        ),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  } catch (e) {
                                    error = e.toString();
                                  }
                                  loading = false;
                                  setState(() {});
                                },
                          child: loading ? const CircularProgressIndicator.adaptive() : Text(status.name),
                        ),
                      ],
                    );
                  }),
                );
              }
            },
          ),
      ],
    ),
  );
  final depositRequestsController = ModelListViewController<DepositRequestModel>(
    value: ModelListViewValue(
      profilesFilters: [
        const ModelListProfileFilter(path: "profile.uid")
      ],
      rootQuery: (query) => query.where("profile.uid", isEqualTo: profile.uid),
      forceFilter: true,
      filters: [
        // all
        IndexViewFilter(
          name: "All",
          active: true,
          local: (model) => true,
          remote: (query) => query,
          strict: false,
          fixed: true,
        ),
        IndexViewFilter(
          name: "pending",
          active: false,
          local: (model) => model.status == DepositRequestStatus.pending,
          remote: (query) => query.where("status", isEqualTo: DepositRequestStatus.pending.name),
          strict: false,
          fixed: true,
        ),
        // accepted
        IndexViewFilter(
          name: "accepted",
          local: (model) => model.status == DepositRequestStatus.accepted,
          remote: (query) => query.where("status", isEqualTo: DepositRequestStatus.accepted.name),
          strict: false,
          fixed: true,
        ),
        // rejected
        IndexViewFilter(
          name: "rejected",
          local: (model) => model.status == DepositRequestStatus.rejected,
          remote: (query) => query.where("status", isEqualTo: DepositRequestStatus.rejected.name),
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
          icon: const Icon(FluentIcons.search_20_regular),
          single: (context, model) async {
            return await showDetailsDepositRequestModellDailog(context, model!);
          },
        ),
        // show history
        ModelAction(
          label: "Show history",
          group: "related",
          icon: const Icon(FluentIcons.history_20_regular),
          single: (context, model) async {
            await showDepositRequestModelHistoryDailog(context, model!);
          },
        ),
      ],
    ),
  );
  child(BuildContext context) {
    List<
        ({
          Tab tab,
          Widget view,
        })> views = [
      if (MediaQuery.sizeOf(context).width <= 800) ...[
        (
          tab: const Tab(
            text: "Profile",
          ),
          view: SingleChildScrollView(
            child: Column(
              children: [
                // Container(padding: const EdgeInsets.symmetric(horizontal: 12), height: 100, child: WalletCard(profile: profile)),
                ProfileSummary(model: profile),
              ],
            ),
          ),
        ),
      ],
      if (profile.rolesString.contains("student"))
        (
          tab: const Tab(
            text: "Deposit Requests",
          ),
          view: ModelListView<DepositRequestModel>(
            controller: depositRequestsController,
            onModelTap: (model) async {
              await showDetailsDepositRequestModellDailog(context, model);
              await depositRequestsController.load();
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
                    getPrefs().formatDate(model.updatedAt) ?? "--",
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
            ],
          ),
        ),
      if (profile.rolesString.contains("student"))
        (
          tab: const Tab(
            text: "Gift Cards",
          ),
          view: ModelListView<GiftCardModel>(
            onModelTap: (model) async {
              await showUpdateGiftCardDailog(context, model: model);
              await giftCardsController.load();
            },
            onAddPressed: () async {
              await showCreateGiftCardDailog(context);
              await giftCardsController.load();
            },
            flexTableItemBuilders: [
              (
                header: const SizedBox(),
                config: const FlexTableItemConfig.square(40),
                builder: (model) {
                  return ProfileAvatar(profile: model.owner);
                }
              ),
              (
                header: const Text("owner"),
                config: const FlexTableItemConfig.flex(2),
                builder: (model) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.owner?.displayName ?? "(No owner yet)",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      DataFlagWidget(
                        custom: "#${model.ref.id}",
                      ),
                    ],
                  );
                }
              ),
              // amount
              (
                header: const Text("amount"),
                config: const FlexTableItemConfig.flex(1),
                builder: (model) {
                  return Text("${model.amount} ${model.currency}");
                }
              ),
              if (MediaQuery.sizeOf(context).width > 800) ...[
                (
                  header: const Text("Expires At"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      model.expiresAt == null ? "No expiry" : DateFormat.yMMMd().format(model.expiresAt!),
                      // red if expired, green if not
                      style: TextStyle(
                        color: model.expiresAt == null || model.expiresAt!.isAfter(DateTime.now()) ? Colors.green : Colors.red,
                      ),
                    );
                  }
                ),
                (
                  header: const Text("code"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(model.code.substring(0, 3) + ("*" * (model.code.length - 6)) + model.code.substring(model.code.length - 3));
                  }
                ),
              ],
              if (MediaQuery.sizeOf(context).width > 1000) ...[
                (
                  header: const Text("updatedAt"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      getPrefs().formatDate(model.updatedAt) ?? "--",
                      style: Theme.of(context).textTheme.caption,
                    );
                  }
                ),
              ],
            ],
            controller: giftCardsController,
          ),
        ),
      if (profile.rolesString.contains("student"))
        (
          tab: const Tab(
            text: "GC Orders",
          ),
          view: ModelListView<GiftCardOrderModel>(
            onModelTap: (model) async {
              await showDetailsGiftCardOrderModellDailog(
                context,
                model,
              );
              await giftCardOrdersController.load();
            },
            flexTableItemBuilders: [
              (
                header: const SizedBox(),
                config: const FlexTableItemConfig.square(40),
                builder: (model) {
                  return ProfileAvatar(profile: model.profile);
                },
              ),
              (
                header: const Text("customer"),
                config: const FlexTableItemConfig.flex(2),
                builder: (model) {
                  if (model.profile?.displayName.nullIfEmpty == null) return const DataFlagWidget.empty();
                  return Text(
                    model.profile!.displayName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
              // amount
              (
                header: const Text("amount"),
                config: const FlexTableItemConfig.flex(1),
                builder: (model) {
                  return Text("${model.amount} din");
                }
              ),
              if (MediaQuery.sizeOf(context).width > 800) ...[
                //status
                (
                  header: const Text("status"),
                  config: const FlexTableItemConfig.flex(1),
                  builder: (model) {
                    return DataFlagWidget(
                      color: model.status.color,
                      custom: model.status.name,
                    );
                  }
                ),
              ],
              if (MediaQuery.sizeOf(context).width > 1000) ...[
                (
                  header: const Text("updatedAt"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      getPrefs().formatDate(model.updatedAt) ?? "--",
                      style: Theme.of(context).textTheme.caption,
                    );
                  }
                ),
              ],
            ],
            controller: giftCardOrdersController,
          ),
        ),
      (
        tab: const Tab(
          text: "Transections",
        ),
        view: ModelListView<TransactionModel>(
          controller: transectionsController,
          onModelTap: (model) async {
            await showDetailsTransactionModellDailog(context, model);
            await transectionsController.load();
          },
          flexTableItemBuilders: [
            (
              header: const Text("Details"),
              config: const FlexTableItemConfig.flex(4),
              builder: (model) {
                return Text(model.details ?? "(No details)");
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
              header: const Text("Type"),
              config: const FlexTableItemConfig.flex(1),
              builder: (model) {
                return Text(model.type.name);
              }
            ),
            (
              header: const Text("Status"),
              config: const FlexTableItemConfig.flex(1),
              builder: (model) {
                return DataFlagWidget(
                  color: model.status.color,
                  custom: model.status.name,
                );
              }
            ),
            (
              header: const Text("updatedAt"),
              config: const FlexTableItemConfig.flex(2),
              builder: (model) {
                return Text(
                  getPrefs().formatDate(model.updatedAt) ?? "--",
                  style: Theme.of(context).textTheme.caption,
                );
              }
            ),
          ],
        ),
      ),
      if (profile.rolesString.contains("student"))
        (
          tab: const Tab(
            text: "Units",
          ),
          view: FutureBuilder(
            future: getModelDocument(
              path: "profiles/${profile.uid}",
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
                onAddPressed: () async {
                  /// add unit user by creating transaction with the [Unit.price] and
                  /// [Unit.ref] in product
                  var selectedUnits = await showUnitsPickerDialog(context);
                  if (selectedUnits != null && selectedUnits.isNotEmpty) {
                    var progress = ValueNotifier(0);
                    // use scaffold massenger and linear progress indicator
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        width: 400.0,
                        duration: const Duration(days: 1),
                        padding: const EdgeInsets.all(0),
                        content: ValueListenableBuilder(
                          valueListenable: progress,
                          builder: (context, value, child) {
                            // close when done
                            if (value == selectedUnits.length) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            }
                            return DefaultTextStyle(
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Theme.of(context).colorScheme.onPrimary,
                                      ),
                                    ),
                                    title: Text("Buying ${selectedUnits.length} units", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                                    trailing: Text(
                                      "${value}/${selectedUnits.length}",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                    ),
                                  ),
                                  LinearProgressIndicator(
                                    value: value / selectedUnits.length,
                                    minHeight: 2,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                    for (var unit in selectedUnits) {
                      var transaction = TransactionModel(
                        ref: ModelRef.random("transactions"),
                        from: userProfile.uid,
                        to: getCurrentProfile()!.uid,
                        uid: userProfile.uid,
                        product: unit.ref.path,
                        amount: 0,
                        details: "buy unit ${unit.name}",
                        type: TransactionType.purchase,
                        status: TransactionStatus.pending,
                        uids: [
                          userProfile.uid,
                          getCurrentProfile()!.uid
                        ],
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      );
                      await setDocument(
                        path: transaction.ref.path,
                        data: transaction.toJson(),
                      );
                      progress.value++;
                    }
                  }
                },
                flexTableItemBuilders: [
                  (
                    header: const SizedBox(),
                    config: const FlexTableItemConfig.square(40),
                    builder: (model) {
                      var firstLetters = (model.teacher.displayName.nullIfEmpty ?? "?")[0].toUpperCase();
                      return CircleAvatar(
                        backgroundColor: model.color,
                        backgroundImage: model.teacher.photoUrl.nullIfEmpty == null ? null : CachedNetworkImageProvider(model.teacher.photoUrl),
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
                        getPrefs().formatDate(model.updatedAt) ?? "--",
                        style: Theme.of(context).textTheme.bodySmall,
                      );
                    }
                  ),
                ],
                controller: ModelListViewController<UnitModel>(
                  value: ModelListViewValue(
                    showDelete: false,
                    profilesFilters: [
                      const ModelListProfileFilter(path: "profile.uid"),
                    ],
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
            },
          )
        ),
      if (profile.rolesString.contains("teacher"))
        (
          tab: const Tab(
            text: "Units",
          ),
          view: ModelListView<UnitModel>(
            onModelTap: (model) async {
              await showUpdateUnitDailog(context, model: model);
            },
            onAddPressed: () async {
              await showUpdateUnitDailog(context, collection: "units");
            },
            flexTableItemBuilders: [
              (
                header: const SizedBox(),
                config: const FlexTableItemConfig.square(40),
                builder: (model) {
                  return ProfileAvatar(profile: model.teacher, color: model.color);
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
                  Widget title;
                  if (model.total == 0) {
                    title = Badge(
                      backgroundColor: model.color,
                      label: const Text("FREE UNIT"),
                      textColor: Colors.white,
                    );
                  } else {
                    title = Text("${model.total} DZD");
                  }

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      Row(
                        children: [
                          const Icon(
                            FluentIcons.person_12_regular,
                            size: 12,
                            color: Colors.grey,
                          ),
                          Text(
                            "${model.statistics.students}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  );
                }
              ),
              if (MediaQuery.sizeOf(context).width > 800) ...[
                (
                  header: const Text("Incomes"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text("${model.metadata["_sync_totalAmount"]}");
                  }
                ),
                (
                  header: const Text("UpdatedAt"),
                  config: const FlexTableItemConfig.flex(2),
                  builder: (model) {
                    return Text(
                      getPrefs().formatDate(model.updatedAt) ?? "--",
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  }
                ),
              ],
              if (MediaQuery.sizeOf(context).width > 1000) ...[
                (
                  header: const Text("duration"),
                  config: const FlexTableItemConfig.flex(1),
                  builder: (model) {
                    return Text("${model.duration.inMinutes}min");
                  }
                ),
              ]
            ],
            controller: ModelListViewController<UnitModel>(
              value: ModelListViewValue(
                rootQuery: (query) => query.where("teacher.uid", isEqualTo: profile.uid),
                forceFilter: true,
                filters: [
                  //all
                  IndexViewFilter(
                    name: "all",
                    active: true,
                    local: (model) => true,
                    strict: false,
                    fixed: true,
                  ),
                  IndexViewFilter(
                    name: "visible",
                    active: false,
                    local: (model) {
                      return model.visibility.name == ModelVisibility.visible.name;
                    },
                    remote: (query) => query.where("visibility", isEqualTo: ModelVisibility.visible.name),
                    strict: false,
                    fixed: true,
                  ),
                  IndexViewFilter(
                    name: "hidden",
                    local: (model) => model.visibility.name == ModelVisibility.hidden.name,
                    remote: (query) => query.where("visibility", isEqualTo: ModelVisibility.hidden.name),
                    strict: false,
                    fixed: true,
                  ),
                  // free
                  IndexViewFilter(
                    name: "free",
                    local: (model) => model.price == 0,
                    remote: (query) => query.where("price", isEqualTo: 0),
                    strict: false,
                    fixed: true,
                  ),
                  // paid
                  IndexViewFilter(
                    name: "paid",
                    local: (model) => model.price > 0,
                    remote: (query) => query.where("price", isGreaterThan: 0).orderBy("price"),
                    strict: false,
                    fixed: true,
                  ),
                ],
              ),
              description: UnitModel.modelDescription.copyWith(
                actions: [
                  // Sections of unit
                  // transactions
                  ModelAction(
                    group: "relations",
                    label: "sections",
                    icon: const Icon(FluentIcons.notebook_section_24_regular),
                    single: (context, model) async {
                      if (model != null) {
                        await showUnitSectionsDailog(context, model);
                      }
                    },
                  ),

                  ModelAction(
                    group: "CRUD",
                    label: "edit",
                    icon: const Icon(FluentIcons.edit_16_regular),
                    single: (context, model) async {
                      if (model != null) {
                        await showUpdateUnitDailog(context, model: model);
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

                  // sync
                  ModelAction(
                    group: "sync",
                    label: "sync",
                    icon: const Icon(FluentIcons.arrow_sync_12_regular),
                    single: (context, model) async {
                      if (model != null) {
                        await updateDocument(
                          path: model.ref.path,
                          data: {},
                        );
                      }
                    },
                    multiple: (context, models) async {
                      ValueNotifier<int> progress = ValueNotifier(0);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: ValueListenableBuilder<int>(
                            valueListenable: progress,
                            builder: (context, value, child) {
                              if (progress.value == models?.length) {
                                return const Text("Syncing completed");
                              }
                              return Text("Syncing ${value}/${models?.length} ...");
                            },
                          ),
                          // loading
                          duration: const Duration(seconds: 30),
                          action: SnackBarAction(
                            label: "Cancel",
                            onPressed: () {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                          ),
                        ),
                      );
                      for (var i = 0; i < models!.length; i++) {
                        var model = models[i];
                        await updateDocument(
                          path: model.ref.path,
                          data: {},
                        );
                        progress.value++;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    ];

    return Container(
      // constraints: const BoxConstraints(maxWidth: 800),
      child: Row(
        children: [
          if (MediaQuery.sizeOf(context).width > 800) ...[
            SizedBox(
              width: 350,
              child: SingleChildScrollView(
                child: ProfileSummary(model: profile),
              ),
            ),
            const VerticalDivider(
              width: 1,
              thickness: 1,
            ),
          ],
          Expanded(
            child: DefaultTabController(
              key: ValueKey(views.length),
              length: views.length,
              child: Scaffold(
                // depositRequests/transections/units
                appBar: AppBar(
                  title: Row(
                    children: [
                      Text(profile.displayName.nullIfEmpty ?? profile.email.nullIfEmpty ?? profile.phoneNumber ?? "Student"),
                      const SizedBox(
                        width: 8,
                      ),
                      for (var role in profile.rolesString) ...[
                        DataFlagWidget(
                          custom: "${role}",
                          color: profile.rolesString.first == "student" ? Colors.green : Colors.red,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ]
                    ],
                  ),
                  // edit
                  actions: [
                    IconButton(
                      onPressed: () async {
                        await showUpdateProfileModelDailog(context, profile);
                      },
                      icon: const Icon(FluentIcons.edit_16_regular),
                    ),
                  ],
                  bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dragStartBehavior: DragStartBehavior.start,
                    dividerColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                    dividerHeight: 1,
                    tabs: [
                      for (var view in views) view.tab,
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    for (var view in views) view.view,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return Material(
          // dailog background color
          color: Theme.of(context).colorScheme.background,
          child: child(context),
        );
      },
    ),
  );
}
