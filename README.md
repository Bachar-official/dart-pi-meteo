# dart-pi-meteo
Simple Dart app for measuring meteo data from BME280 sensor and write it to SQLite database.
# Getting started
- Connect your BME280 sensor to Raspberry Pi.
- Install Dart SDK if necessary.
- Clone this repository.
- Rename your database as "measures.db" and move it to /home/pi/database.
- Copy "libperiphery_arm.so" file from assets directory also to /home/pi/database.
- Open /bin directory in current project on the terminal.
- Type ```dart compile exe app.dart```.
- After generating done, launch in with terminal.
- Enjoy.
