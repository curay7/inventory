import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'home_outstock_update.dart';

class HomeOutStock extends StatefulWidget {
  const HomeOutStock({super.key});

  @override
  State<HomeOutStock> createState() => _HomeOutStockState();
}

class _HomeOutStockState extends State<HomeOutStock> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

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
                              child: TextField(
                                controller:
                                    dateinput, //editing controller of this TextField
                                decoration: InputDecoration(
                                    icon: Icon(Icons
                                        .calendar_today), //icon of text field
                                    labelText:
                                        "Enter Date" //label text of field
                                    ),
                                readOnly:
                                    true, //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    //you can implement different kind of Date Format here according to your requirement

                                    setState(() {
                                      dateinput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                              ));
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
                TextButton(
                    onPressed: () {
                      Get.to(HomeOutstockUpdate());
                    },
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color(0xFF5F5FA7).withOpacity(0.53),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 97, 97, 143),
                            Color.fromARGB(255, 75, 75, 112)
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.28),
                            blurRadius: 30,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
