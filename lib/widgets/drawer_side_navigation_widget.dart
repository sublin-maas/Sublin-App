import 'package:Sublin/models/routing.dart';
import 'package:Sublin/models/user.dart';
import 'package:Sublin/screens/provider_home_screen.dart';
import 'package:Sublin/screens/user_routing_screen.dart';
import 'package:flutter/material.dart';
import 'package:Sublin/screens/provider_registration_screen.dart';
import 'package:Sublin/screens/user_home_screen.dart';
import 'package:Sublin/services/auth_service.dart';
import 'package:provider/provider.dart';

class DrawerSideNavigationWidget extends StatelessWidget {
  const DrawerSideNavigationWidget({
    Key key,
    @required this.authService,
  }) : super(key: key);

  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final Routing routingService = Provider.of<Routing>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          // DrawerHeader(child: Text('Navigation')),#
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(user.firstName),
            onTap: null,
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Persönliche Einstellungen'),
            onTap: null,
          ),
          if (routingService.booked == null || routingService.booked == false)
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Fahrt suchen'),
              onTap: () =>
                  Navigator.pushNamed(context, UserHomeScreen.routeName),
            ),
          if (routingService.booked == true)
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Zum aktuellen Reise'),
              onTap: () =>
                  Navigator.pushNamed(context, RoutingScreen.routeName),
            ),
          if (user.isProvider == true)
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Meine Aufträge'),
              onTap: () =>
                  Navigator.pushNamed(context, ProviderHomeScreen.routeName),
            ),
          if (user.isProvider == false)
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text('Als Anbieter starten'),
              onTap: () => Navigator.pushNamed(
                  context, ProviderRegistrationScreen.routeName),
            ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text('Ausloggen'),
            onTap: () => authService.signOut(),
          ),
        ],
      ),
    );
  }
}
