
// showDetailsTransactionModellDailog
import 'package:core/features/users/presentation/find.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../models/transaction_model.dart';

Future<void> showDetailsTransactionModellDailog(BuildContext context, TransactionModel model) async {
  var child = Container(
    constraints: const BoxConstraints(maxWidth: 500),
    child: Center(
      child: DetailsTransactionModellDailog(model: model),
    ),
  );
  return await showDialog(
    context: context,useRootNavigator: false,
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


class DetailsTransactionModellDailog extends StatelessWidget {
  const DetailsTransactionModellDailog({
    Key? key,
    required this.model,
  }) : super(key: key);

  final TransactionModel model;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Transaction Details'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(FluentIcons.info_24_regular),
                text: 'Details',
              ),
              Tab(
                icon: Icon(FluentIcons.person_20_regular),
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // wallet section
                  const ListTile(
                    enabled: false,
                    leading: Icon(FluentIcons.person_20_regular),
                    contentPadding: EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: VisualDensity(vertical: -3),
                    title: Text('Profile'),
                  ),
                  // balance
                  ListTile(
                    leading: const Icon(FluentIcons.money_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.uid),
                    subtitle: const Text(
                      'UID',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.uid);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                    // onTap: () {
                    //   var profileWidget = ProfileSummary(
                    //     ref: "profiles/${model.uid}",
                    //   );
                    //   showBottomSheet(
                    //     context: context,
                    //     builder: (context) {
                    //       return SingleChildScrollView(child: profileWidget);
                    //     },
                    //   );
                    // },
                  ),
                  // status
                  ListTile(
                    leading: const Icon(FluentIcons.status_32_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.status.name),
                    subtitle: const Text(
                      'Status',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.status.name);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // type
                  ListTile(
                    leading: const Icon(FluentIcons.card_ui_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.type.name),
                    subtitle: const Text(
                      'Type',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.type.name);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // product
                  if (model.product != null)
                  ListTile(
                    leading: const Icon(FluentIcons.production_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.product!),
                    subtitle: const Text(
                      'Product',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.product!);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // from
                  if (model.from != null)
                  ListTile(
                    leading: const Icon(FluentIcons.person_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.from!),
                    subtitle: const Text(
                      'From',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.from!);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // to
                  if (model.to != null)
                  ListTile(
                    leading: const Icon(FluentIcons.person_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.to!),
                    subtitle: const Text(
                      'To',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.to!);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  const Divider(),
                  // amount
                  ListTile(
                    leading: const Icon(FluentIcons.money_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.amount.toString()),
                    subtitle: const Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.amount.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // currency
                  ListTile(
                    leading: const Icon(FluentIcons.money_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.currency),
                    subtitle: const Text(
                      'Currency',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.currency);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  const Divider(),
                  // details
                  ListTile(
                    leading: const Icon(FluentIcons.info_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.details ?? ''),
                    subtitle: const Text(
                      'Details',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.details);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // promocode
                  if (model.promocode != null)
                  ListTile(
                    leading: const Icon(FluentIcons.info_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.promocode ?? ''),
                    subtitle: const Text(
                      'Promocode',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.promocode);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  const Divider(),
                  // dates
                  ListTile(
                    leading: const Icon(FluentIcons.calendar_ltr_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.createdAt.toIso8601String()),
                    subtitle: const Text(
                      'Created At',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.createdAt.toIso8601String());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(FluentIcons.calendar_ltr_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.updatedAt.toIso8601String()),
                    subtitle: const Text(
                      'Updated At',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.updatedAt.toIso8601String());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(FluentIcons.calendar_ltr_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: Text(model.deletedAt?.toIso8601String() ?? 'null'),
                    subtitle: const Text(
                      'Deleted At',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, model.deletedAt?.toIso8601String() ?? 'null');
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: ProfileSummary(
                        ref: "profiles/${model.uid}",
                      ),
            ),
          ],
        ),
      ),
    );
  }
}