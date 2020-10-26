import '../main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationModel extends ChangeNotifier {
  Duration duration;
  NotificationModel({this.duration});

  void scheduleNotification(Duration duration) async {
    print('notification scheduled');
    tz.initializeTimeZones();
    var scheduledDate = tz.TZDateTime.now(tz.local).add(duration);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('notification'),
      largeIcon: DrawableResourceAndroidBitmap('kitten_small'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'notification.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Sourdough Baker',
        'Time for the next step!', scheduledDate, platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void cancelNotification() async {
    print('notification canceled');
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}