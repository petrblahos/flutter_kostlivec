import 'package:flutter/material.dart';
import 'package:flutter_kostlivec/src/service/app_config_service.dart';
import 'package:flutter_kostlivec/src/state/app_config_state.dart';
import 'package:flutter_kostlivec/src/util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _incrementCounter() => getMy<AppConfigService>().incrementCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(context.messages.pushedMessage),
            Text(
              context.watchState<AppConfigState>().counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: <Widget>[
                Spacer(),
                languageButton("cs", context),
                Spacer(),
                languageButton("en", context),
                Spacer(),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget languageButton(String langCode, BuildContext context) {
    String curLang = context.watchState<AppConfigState>().locale.languageCode;
    return FlatButton(
      child: Text(langCode),
      onPressed: langCode == curLang ? null : () => getMy<AppConfigService>().setLocale(langCode),
    );
  }
}