// ignore_for_file: non_constant_identifier_names
import 'package:bill_management/etc/etc.dart';
import 'package:bill_management/models/transaction.dart';
import 'package:bill_management/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  TextEditingController? controller;
  final _form_key = GlobalKey<FormState>();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? roomController = TextEditingController();
  TextEditingController? ecurrentController = TextEditingController();
  TextEditingController? wcurrentController = TextEditingController();
  TextEditingController? epreController = TextEditingController();
  TextEditingController? wpreController = TextEditingController();
  TextEditingController? powerunitController = TextEditingController();
  TextEditingController? waterunitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มบิล'),
        backgroundColor: Colors.brown[300],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                getSizedBox(30, 0),
                Text(
                  'เพิ่มบิลค่าน้ำค่าไฟ',
                  style: getTextstyle(25),
                ),
                getSizedBox(20, 0),
                Form(
                  key: _form_key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ห้อง',
                        style: getTextstyle(20),
                      ),
                      getSizedBox(5, 0),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        controller: roomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'โปรดระบุ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder:
                                getOutlineInputBorder(3, Colors.brown, 20),
                            focusedBorder:
                                getOutlineInputBorder(3, Colors.brown, 20),
                            errorBorder:
                                getOutlineInputBorder(3, Colors.red, 20),
                            hintText: 'เลขห้อง',
                            label: Text(
                              'ห้อง',
                              style: getTextstyle(18),
                            )),
                      ),
                      getSizedBox(5, 0),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'โปรดระบุ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder:
                                getOutlineInputBorder(3, Colors.brown, 20),
                            focusedBorder:
                                getOutlineInputBorder(3, Colors.brown, 20),
                            errorBorder:
                                getOutlineInputBorder(3, Colors.red, 20),
                            hintText: 'ชื่อ',
                            label: Text(
                              'ชื่อ',
                              style: getTextstyle(18),
                            )),
                      ),
                      getSizedBox(10, 0),
                      getSizedBox(15, 0),
                      Text(
                        'ไฟฟ้า',
                        style: getTextstyle(20),
                      ),
                      getSizedBox(5, 0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: epreController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'หน่วย',
                                  label: Text(
                                    'ก่อน',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                          getSizedBox(0, 3),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: ecurrentController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'หน่วย',
                                  label: Text(
                                    'หลัง',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                          getSizedBox(0, 3),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: powerunitController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'บาท',
                                  label: Text(
                                    'ราคาต่อหน่วย',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      getSizedBox(15, 0),
                      Text(
                        'น้ำ',
                        style: getTextstyle(20),
                      ),
                      getSizedBox(5, 0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: wpreController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'หน่วย',
                                  label: Text(
                                    'ก่อน',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                          getSizedBox(0, 3),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: wcurrentController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'หน่วย',
                                  label: Text(
                                    'หลัง',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                          getSizedBox(0, 3),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: waterunitController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'โปรดระบุ';
                                }
                                if (int.parse(value) <= 0) {
                                  return 'ระบุใหม่';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabledBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  focusedBorder: getOutlineInputBorder(
                                      3, Colors.brown, 20),
                                  errorBorder:
                                      getOutlineInputBorder(3, Colors.red, 20),
                                  hintText: 'บาท',
                                  label: Text(
                                    'ราคาต่อหน่วย',
                                    style: getTextstyle(18),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getSizedBox(15, 0),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[400]),
                    onPressed: () {
                      if (_form_key.currentState!.validate()) {
                        var room = roomController!.text;
                        var name = nameController!.text;
                        var Eprevious = epreController!.text;
                        var Ecurrent = ecurrentController!.text;
                        var Eunit = powerunitController!.text;
                        var Wprevious = wpreController!.text;
                        var Wcurrent = wcurrentController!.text;
                        var Wunit = waterunitController!.text;

                        Transaction record = Transaction(
                            name: name,
                            room: room,
                            Ecurrent: int.parse(Ecurrent),
                            Eprevious: int.parse(Eprevious),
                            Eunit: int.parse(Eunit),
                            Wcurrent: int.parse(Wcurrent),
                            Wprevious: int.parse(Wprevious),
                            Wunit: int.parse(Wunit),
                            date: DateTime.now());

                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);
                        provider.addrecord(record);

                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'บันทึก',
                      style: getTextstyle(20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
