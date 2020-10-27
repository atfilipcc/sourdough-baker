import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/nine_to_five_screen.dart';
import 'screens/speedbake_screen.dart';
import './screens/choose_schedule.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import './screens/night_baker_screen.dart';
import './screens/calculator_screen.dart';
import './models/timer_model.dart';
import './models/notification_model.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('kitten_small');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });
  runApp(SourdoughBaker());
}

class SourdoughBaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TimerModel>(create: (_) => TimerModel()),
        ChangeNotifierProvider<NotificationModel>(
            create: (_) => NotificationModel()),
      ],
      child: MaterialApp(
        title: 'Sourdough Baker',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          ChooseSchedule.id: (context) => ChooseSchedule(),
          CalculatorScreen.id: (context) => CalculatorScreen(),
          SpeedbakeScreen.id: (context) => SpeedbakeScreen(),
          NineToFiveScreen.id: (context) => NineToFiveScreen(),
          NightBakerScreen.id: (context) => NightBakerScreen(),
        },
      ),
    );
  }
}
