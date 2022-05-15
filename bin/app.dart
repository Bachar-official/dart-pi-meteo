import 'dart:async';

import 'package:dart_periphery/dart_periphery.dart';
import 'package:pi_dart_app/dbHandler/db_handler.dart';
import 'package:pi_dart_app/entity/measure.dart';
import 'package:sqlite3/sqlite3.dart';

void main(List<String> arguments) {
  setCustomLibrary('/home/pi/database/libperiphery_arm.so');
  print('Custom library loaded.');
  var i2c = I2C(1);
  final Database db = sqlite3.open('/home/pi/database/measures.db');
  print('Database initialized.');
  final Duration duration = Duration(minutes: 5);
  final dbHandler = DBHandler(database: db);

  try {
    BME280 sensor = BME280(i2c);
    print('BME 280 sensor initialized.');
    BME280result result = sensor.getValues();
    Measure measure = Measure.fromBME(result);
    print(measure);
    dbHandler.addMeasure(measure);
    Timer.periodic(duration, (Timer t) {
      BME280result result = sensor.getValues();
      Measure measure = Measure.fromBME(result);
      print(measure);
      dbHandler.addMeasure(measure);
    });
  } catch (e, s) {
    print('ERROR: $e, stacktrace: $s');
  }
}
