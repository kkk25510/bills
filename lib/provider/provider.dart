import 'package:bill_management/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TransactionProvider with ChangeNotifier {
  final Box<Transaction> _box = Hive.box<Transaction>('transaction');
  List<Transaction> get transaction => _box.values.toList();

  void addrecord(Transaction transaction) {
    _box.add(transaction);
    notifyListeners();
  }

  void editrecord(int key, Transaction transaction) {
    _box.putAt(key, transaction);
    notifyListeners();
  }

  void deleterecord(int index) {
    _box.deleteAt(index);
    notifyListeners();
  }

  Transaction getrecord(int index) {
    return transaction[index];
  }
}
