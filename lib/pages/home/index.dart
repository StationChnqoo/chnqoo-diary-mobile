import 'package:chnqoo_diary_mobile/constants/states_provider.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/slide_menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  StatesProvider statesProvider = StatesProvider();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white,
            onPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: Consumer<StatesProvider>(
        builder: (context, value, child) {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      drawer: SlideMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  loadBingPicture() async {
    var dio = Dio();
    // dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        queryParameters: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        showProcessingTime: true,
        showCUrl: true,
        // canShowLog: kDebugMode,
      ),
    );
    var result = await dio.get(
        'https://mouday.github.io/wallpaper-database/${x.usePreviousDay(1)}.json');
    statesProvider.setBingWallPaper(result.data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statesProvider = Provider.of<StatesProvider>(context, listen: false);
    loadBingPicture();
  }
}
