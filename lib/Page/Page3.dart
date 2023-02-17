// ignore_for_file: file_names, non_constant_identifier_names, unused_local_variable
import 'package:bill_management/Page/DetailPage.dart';
import 'package:bill_management/Page/addpage.dart';
import 'package:bill_management/Page/editpage.dart';
import 'package:bill_management/etc/etc.dart';
import 'package:bill_management/models/transaction.dart';
import 'package:bill_management/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: const Text('จัดการบิล'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Textfield())));
        },
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, _) {
          return ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: provider.transaction.length,
              itemBuilder: (context, index) {
                final Transaction data = provider.transaction[index];
                int Ediff = unitdiff(data.Ecurrent, data.Eprevious);
                int Wdiff = unitdiff(data.Wcurrent, data.Wprevious);
                int Ebill = Calbill(Ediff, data.Eunit);
                int Wbill = Calbill(Wdiff, data.Wunit);
                int Total = TotalBill(Ebill, Wbill);
                if (provider.transaction.isEmpty) {
                  return const Center(
                    child: Text(
                      'ว่าง',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  );
                } else {
                  return Card(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              data.room,
                              style: getTextstyle(18),
                            ),
                          ),
                          title: Row(
                            children: [
                              Text(
                                data.name,
                                style: getTextstyle(18),
                              ),
                              getSizedBox(0, 7),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('ไฟ $Ediff หน่วย',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                      Text(' | น้ำ $Wdiff หน่วย',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('รวม $Total บาท  | ',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                      Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(data.date),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditPage(key, data, index)));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showAlertDialog(context, index, data.name);
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(index, data),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ));
                }
              });
        },
      ),
    );
  }
}

Future<void> showAlertDialog(BuildContext context, index, name) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ลบข้อมูล $name'),
        content: Text('ต้องการลบข้อมูล $name ใช่หรือไม่'),
        actions: <Widget>[
          TextButton(
            child: const Text('ยกเลิก'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('ลบ'),
            onPressed: () {
              var provider =
                  Provider.of<TransactionProvider>(context, listen: false);

              provider.deleterecord(index);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
