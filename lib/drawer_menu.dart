/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:states_redux/model/app_state.dart';

const kTitle = 'Redux';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Text(
                    kTitle,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                      color: state.color == Colors.black
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: state.color,
                ),
              ),
              getListTile('Home', onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              }),
              getLine(),
              getListTile('About', onTap: () {
                Navigator.pushReplacementNamed(context, '/about');
              }),
              getLine(),
              getListTile('Settings', onTap: () {
                Navigator.pushReplacementNamed(context, '/settings');
              }),
            ],
          );
        },
      ),
    );
  }

  Widget getLine() {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey,
      ),
    );
  }

  Widget getListTile(title, {onTap}) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }

//  Function gotoScreen(BuildContext context, String name) {
//    if (name == 'home') {
//      Navigator.pushNamed(context, '/');
//    } else if (name == 'about') {
//      Navigator.pushNamed(context, '/about');
//    } else if (name == 'settings') {
//      Navigator.pushNamed(context, '/settings');
//    }
//  }
}
