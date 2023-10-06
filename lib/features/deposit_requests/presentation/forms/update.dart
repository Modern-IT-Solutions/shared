// ignore_for_file: depend_on_referenced_packages

import 'package:core/core.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:lib/lib.dart';
import 'package:muskey/muskey.dart';
import 'package:shared/models/attachment_model.dart';
import 'package:shared/models/deposit_request_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/repositories/repository.dart';
import '../../domain/request/requests.dart';

/// [UpdateDepositRequestForm] is a form to update a new user
class UpdateDepositRequestForm extends StatefulWidget {
  final String ref;
  final DepositRequestModel depositRequest;
  final VoidCallback? onCancel;
  final Null Function(DepositRequestModel depositRequest)? onUpdated;
  const UpdateDepositRequestForm({Key? key, this.onUpdated, this.onCancel, required this.depositRequest, required this.ref}) : super(key: key);

  @override
  State<UpdateDepositRequestForm> createState() => _UpdateDepositRequestFormState();
}

class _UpdateDepositRequestFormState extends State<UpdateDepositRequestForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _amount = TextEditingController();
  final _state = TextEditingController();
  // municipal
  final _municipal = TextEditingController();
  final _address = TextEditingController();
  // reference
  final _reference = TextEditingController();
  // PaymentMethod
  final _method = ValueNotifier<PaymentMethod>(PaymentMethod.ccp);
  // note
  final _note = TextEditingController();
  final _attachment = ValueNotifier<AttachmentModel?>(null);

  bool _loading = false;
  String? _error = null;
  Map<String, String> _errors = {};

  @override
  void initState() {
    _firstName.text = widget.depositRequest.firstName ?? '';
    _lastName.text = widget.depositRequest.lastName ?? '';
    _phoneNumber.text = widget.depositRequest.phoneNumber ?? '';
    _amount.text = widget.depositRequest.amount.toString();
    _state.text = widget.depositRequest.state ?? '';
    _municipal.text = widget.depositRequest.municipal ?? '';
    _address.text = widget.depositRequest.address ?? '';
    _reference.text = widget.depositRequest.reference ?? '';
    _method.value = widget.depositRequest.method;
    _note.text = widget.depositRequest.note ?? '';
    _attachment.value = widget.depositRequest.attachments?.first;

    super.initState();
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _errors = {};
        _error = null;
        _loading = true;
      });
      var updateRequest = DepositRequestUpdateRequest(
          id: widget.depositRequest.id,
          firstName: _firstName.text.nullIfEmpty,
          lastName: _lastName.text.nullIfEmpty,
          phoneNumber: _phoneNumber.text.nullIfEmpty,
          amount: double.parse(_amount.text),
          state: _state.text.nullIfEmpty,
          municipal: _municipal.text.nullIfEmpty,
          address: _address.text.nullIfEmpty,
          reference: _reference.text.nullIfEmpty,
          method: _method.value,
          note: _note.text.nullIfEmpty,
          attachments: (_attachment.value == null)
              ? null
              : [
                  _attachment.value!
                ]);
      try {
        await DepositRequestRepository.instance.update(updateRequest);
        widget.onUpdated?.call(widget.depositRequest.copyWith(
            // name: _nameController.text,
            // address: Address(
            //   raw: _addressController.text,
            //   location: _location.value ?? const GeoFirePoint(GeoPoint(0, 0)),
            // ),
            // email: _emailController.text,
            // photoUrl: _photoUrlController.text,
            // phoneNumbers: _phoneNumbers.value,
            // technicians: [],// _technicians.value,
            ));
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

  @override
  Widget build(BuildContext context) {
    return LoadingBox(
      loading: _loading,
      child: Column(
        children: [
          // show error if not null, in box with red background rounded corners and icon and dismiss button
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

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 200,
                  floating: true,
                  excludeHeaderSemantics: true,
                  forceElevated: true,
                  primary: true,
                  snap: true,
                  stretch: true,
                  stretchTriggerOffset: 100,
                  title: const Text('تحديث طلب إيداع'),
                  leading: const BackButton(),
                  actions: [
                    TextButton.icon(
                      onPressed: () async {
                        await _submit();
                      },
                      label: const Text('تحديث'),
                      icon: const Icon(FluentIcons.checkmark_24_regular),
                    ),
                    const SizedBox(width: 12),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: _attachment.value?.src == null
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(
                                      _attachment.value!.src,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
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
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    if (_attachment.value?.src != null) {
                                      await launchUrl(Uri.parse(_attachment.value!.src));
                                    }
                                  },
                                  icon: const Icon(FluentIcons.image_24_regular),
                                  label: const Text('عرض الصورة'),
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
                  child: Center(
                    child: ConstrainedBox(
                      /// max width is 600
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 20),

                            const ListTile(
                              leading: Icon(FluentIcons.gas_pump_24_regular),
                              contentPadding: EdgeInsets.symmetric(horizontal: 24),
                              visualDensity: VisualDensity(vertical: -3),
                              title: Text("طلب إيداع رقم"),
                              enabled: false,
                            ),

                            /// photo url
                            // AppTextFormField.upload(
                            //   controller: TextEditingController(text: _attachment.value?.src),
                            //   margin: const EdgeInsets.symmetric(horizontal: 24),
                            //   validator: FormBuilderValidators.compose([
                            //     FormBuilderValidators.url(),
                            //     FormBuilderValidators.required(),
                            //   ]),
                            //   onSubmitted: (v) {
                            //     _attachment.value = AttachmentModel(
                            //       uploadBy: FirebaseAuth.instance.currentUser!.uid,
                            //       mimeType: 'unknown',
                            //       name: 'unknown',
                            //       src: v,
                            //     );
                            //   },
                            //   decoration: InputDecoration(
                            //     errorText: _errors['photoUrl'],
                            //     prefixIcon: const Icon(FluentIcons.image_28_regular),
                            //     label: const Text('صورة الإيصال'),
                            //     alignLabelWithHint: true,
                            //     helperText: 'مطلوب',
                            //   ),
                            // ),
                            const SizedBox(height: 10),

                            /// first name
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _firstName,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['firstName'],
                                prefixIcon: const Icon(FluentIcons.person_24_regular),
                                label: const Text('الإسم'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب',
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// last name
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _lastName,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['lastName'],
                                prefixIcon: const Icon(FluentIcons.person_24_regular),
                                label: const Text('اللقب'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب',
                              ),
                            ),

                            /// amount
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _amount,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['amount'],
                                prefixIcon: const Icon(FluentIcons.money_24_regular),
                                label: const Text('المبلغ المطلوب'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب',
                              ),
                            ),

                            const SizedBox(height: 10),
                            // / phone number
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _phoneNumber,
                              inputFormatters: [
                                MuskeyFormatter(
                                  masks: [
                                    '##########'
                                  ],
                                  overflow: OverflowBehavior.forbidden(),
                                )
                              ],
                              validator: (v) {
                                if (v == null || v.isEmpty) return null;
                                var valicator = FormBuilderValidators.compose([
                                  // FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                  FormBuilderValidators.equalLength(10),
                                ]);
                                return valicator(v);
                              },
                              decoration: InputDecoration(
                                // border radius only for the left side
                                errorText: _errors['phone'],
                                prefixIcon: const Icon(FluentIcons.phone_24_regular),
                                label: const Text('رقم الهاتف'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب مع الصفر',
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// reference
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _reference,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['reference'],
                                prefixIcon: const Icon(FluentIcons.card_ui_20_filled),
                                label: const Text('رقم العملية'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب، موجود في ايصال الدفع',
                              ),
                            ),

                            const SizedBox(height: 10),

                            /// address
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _address,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['address'],
                                prefixIcon: const Icon(FluentIcons.location_24_regular),
                                label: const Text('العنوان'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب',
                              ),
                            ),

                            // note
                            const SizedBox(height: 10),
                            AppTextFormField(
                              margin: const EdgeInsets.symmetric(horizontal: 24),
                              controller: _note,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              decoration: InputDecoration(
                                errorText: _errors['note'],
                                prefixIcon: const Icon(FluentIcons.note_24_regular),
                                label: const Text('ملاحظات'),
                                alignLabelWithHint: true,
                                helperText: 'مطلوب',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
