import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habits_plus/core/models/habit.dart';
import 'package:habits_plus/ui/view/create/create.dart';
import 'package:habits_plus/ui/view/create/create_from_template.dart';
import 'package:habits_plus/ui/view/detail_habit.dart';
import 'package:habits_plus/ui/view/edit.dart';
import 'package:habits_plus/ui/view/home.dart';
import 'package:habits_plus/ui/view/image_preview.dart';
import 'package:habits_plus/ui/view/settings.dart';
import 'package:habits_plus/ui/view/settings/account.dart';
import 'package:habits_plus/ui/view/settings/author.dart';
import 'package:habits_plus/ui/view/settings/contact_us.dart';
import 'package:habits_plus/ui/view/settings/darkmode.dart';
import 'package:habits_plus/ui/view/settings/languages.dart';
import 'package:habits_plus/ui/view/settings/notifications.dart';
import 'package:habits_plus/ui/view/settings/report_bug.dart';
import 'package:habits_plus/ui/view/settings/security.dart';
import 'package:habits_plus/ui/view/settings/sync.dart';
import 'package:habits_plus/ui/view/shell.dart';
import 'package:habits_plus/ui/view/create/habit_view1.dart';
import 'package:habits_plus/ui/view/create/habit_view2.dart';
import 'package:habits_plus/ui/view/create/habit_view3.dart';
import 'package:habits_plus/ui/view/create/habit_view4.dart';
import 'package:habits_plus/ui/view/start.dart';
import 'package:habits_plus/ui/view/sync/exit.dart';

const String initialRoute = 'login';

class Router {
  static Route<dynamic> generateRoute(
      RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => MainShell());
      case 'start':
        return CupertinoPageRoute(builder: (_) => StartPage());
      case 'settings':
        return CupertinoPageRoute(builder: (_) => SettingsPage());
      case 'settings/darkmode':
        return CupertinoPageRoute(
          builder: (_) => DarkModeSettingsPage(),
        );
      case 'settings/account':
        return CupertinoPageRoute(
          builder: (_) => AccountSettingsPage(),
        );
      case 'settings/account/sync_login':
        return CupertinoPageRoute(
          builder: (_) => SyncPage(),
        );
      case 'settings/account/sync_exit':
        return CupertinoPageRoute(
          builder: (_) => SyncExitScreen(),
        );
      case 'settings/notifications':
        return CupertinoPageRoute(
          builder: (_) => NotificationsSettingsPage(),
        );
      case 'settings/security':
        return CupertinoPageRoute(
          builder: (_) => LockSettingsPage(),
        );
      case 'settings/languages':
        return CupertinoPageRoute(
          builder: (_) => LanguagesSettingsPage(),
        );
      case 'settings/report_bug':
        return CupertinoPageRoute(
          builder: (_) => ReportBugPage(),
        );
      case 'settings/contact_us':
        return CupertinoPageRoute(
          builder: (_) => ContactUsPage(),
        );
      case 'settings/author':
        return CupertinoPageRoute(
          builder: (_) => AuthorPage(),
        );
      case 'create':
        return CupertinoPageRoute(builder: (_) => CreateHabitPage());
      case 'create_from_template':
        Habit habit = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => CreateFromTemplatePage(templateHabit: habit),
        );
      case 'createHabit_1':
        return CupertinoPageRoute(builder: (_) => CreateHabitView1());
      case 'createHabit_2':
        List _args = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => CreateHabitView2(
            title: _args[0],
            desc: _args[1],
            iconCode: _args[2],
          ),
        );
      case 'createHabit_3':
        List _args = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => CreateHabitView3(
            title: _args[0],
            desc: _args[1],
            iconCode: _args[2],
            progressBin: _args[3],
            duration: _args[4],
          ),
        );
      case 'createHabit_4':
        List _args = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => CreateHabitView4(
            title: _args[0],
            desc: _args[1],
            iconCode: _args[2],
            progressBin: _args[3],
            duration: _args[4],
            habitType: _args[5],
          ),
        );
      case 'home':
        return CupertinoPageRoute(builder: (_) => HomePage());
      case 'habit_detail':
        Habit _habit = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => DetailHabitPage(_habit),
          title: '123',
        );
      case 'habit_detail/edit':
        Habit _habit = settings.arguments;
        return CupertinoPageRoute(
          builder: (_) => EditHabitPage(_habit),
          title: '123',
        );
      case 'image_preview':
        List _arg = settings.arguments;
        print(_arg);
        return CupertinoPageRoute(
          builder: (_) => ImagePreviewPage(
            imageBase64String: _arg[0],
            tag: _arg[1],
          ),
        );
      default:
        return CupertinoPageRoute(builder: (_) => MainShell());
    }
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
