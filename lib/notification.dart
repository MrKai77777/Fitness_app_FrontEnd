
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationServices{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings = const AndroidInitializationSettings('logo');

  void initializeNotification() async{
    InitializationSettings initializationSettings = InitializationSettings(
    android: _androidInitializationSettings,
    );

   await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotifiation(String title,String body) async{
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
       );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationsPlugin.show(
      0, 
      title,
      body,
      notificationDetails
      );
  }

  void scheduleNotifiation(String title,String body) async{
    AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
       );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    _flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      title,
      body,
      RepeatInterval.everyMinute,
      notificationDetails
      );
  }
}

  // static Future showBigTextNotification({var id = 0,required String title, required String body,
  // var payload,required FlutterLocalNotificationsPlugin fln
  // } ) async{
  //   AndroidNotificationDetails androidPlatformChannelSpecific = const AndroidNotificationDetails(
  //     'channelId',
  //      'channelname',
       
  //      playSound: true,
  //      sound: RawResourceAndroidNotificationSound('notification'),
  //      importance: Importance.max,
  //      priority: Priority.high
  //      );

  //      var not = NotificationDetails(android: androidPlatformChannelSpecific);
  //      await fln.show(0, title, body, not);
  // 