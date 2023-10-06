// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lib/lib.dart';
import 'package:photo_view/photo_view.dart';
import 'package:recase/recase.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [FindDepositRequestForm] is a form to update a new user
class FindDepositRequestForm extends StatefulWidget {
  final String id;
  final DepositRequestModel? depositRequest;
  final VoidCallback? onCancel;
  final void Function(DepositRequestModel? depositRequest)? onFinded;
  // on accept
  final void Function(DepositRequestModel depositRequest)? onAccepted;
  // on reject
  final void Function(DepositRequestModel depositRequest)? onRejected;

  final List<Widget> actions;
  const FindDepositRequestForm({
    Key? key,
    this.onFinded,
    this.onAccepted,
    this.onRejected,
    this.onCancel,
    required this.id,
    required this.depositRequest,
    this.actions = const [],
  }) : super(key: key);

  @override
  State<FindDepositRequestForm> createState() => _FindDepositRequestFormState();
}

class _FindDepositRequestFormState extends State<FindDepositRequestForm> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  late String? _error;
  DepositRequestModel? depositRequest;
  @override
  void initState() {
    super.initState();
    depositRequest = widget.depositRequest;
    if (depositRequest == null) {
      find();
    }
    _error = null;
  }

  Future<void> find() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _error = null;
        _loading = true;
      });
      var request = DepositRequestFindRequest(
        id: widget.id,
      );
      try {
        depositRequest = await DepositRequestRepository.instance.find(request);
        widget.onFinded?.call(depositRequest);
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
        rethrow;
      }

      setState(() {
        _loading = false;
      });
    }
  }

  String? get _firstImageUrl {
    return depositRequest?.attachments != null && depositRequest!.attachments!.isNotEmpty && depositRequest!.attachments!.first.src.isNotEmpty == true ? depositRequest!.attachments!.first.src : null;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: _loading,
      child: 
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                floating: true,
                excludeHeaderSemantics: true,
                forceElevated: true,
                primary: true,
                snap: true,
                stretch: true,
                stretchTriggerOffset: 100,
                title: Text('Deposit #${widget.depositRequest?.ref.id.substring(0, 6)}'),
                leading: const BackButton(),
                actions: [
                  ...widget.actions,
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: _firstImageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    _firstImageUrl!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
                              Colors.transparent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // open in url luncher
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: FilledButton.tonalIcon(
                                onPressed: () async {
                                  // if (_firstImageUrl != null) {
                                  //   await launchUrl(Uri.parse(_firstImageUrl!));
                                  // }
                                  // open PhotoView
                                  if (_firstImageUrl != null) {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        fullscreenDialog: true,
                                        builder: (context) {
                                          return AttatchmentViewer(firstImageUrl: _firstImageUrl);
                                        },
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(FluentIcons.image_24_regular),
                                label: const Text('View Attachment'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: ConstrainedBox(
                  /// max width is 600
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
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
                    
                          const SizedBox(height: 20),
                          // status
                          ListTile(
                            leading:
                                // circle zith color
                                Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: depositRequest?.status.color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Icon(
                                  FluentIcons.checkmark_16_regular,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                            visualDensity: const VisualDensity(vertical: -3),
                            title: depositRequest?.status == null ? const TextPlaceholder() : Text(depositRequest!.status.name.pascalCase),
                            subtitle: Text(
                              (depositRequest?.metadata['reason'] ?? "Status"),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            trailing: Row
                                // Accept and Reject buttons
                                (
                              mainAxisSize: MainAxisSize.min,
                              children: depositRequest?.status != DepositRequestStatus.pending
                                  ? []
                                  : [
                                      // Accept button
                                      IconButton(
                                        onPressed: _accept,
                                        icon: const Icon(FluentIcons.checkmark_24_regular),
                                      ),
                                      // Reject button
                                      IconButton(
                                        onPressed: _reject,
                                        icon: const Icon(FluentIcons.dismiss_24_regular),
                                      ),
                                      // open in external browser
                                      // https://console.firebase.google.com/u/0/project/zed-academy-a9e43/firestore/data/~2FdepositRequests~[id]
                                      IconButton(
                                        onPressed: () async {
                                          if (depositRequest != null) {
                                            await launchUrl(Uri.parse('https://console.firebase.google.com/u/0/project/zed-academy-a9e43/firestore/data/~2FdepositRequests~2F${depositRequest!.id}'));
                                          }
                                        },
                                        icon: const Icon(FluentIcons.open_24_regular),
                                      ),
                                    ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            leading: const Icon(FluentIcons.money_24_regular),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                            visualDensity: const VisualDensity(vertical: -3),
                            title: depositRequest?.amount == null ? const TextPlaceholder() : Text("${depositRequest!.amount}"),
                            subtitle: const Text(
                              'Amount',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(FluentIcons.person_24_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: depositRequest?.firstName == null ? const TextPlaceholder() : Text(depositRequest!.firstName!),
                                  subtitle: const Text(
                                    'FirstName',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(FluentIcons.person_24_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: depositRequest?.lastName == null ? const TextPlaceholder() : Text(depositRequest!.lastName!),
                                  subtitle: const Text(
                                    'LastName',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            onTap: () async {
                              if (depositRequest != null) {
                                  await launchUrl(Uri.parse('tel:${depositRequest!.phoneNumber}'));
                              }
                            },
                            leading: const Icon(FluentIcons.phone_20_regular),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                            visualDensity: const VisualDensity(vertical: -3),
                            title: depositRequest?.phoneNumber == null ? const TextPlaceholder() : Text("${depositRequest!.phoneNumber}"),
                            subtitle: const Text(
                              'Phone',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            // use url_launcher
                            trailing: const Icon(FluentIcons.open_24_regular),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            leading: const Icon(FluentIcons.location_24_regular),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                            visualDensity: const VisualDensity(vertical: -3),
                            title: depositRequest?.address == null ? const TextPlaceholder() : Text(depositRequest!.address!),
                            subtitle: const Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            leading: const Icon(FluentIcons.note_24_regular),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                            visualDensity: const VisualDensity(vertical: -3),
                            title: depositRequest?.note == null ? const TextPlaceholder() : Text("${depositRequest!.note}"),
                            subtitle: const Text(
                              'Note',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          // created at
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(FluentIcons.calendar_20_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: depositRequest?.updatedAt == null ? const TextPlaceholder() : Text("${depositRequest!.createdAt}", maxLines: 1, overflow: TextOverflow.ellipsis),
                                  subtitle: const Text(
                                    'Created At',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  leading: const Icon(FluentIcons.calendar_20_regular),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                                  visualDensity: const VisualDensity(vertical: -3),
                                  title: depositRequest?.updatedAt == null ? const TextPlaceholder() : Text("${depositRequest!.updatedAt}", maxLines: 1, overflow: TextOverflow.ellipsis),
                                  subtitle: const Text(
                                    'Last Update at',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // updated at
                          const SizedBox(height: 24),
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

  Future<void> _accept() async {
    var amount = TextEditingController(text: depositRequest?.amount.toString());
    bool loading = false;
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Accept Deposit Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to accept this deposit request?'),
              TextField(
                controller: amount,
                decoration: InputDecoration(
                  labelText: 'Edit Amount',
                  errorText: depositRequest!.amount.toInt() > 9999? "This amount may too big" : null,
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            StatefulBuilder(builder: (context, setState) {
              return OutlinedButton.icon(
                icon: loading == true ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 1,)) : const Icon(FluentIcons.checkmark_24_regular),
                onPressed: loading == true
                    ? null
                    : () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          await DepositRequestRepository.instance.accept(
                            FindRequest(
                              id: widget.depositRequest!.id,
                            ),
                            amount: double.tryParse(amount.text),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Accepted'),
                            ),
                          );
                          widget.onAccepted?.call(depositRequest!.copyWith(
                            amount: double.parse(amount.text),
                            status: DepositRequestStatus.accepted,
                            updatedAt: DateTime.now(),
                          ));
                        }
                        // FirebaseFunctionsException
                        on FirebaseFunctionsException catch (e) {
                          _error = e.message;
                          print(_error);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Not Accepted, FBE'),
                            ),
                          );
                        } catch (e) {
                          setState(() {
                            _error = e.toString();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Not Accepted, E'),
                            ),
                          );
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                label: const Text('Accept'),
              );
            }),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
    if (result != null)
    Navigator.of(context).pop(result);
  }

  Future<void> _reject() async {
    var reason = TextEditingController();
    bool loading = false;
    var result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Reject Deposit Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Are you sure you want to reject this deposit request?'),
              // TextForm for changing the amount
              TextField(
                controller: reason,
                decoration: const InputDecoration(
                  labelText: 'Reason',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            StatefulBuilder(builder: (context, setState) {
              return OutlinedButton.icon(
                icon: loading == true
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ))
                    : const Icon(FluentIcons.dismiss_24_regular),
                onPressed: loading == true
                    ? null
                    : () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          await DepositRequestRepository.instance.reject(
                            FindRequest(
                              id: widget.id,
                            ),
                            reason: reason.text,
                          );
                          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Rejected'),
                            ),
                          );
                          widget.onRejected?.call(depositRequest!.copyWith(
                            status: DepositRequestStatus.rejected,
                            updatedAt: DateTime.now(),
                            metadata: {
                              ...depositRequest!.metadata,
                              'reason': reason.text,
                            }
                          ));
                        }
                        // FirebaseFunctionsException
                        on FirebaseFunctionsException catch (e) {
                          setState(() {
                            _error = e.message;
                          });
                          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Not Rejected, FBE'),
                            ),
                          );
                        } catch (e) {
                          _error = e.toString();
                          ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                            const SnackBar(
                              content: Text('Deposit Request Not Rejected, E'),
                            ),
                          );
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                label: const Text('Reject'),
              );
            }),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );

    if (result != null)
    Navigator.of(context).pop(result);
  }
}

class AttatchmentViewer extends StatelessWidget {
  AttatchmentViewer({
    super.key,
    required String? firstImageUrl,
  }) : _firstImageUrl = firstImageUrl;

  final String? _firstImageUrl;
  var controller = PhotoViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attachment'),
        // open in url luncher
        actions: [
          ElevatedButton.icon(
            onPressed: () async {
              if (_firstImageUrl != null) {
                await launchUrl(Uri.parse(_firstImageUrl!));
              }
            },
            icon: const Icon(FluentIcons.image_24_regular),
            label: const Text('Open'),
          ),
        ],
      ),
      body: Stack(
        children: [
          PhotoView(
              enableRotation: true,
              controller: controller,
              imageProvider: NetworkImage(
                _firstImageUrl!,
              )),
          // toolbar
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: const EdgeInsets.only(bottom: 24),
              color: Colors.black.withOpacity(0.5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.rotation -= pi / 2;
                    },
                    icon: const Icon(FluentIcons.arrow_rotate_counterclockwise_24_regular),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.rotation += pi / 2;
                    },
                    icon: const Icon(FluentIcons.arrow_rotate_clockwise_16_regular),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
