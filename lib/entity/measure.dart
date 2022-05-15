import 'package:dart_periphery/dart_periphery.dart';
import 'package:intl/intl.dart';
import 'package:sqlite3/sqlite3.dart';

class Measure {
  late final int? id;
  late final DateTime date;
  late final double temperature;
  late final double humidity;
  late final double pressure;
  final DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss');
  final DateFormat outputFormat = DateFormat('dd.MM.yyyy HH:mm');

  Measure(
      {this.id,
      required this.date,
      required this.temperature,
      required this.humidity,
      required this.pressure});

  factory Measure.fromBME(BME280result result) => Measure(
      date: DateTime.now(),
      temperature: result.temperature,
      humidity: result.humidity,
      pressure: result.pressure * 0.750061578180);

  factory Measure.fromRow(Row row) => Measure(
      id: row['id'],
      date: DateTime.parse(row['date']),
      temperature: row['temperature'],
      pressure: row['pressure'],
      humidity: row['humidity']);

  @override
  String toString() => 'Measure:\nD: ${outputFormat.format(date)}, '
      'T: $temperature°C, '
      'H: ${humidity.toStringAsFixed(2)}%, '
      'P: ${pressure.toStringAsFixed(2)} mmHg.';

  String toSqlValues() =>
      '("${formatter.format(date)}", $temperature, $humidity, $pressure)';
}
