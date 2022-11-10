import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class HomeOutStock extends StatefulWidget {
  const HomeOutStock({super.key});

  @override
  State<HomeOutStock> createState() => _HomeOutStockState();
}

class _HomeOutStockState extends State<HomeOutStock> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(70),
        child: SizedBox(
          width: 600,
          height: 400,
          child: FormBuilder(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FormBuilderField<String?>(
                        name: 'name',
                        onChanged: (val) => debugPrint(val.toString()),
                        builder: (FormFieldState field) {
                          return CupertinoFormRow(
                            prefix: const Text('Warehouse : '),
                            error: field.errorText != null
                                ? Text(field.errorText!)
                                : null,
                            child: CupertinoTextField(
                              onChanged: (value) => field.didChange(value),
                            ),
                          );
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (valueCandidate) {
                          if (valueCandidate?.isEmpty ?? true) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: FormBuilderField<String?>(
                        name: 'name',
                        onChanged: (val) => debugPrint(val.toString()),
                        builder: (FormFieldState field) {
                          return CupertinoFormRow(
                            prefix: const Text('On Date: '),
                            error: field.errorText != null
                                ? Text(field.errorText!)
                                : null,
                            // child: CupertinoTextField(
                            //   onChanged: (value) => field.didChange(value),
                            // ),
                            child: DateTimePicker(
                              initialValue: '',
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                              dateLabelText: 'Date',
                              onChanged: (val) => print(val),
                              validator: (val) {
                                print(val);
                                return null;
                              },
                              onSaved: (val) => print(val),
                            ),
                          );
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (valueCandidate) {
                          if (valueCandidate?.isEmpty ?? true) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FormBuilderField<String?>(
                        name: 'name',
                        onChanged: (val) => debugPrint(val.toString()),
                        builder: (FormFieldState field) {
                          return CupertinoFormRow(
                            prefix: const Text('Direction: '),
                            error: field.errorText != null
                                ? Text(field.errorText!)
                                : null,
                            child: CupertinoTextField(
                              onChanged: (value) => field.didChange(value),
                            ),
                          );
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (valueCandidate) {
                          if (valueCandidate?.isEmpty ?? true) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: FormBuilderField<String?>(
                        name: 'name',
                        onChanged: (val) => debugPrint(val.toString()),
                        builder: (FormFieldState field) {
                          return CupertinoFormRow(
                            prefix: const Text('Delivery By: '),
                            error: field.errorText != null
                                ? Text(field.errorText!)
                                : null,
                            child: CupertinoTextField(
                              onChanged: (value) => field.didChange(value),
                            ),
                          );
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (valueCandidate) {
                          if (valueCandidate?.isEmpty ?? true) {
                            return 'This field is required.';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),

                FormBuilderField<String?>(
                  name: 'name',
                  onChanged: (val) => debugPrint(val.toString()),
                  builder: (FormFieldState field) {
                    return CupertinoFormRow(
                      prefix: const Text('Note: '),
                      error: field.errorText != null
                          ? Text(field.errorText!)
                          : null,
                      child: SizedBox(
                        height: 70,
                        child: CupertinoTextField(
                          onChanged: (value) => field.didChange(value),
                        ),
                      ),
                    );
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (valueCandidate) {
                    if (valueCandidate?.isEmpty ?? true) {
                      return 'This field is required.';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      width: 200,
                      height: 30,
                      child: Center(child: Text("TEST")),
                    ))
                // const SizedBox(height: 10),
                // FormBuilderField<bool>(
                //   name: 'terms',
                //   builder: (FormFieldState field) {
                //     return InputDecorator(
                //       decoration: InputDecoration(
                //         labelText: 'Terms',
                //         errorText: field.errorText,
                //       ),
                //       child: CheckboxListTile(
                //         title: const Text('I Accept the terms and conditions'),
                //         controlAffinity: ListTileControlAffinity.leading,
                //         value: false,
                //         onChanged: (value) => field.didChange(value),
                //       ),
                //     );
                //   },
                //   validator: (valueCandidate) {
                //     if (valueCandidate != true) {
                //       return 'Accept terms and conditions to continue.';
                //     }
                //     return null;
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
