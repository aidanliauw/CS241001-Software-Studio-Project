import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:softwarestudio/translation_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFF4CD9E0),
          onPrimary: Color(0xFF003739),
          primaryContainer: Color(0xFF004F52),
          onPrimaryContainer: Color(0xFF6FF6FD),
          secondary: Color(0xFFB1CCCD),
          onSecondary: Color(0xFF1B3436),
          secondaryContainer: Color(0xFF324B4C),
          onSecondaryContainer: Color(0xFFCCE8E9),
          tertiary: Color(0xFFB5C7E9),
          onTertiary: Color(0xFF1F314C),
          tertiaryContainer: Color(0xFF364764),
          onTertiaryContainer: Color(0xFFD5E3FF),
          error: Color(0xFFFFB4AB),
          errorContainer: Color(0xFF93000A),
          onError: Color(0xFF690005),
          onErrorContainer: Color(0xFFFFDAD6),
          background: Color(0xFF191C1C),
          onBackground: Color(0xFFE0E3E3),
          surface: Color(0xFF191C1C),
          onSurface: Color(0xFFE0E3E3),
          surfaceVariant: Color(0xFF3F4949),
          onSurfaceVariant: Color(0xFFBEC8C9),
          outline: Color(0xFF899393),
          onInverseSurface: Color(0xFF191C1C),
          inverseSurface: Color(0xFFE0E3E3),
          inversePrimary: Color(0xFF00696D),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF4CD9E0),
          outlineVariant: Color(0xFF3F4949),
          scrim: Color(0xFF000000),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'realtime translation app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Flag fromLanguageFlag = Flag.fromString('xx', height: 80, width: 100, fit: BoxFit.fill);
  Flag toLanguageFlag = Flag.fromString('xx', height: 80, width: 100, fit: BoxFit.fill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Text('Choose language'),
            const Text('then click the mic button to start translation'),
            const Text(
              '(please select from Chinese to English)',
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('From:'),
                    ),
                    PopupMenuButton<String>(
                      child: fromLanguageFlag,
                      onSelected: (String value) {
                        setState(() {
                          switch (value) {
                            case 'Traditional Chinese':
                              fromLanguageFlag = Flag.fromString('tw', height: 80, width: 100, fit: BoxFit.fill);
                              break;
                            case 'English(United States)':
                              fromLanguageFlag = Flag.fromString('us', height: 80, width: 100, fit: BoxFit.fill);
                              break;
                          }
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Traditional Chinese',
                            child: Text('Traditional Chinese'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'English(United States)',
                            child: Text('English(United States)'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(color:Theme.of(context).colorScheme.primary,shape: BoxShape.circle ),
                  child: IconButton(
                    color: Theme.of(context).colorScheme.onPrimary,
                    iconSize: 30,
                    icon: Icon(Icons.play_arrow),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TranslationPage()),
                      );
                    },
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('To:'),
                    ),
                    PopupMenuButton<String>(
                      child: toLanguageFlag,
                      onSelected: (String value) {
                        setState(() {
                          switch (value) {
                            case 'Traditional Chinese':
                              toLanguageFlag = Flag.fromString('tw', height: 80, width: 100, fit: BoxFit.fill);
                              break;
                            case 'English(United States)':
                              toLanguageFlag = Flag.fromString('us', height: 80, width: 100, fit: BoxFit.fill);
                              break;
                          }
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Traditional Chinese',
                            child: Text('Traditional Chinese'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'English(United States)',
                            child: Text('English(United States)'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
