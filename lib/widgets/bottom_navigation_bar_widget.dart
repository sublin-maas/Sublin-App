import 'package:Sublin/models/routing.dart';
import 'package:Sublin/screens/provider_booking_screen.dart';
import 'package:Sublin/screens/provider_partner_screen.dart';
import 'package:Sublin/screens/provider_target_group_screen.dart';
import 'package:Sublin/screens/user_home_screen.dart';
import 'package:Sublin/screens/user_profile_screen.dart';
import 'package:Sublin/screens/user_free_ride_screen.dart';
import 'package:Sublin/screens/user_routing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final bool isProvider;

  const BottomNavigationBarWidget({
    this.isProvider = false,
    Key key,
  }) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Routing routingService = Provider.of<Routing>(context);

    return widget.isProvider
        ? BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            // This is the bottom navigation for providers
            onTap: (int) {
              if (int == 0)
                Navigator.of(context)
                    .push(_createRoute(ProviderBookingScreen()));
              if (int == 1) {
                Navigator.of(context)
                    .push(_createRoute(ProviderPartnerScreen()));
              }
              if (int == 2) {
                Navigator.of(context)
                    .push(_createRoute(ProviderTargetGroupScreen()));
              }
              if (int == 3) {
                Navigator.of(context).push(_createRoute(UserProfileScreen()));
              }
              setState(() {
                _currentIndex = int;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_late),
                title: Text('Aufträge'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_late),
                title: Text('Partner'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_late),
                title: Text('Zielgruppe'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Profil'),
              ),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.amber[800],
          )
        : BottomNavigationBar(
            // This is the navigation for user -------------------------------------
            onTap: (int) {
              if (int == 0) {
                Navigator.of(context).push(_createRoute(UserHomeScreen()));
              }
              if (int == 1) {
                Navigator.of(context).push(_createRoute(UserFreeRideScreen()));
              }
              if (int == 2) {
                Navigator.of(context).push(_createRoute(UserProfileScreen()));
              }
              setState(() {
                _currentIndex = int;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_late),
                title: Text('Meine Fahrt'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Freifahrten'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                title: Text('Profil'),
              ),
            ],
            currentIndex: _currentIndex,
            selectedItemColor: Colors.amber[800],
          );
  }
}

Route _createRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}