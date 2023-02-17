// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, non_constant_identifier_names
import 'package:bill_management/Page/editpage.dart';
import 'package:flutter/material.dart';
import 'package:bill_management/etc/etc.dart';
import 'package:bill_management/models/transaction.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Transaction data;
  const DetailPage(int index, this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    int Ediff = unitdiff(data.Ecurrent, data.Eprevious);
    int Wdiff = unitdiff(data.Wcurrent, data.Wprevious);
    int Ebill = Calbill(Ediff, data.Eunit);
    int Wbill = Calbill(Wdiff, data.Wunit);
    int Total = TotalBill(Ebill, Wbill);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ข้อมูล'),
        backgroundColor: Colors.brown[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ห้อง ${data.room}',
              style: getTextstyle(30),
            ),
            Row(
              children: [
                const Icon(Icons.person),
                getSizedBox(0, 10),
                Text(
                  data.name,
                  style: getTextstyle(20),
                ),
              ],
            ),
            getSizedBox(10, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_month_outlined),
                getSizedBox(0, 10),
                Text(
                  'วันที่บันทึก : ${DateFormat('dd-MM-yyyy').format(data.date)}',
                  style: getTextstyle(20),
                ),
              ],
            ),
            getSizedBox(10, 0),
            Column(
              children: [
                Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  border: TableBorder.all(width: 1, color: Colors.black),
                  children: [
                    TableRow(children: [
                      const Text(' '),
                      paddingfortable('ไฟฟ้า', 20),
                      paddingfortable('น้ำ', 20),
                    ]),
                    TableRow(children: [
                      paddingfortable('   ก่อน\n(หน่วย)', 18),
                      paddingfortable('${data.Eprevious}', 18),
                      paddingfortable('${data.Wprevious}', 18),
                    ]),
                    TableRow(children: [
                      paddingfortable('   หลัง\n(หน่วย)', 18),
                      paddingfortable('${data.Ecurrent}', 18),
                      paddingfortable('${data.Wcurrent}', 18),
                    ]),
                    TableRow(children: [
                      paddingfortable(' ผลต่าง\n(หน่วย)', 18),
                      paddingfortable('$Ediff', 18),
                      paddingfortable('$Wdiff', 18),
                    ]),
                    TableRow(children: [
                      paddingfortable('หน่วยละ\n  (บาท)', 18),
                      paddingfortable('${data.Eunit}', 18),
                      paddingfortable('${data.Wunit}', 18),
                    ]),
                    TableRow(children: [
                      paddingfortable('บิลแยก\n (บาท)', 18),
                      paddingfortable('$Ebill', 18),
                      paddingfortable('$Wbill', 18),
                    ]),
                  ],
                ),
                getSizedBox(20, 0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wallet),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'รวมทั้งสิ้น = $Total บาท',
                  style: getTextstyle(20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
