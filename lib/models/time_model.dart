import 'package:flutter/foundation.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeModel extends ChangeNotifier {
  tz.TZDateTime _scheduledTimeZoneDate;
  Duration _scheduledDurationDate;

  tz.TZDateTime get scheduledTimeZoneDate => _scheduledTimeZoneDate;
  Duration get scheduledDurationDate => _scheduledDurationDate;

  tz.TZDateTime durationToTimeZoneDate(duration) {
    var now = tz.TZDateTime.now(tz.local);
    return now.add(duration);
  }

  void initializeTime() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
  }

  void saveTimeData(duration) async {
    initializeTime();
    tz.TZDateTime date = tz.TZDateTime.now(tz.local).add(duration);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('date', date.toIso8601String());
  }

  Future<void> loadTimeData() async {
    initializeTime();
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('date') != null) {
      String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
      tz.TZDateTime parsedTime = tz.TZDateTime.parse(
          tz.getLocation(currentTimeZone), prefs.getString('date'));
      _scheduledTimeZoneDate = parsedTime;
      _scheduledDurationDate =
          parsedTime.difference(tz.TZDateTime.now(tz.local));
      print('loaded $_scheduledDurationDate as the duration');
    }
    notifyListeners();
  }
}
