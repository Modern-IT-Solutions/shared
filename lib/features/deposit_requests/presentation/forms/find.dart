// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:core/features/users/presentation/find.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_json_view/flutter_json_view.dart';
import 'package:lib/lib.dart';
import 'package:photo_view/photo_view.dart';
import 'package:recase/recase.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:shared/shared.dart';
import 'package:url_launcher/url_launcher.dart';
// exif
import 'package:exif/exif.dart';
import "package:exifdart/exifdart.dart";
import 'dart:typed_data'; // For handling bytes
import 'package:http/http.dart' as http; // For fetching image from the URL
import 'package:image/image.dart' as img; // For image processing



import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';



// Function to get EXIF data from an image URL
Future<Map<String, IfdTag>?> fetchExifFromUrl(String imageUrl) async {
  try {
    // Download the image as bytes
    final response = await http.get(Uri.parse(imageUrl));
    
    if (response.statusCode == 200) {
      // Get the image bytes
      Uint8List imageBytes = response.bodyBytes;

      // Decode the image using the 'image' package
      // img.Image? image = img.decodeImage(imageBytes);

        // Extract EXIF data from the image
        final exifData = await readExifFromBytes(imageBytes);
        return exifData;
    } else {
      print("Failed to download image.");
    }
  } catch (e) {
    print("Error: $e");
  }
}


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
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 240,
                floating: true,
                excludeHeaderSemantics: true,
                forceElevated: true,
                primary: true,
                snap: false,
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
                                  image: CachedNetworkImageProvider(
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
                              Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
                              Theme.of(context).colorScheme.onPrimary.withOpacity(0.1),
                              Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
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
                            TabBar(
                              tabs: [
                                Tab(
                                  icon: const Icon(FluentIcons.info_24_regular),
                                  text: 'Deposit Info',
                                ),
                                Tab(
                                  icon: const Icon(FluentIcons.person_24_regular),
                                  text: 'Profile',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
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
                    // copy
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.amount.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(FluentIcons.person_24_regular),
                          contentPadding: EdgeInsetsDirectional.only(start: 24),
                          visualDensity: const VisualDensity(vertical: -3),
                          title: depositRequest?.firstName == null ? const TextPlaceholder() : Text(depositRequest!.firstName!),
                          subtitle: const Text(
                            'FirstName',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              tryCopy(context, depositRequest?.firstName);
                            },
                            icon: const Icon(FluentIcons.copy_24_regular),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(FluentIcons.person_24_regular),
                          contentPadding: EdgeInsetsDirectional.only(end: 24),
                          visualDensity: const VisualDensity(vertical: -3),
                          title: depositRequest?.lastName == null ? const TextPlaceholder() : Text(depositRequest!.lastName!),
                          subtitle: const Text(
                            'LastName',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              tryCopy(context, depositRequest?.lastName);
                            },
                            icon: const Icon(FluentIcons.copy_24_regular),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.phoneNumber);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
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
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.address);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
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
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.note);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // created at
                  ListTile(
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
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.createdAt.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ListTile(
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
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, depositRequest?.updatedAt.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // updated at
                  const SizedBox(height: 24),
                ],
              ),
              SingleChildScrollView(child: ProfileSummary(model: depositRequest?.profile)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _accept() async {
    var amount = TextEditingController(text: depositRequest?.amount.toString());
    bool loading = false;
    var result = await showDialog(
      useRootNavigator: false,
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
                  errorText: depositRequest!.amount.toInt() > 9999 ? "This amount may too big" : null,
                ),
                keyboardType: TextInputType.number,
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
                    : const Icon(FluentIcons.checkmark_24_regular),
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
    if (result != null) Navigator.of(context).pop(result);
  }

  Future<void> _reject() async {
    var reason = TextEditingController();
    bool loading = false;
    var result = await showDialog(
      context: context,
      useRootNavigator: false,
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
                          widget.onRejected?.call(depositRequest!.copyWith(status: DepositRequestStatus.rejected, updatedAt: DateTime.now(), metadata: {
                            ...depositRequest!.metadata,
                            'reason': reason.text,
                          }));
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

    if (result != null) Navigator.of(context).pop(result);
  }
}

class AttatchmentViewer extends StatefulWidget {
  AttatchmentViewer({
    super.key,
    required String? firstImageUrl,
  }) : _firstImageUrl = firstImageUrl;

  final String? _firstImageUrl;

  @override
  State<AttatchmentViewer> createState() => _AttatchmentViewerState();
}

class _AttatchmentViewerState extends State<AttatchmentViewer> {
  var controller = PhotoViewController();

  // exif data
  Map<String, IfdTag>?  exifMetadata = null;

  // load exif 
  Future<void> loadExif() async {
    if (widget._firstImageUrl == null) return;
    if (Platforms.isWeb != true) return;
    // load image
    print("loading exif");
    exifMetadata = await fetchExifFromUrl(widget._firstImageUrl!);
    print(exifMetadata);
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    loadExif();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attachment'),
        // open in url luncher
        actions: [
          if (exifMetadata != null)
          IconButton(
            onPressed: () async {
              // open dailog for exif data in table
              await showModalBottomSheet(
                context: context, 
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var item in exifMetadata!.entries)
                        ListTile(
                          title: Text(item.value.toString()),
                          subtitle: Text(item.key),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text("Okey"),
                        ),
                      ],
                    ),
                  );
                }
              );
            },
            icon: const Icon(FluentIcons.info_16_regular),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              if (widget._firstImageUrl != null) {
                await launchUrl(Uri.parse(widget._firstImageUrl!));
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
              imageProvider: CachedNetworkImageProvider(
                widget._firstImageUrl!,
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

class CompereAttatchmentViewer extends StatelessWidget {
  final List<String> images;
  const CompereAttatchmentViewer({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    // depending on orientation use row or column
    return Flex(
      direction: MediaQuery.of(context).orientation == Orientation.portrait ? Axis.vertical : Axis.horizontal,
      children: [
        for (var image in images)
          Expanded(
            child: ClipRect(
              clipBehavior: Clip.antiAlias,
              child: AttatchmentViewer(
                firstImageUrl: image,
              ),
            ),
          ),
      ],
    );
  }
}

/// [FindGiftCardOrderForm] is a form to update a new user
class FindGiftCardOrderForm extends StatefulWidget {
  final String id;
  final GiftCardOrderModel? giftCardOrder;
  final VoidCallback? onCancel;
  final void Function(GiftCardOrderModel? giftCardOrder)? onFinded;
  // on accept
  final void Function(GiftCardOrderModel giftCardOrder)? onAccepted;
  // on reject
  final void Function(GiftCardOrderModel giftCardOrder)? onRejected;

  final List<Widget> actions;
  const FindGiftCardOrderForm({
    Key? key,
    this.onFinded,
    this.onAccepted,
    this.onRejected,
    this.onCancel,
    required this.id,
    required this.giftCardOrder,
    this.actions = const [],
  }) : super(key: key);

  @override
  State<FindGiftCardOrderForm> createState() => _FindGiftCardOrderFormState();
}

class _FindGiftCardOrderFormState extends State<FindGiftCardOrderForm> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  late String? _error;
  GiftCardOrderModel? giftCardOrder;
  @override
  void initState() {
    super.initState();
    giftCardOrder = widget.giftCardOrder;
    if (giftCardOrder == null) {
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
      try {
        giftCardOrder = GiftCardOrderModel.fromJson((await getDocument(path: "giftCardOrders/${widget.id}"))!.data);
        widget.onFinded?.call(giftCardOrder);
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
    return giftCardOrder?.profile?.photoUrl.nullIfEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: _loading,
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 240,
                floating: true,
                excludeHeaderSemantics: true,
                forceElevated: true,
                primary: true,
                snap: false,
                stretch: true,
                stretchTriggerOffset: 100,
                title: Text('Order #${widget.giftCardOrder?.shortId}'),
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
                                  image: CachedNetworkImageProvider(
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
                              Theme.of(context).colorScheme.background.withOpacity(0.8),
                              Theme.of(context).colorScheme.background.withOpacity(0.1),
                              Theme.of(context).colorScheme.background.withOpacity(0.5),
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
                            TabBar(
                              tabs: [
                                Tab(
                                  icon: const Icon(FluentIcons.info_24_regular),
                                  text: 'Order info',
                                ),
                                Tab(
                                  icon: const Icon(FluentIcons.person_24_regular),
                                  text: 'Profile',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView(
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
                        color: giftCardOrder?.status.color,
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
                    title: giftCardOrder?.status == null ? const TextPlaceholder() : Text(giftCardOrder!.status.name.pascalCase),
                    subtitle: Text(
                      (giftCardOrder?.metadata['reason'] ?? "Status"),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: Row
                        // Accept and Reject buttons
                        (
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Accept button
                        // IconButton(
                        //   onPressed: _accept,
                        //   icon: const Icon(FluentIcons.checkmark_24_regular),
                        // ),
                        // Reject button
                        // IconButton(
                        //   onPressed: _reject,
                        //   icon: const Icon(FluentIcons.dismiss_24_regular),
                        // ),
                        // open in external browser
                        // https://console.firebase.google.com/u/0/project/zed-academy-a9e43/firestore/data/~2FgiftCardOrders~[id]
                        IconButton(
                          onPressed: () async {
                            if (giftCardOrder != null) {
                              await launchUrl(Uri.parse('https://console.firebase.google.com/u/0/project/zed-academy-a9e43/firestore/data/~2FgiftCardOrders~2F${giftCardOrder!.id}'));
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
                    title: giftCardOrder?.amount == null ? const TextPlaceholder() : Text("${giftCardOrder!.amount}"),
                    subtitle: const Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    // copy
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, giftCardOrder?.amount.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: const Icon(FluentIcons.person_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: giftCardOrder?.shipping.name == null ? const TextPlaceholder() : Text(giftCardOrder!.shipping.name!),
                    subtitle: const Text(
                      'Full Name',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, giftCardOrder?.shipping.name);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  for (String phoneNumber in giftCardOrder?.shipping.phoneNumbers ?? [])
                    ListTile(
                      onTap: () async {
                        if (giftCardOrder != null) {
                          await launchUrl(Uri.parse('tel:$phoneNumber'));
                        }
                      },
                      leading: const Icon(FluentIcons.phone_20_regular),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                      visualDensity: const VisualDensity(vertical: -3),
                      title: phoneNumber.isEmpty ? DataFlagWidget.empty() : Text(phoneNumber),
                      subtitle: const Text(
                        'Phone',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          tryCopy(context, phoneNumber);
                        },
                        icon: const Icon(FluentIcons.copy_24_regular),
                      ),
                    ),
                  ListTile(
                    leading: const Icon(FluentIcons.location_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: giftCardOrder?.shipping.address == null ? const TextPlaceholder() : Text(giftCardOrder!.shipping.address.raw),
                    subtitle: Text(
                      'Address' + '${giftCardOrder?.shipping.address.state} ${giftCardOrder?.shipping.address.city}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, "${giftCardOrder?.shipping.address.raw} | ${giftCardOrder?.shipping.address.state} | ${giftCardOrder?.shipping.address.city}");
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(FluentIcons.note_24_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: giftCardOrder?.note == null ? const TextPlaceholder() : Text("${giftCardOrder!.note}"),
                    subtitle: const Text(
                      'Note',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, giftCardOrder?.note);
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(jsonEncode(giftCardOrder?.metadata ?? {})),
                    ),
                  ),
                  // created at
                  ListTile(
                    leading: const Icon(FluentIcons.calendar_20_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: giftCardOrder?.updatedAt == null ? const TextPlaceholder() : Text("${giftCardOrder!.createdAt}", maxLines: 1, overflow: TextOverflow.ellipsis),
                    subtitle: const Text(
                      'Created At',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, giftCardOrder?.createdAt.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(FluentIcons.calendar_20_regular),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                    visualDensity: const VisualDensity(vertical: -3),
                    title: giftCardOrder?.updatedAt == null ? const TextPlaceholder() : Text("${giftCardOrder!.updatedAt}", maxLines: 1, overflow: TextOverflow.ellipsis),
                    subtitle: const Text(
                      'Last Update at',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        tryCopy(context, giftCardOrder?.updatedAt.toString());
                      },
                      icon: const Icon(FluentIcons.copy_24_regular),
                    ),
                  ),
                  // updated at
                  const SizedBox(height: 24),
                ],
              ),
              SingleChildScrollView(child: ProfileSummary(model: giftCardOrder?.profile)),
            ],
          ),
        ),
      ),
    );
  }
}
