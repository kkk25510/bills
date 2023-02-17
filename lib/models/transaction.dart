// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names
// ignore: camel_case_types
import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String room;

  @HiveField(2)
  int Ecurrent;

  @HiveField(3)
  int Eprevious;

  @HiveField(4)
  int Eunit;

  @HiveField(5)
  int Wcurrent;

  @HiveField(6)
  int Wprevious;

  @HiveField(7)
  int Wunit;

  @HiveField(8)
  DateTime date;

  Transaction({
    required this.name,
    required this.room,
    required this.Ecurrent,
    required this.Eprevious,
    required this.Eunit,
    required this.Wcurrent,
    required this.Wprevious,
    required this.Wunit,
    required this.date,
  });

  Transaction copyWith({
    String? name,
    String? room,
    int? Ecurrent,
    int? Eprevious,
    int? Eunit,
    int? Wcurrent,
    int? Wprevious,
    int? Wunit,
    DateTime? date,
  }) {
    return Transaction(
      name: name ?? this.name,
      room: room ?? this.room,
      Ecurrent: Ecurrent ?? this.Ecurrent,
      Eprevious: Eprevious ?? this.Eprevious,
      Eunit: Eunit ?? this.Eunit,
      Wcurrent: Wcurrent ?? this.Wcurrent,
      Wprevious: Wprevious ?? this.Wprevious,
      Wunit: Wunit ?? this.Wunit,
      date: date ?? this.date,
    );
  }
}
