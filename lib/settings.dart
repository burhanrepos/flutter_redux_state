/**
 * Created by Burhan Shaheen
 * https://github.com/burhanrepos
 */
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:states_redux/drawer_menu.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:states_redux/model/app_state.dart';
import 'package:states_redux/redux/actions.dart';

class Settings extends StatelessWidget {
  // create some values
  Color pickerColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    // ValueChanged<Color> callback
    void changeColor(Color color) {
      StoreProvider.of<AppState>(context).dispatch(TextColor(color));
      // setState(() => pickerColor = color);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Font Size: ${state.viewFontSize.toInt()}',
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline1?.fontSize),
                  ),
                ),
                Slider(
                    min: 0.5,
                    value: state.sliderFontSize,
                    onChanged: (newValue) {
                      StoreProvider.of<AppState>(context)
                          .dispatch(FontSize(newValue));
                      print(newValue);
                    }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: state.bold,
                        onChanged: (newValue) {
                          StoreProvider.of<AppState>(context)
                              .dispatch(Bold(newValue));
                        },
                      ),
                      Text(
                        'Bold',
                        style: getStyle(state.bold, false),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                          value: state.italic,
                          onChanged: (newVal) {
                            StoreProvider.of<AppState>(context)
                                .dispatch(Italic(newVal));
                          }),
                      Text(
                        'Italic',
                        style: getStyle(false, state.italic),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      child: Container(
                        width: 30,
                        height: 30,
                        color: state.color,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: state.color,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  paletteType: PaletteType.hueWheel,
                                  pickerColor: state.color,
                                  onColorChanged: changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    print("I am current Color got it");
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          })),
                ),
              ]);
        },
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
