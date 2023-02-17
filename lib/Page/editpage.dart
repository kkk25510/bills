// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bill_management/models/transaction.dart';
import 'package:bill_management/provider/provider.dart';
import '../etc/etc.dart';

class EditPage extends StatefulWidget {
  final Transaction data;
  final int index;
  EditPage(
    Key? key,
    this.data,
    this.index,
  ) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController nameContoller = TextEditingController();
    TextEditingController roomContoller = TextEditingController();
    TextEditingController EcurContoller = TextEditingController();
    TextEditingController EpreContoller = TextEditingController();
    TextEditingController WpreContoller = TextEditingController();
    TextEditingController WcurContoller = TextEditingController();
    TextEditingController EunitContoller = TextEditingController();
    TextEditingController WunitContoller = TextEditingController();
    nameContoller.text = widget.data.name;
    roomContoller.text = widget.data.room;
    EcurContoller.text = widget.data.Ecurrent.toString();
    EpreContoller.text = widget.data.Eprevious.toString();
    WpreContoller.text = widget.data.Wprevious.toString();
    WcurContoller.text = widget.data.Wcurrent.toString();
    EunitContoller.text = widget.data.Eunit.toString();
    WunitContoller.text = widget.data.Wunit.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไข ${widget.data.name}'),
        backgroundColor: Colors.brown[300],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: double.maxFinite,
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  getSizedBox(30, 0),
                  Text(
                    'แก้ไข ${widget.data.name}',
                    style: getTextstyle(25),
                  ),
                  getSizedBox(20, 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ห้อง',
                        style: getTextstyle(20),
                      ),
                      getSizedBox(5, 0),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.multiline,
                        controller: roomContoller,
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
                        controller: nameContoller,
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
                              controller: EpreContoller,
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
                              controller: EcurContoller,
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
                              controller: EunitContoller,
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
                              controller: WpreContoller,
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
                              controller: WcurContoller,
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
                              controller: WunitContoller,
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
                  getSizedBox(15, 0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[400]),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          widget.data.name = nameContoller.text;
                          widget.data.room = roomContoller.text;
                          widget.data.Ecurrent = int.parse(EcurContoller.text);
                          widget.data.Eprevious = int.parse(EpreContoller.text);
                          widget.data.Eunit = int.parse(EunitContoller.text);
                          widget.data.Wcurrent = int.parse(WcurContoller.text);
                          widget.data.Wprevious = int.parse(WpreContoller.text);
                          widget.data.Wunit = int.parse(WunitContoller.text);

                          var provider = Provider.of<TransactionProvider>(
                              context,
                              listen: false);
                          provider.editrecord(widget.index, widget.data);
                          print('what index ${widget.index}');
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
      ),
    );
  }
}
