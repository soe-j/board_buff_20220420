import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_20220420/page1_bloc.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State {
  late Page1Bloc bloc;

  @override
  void initState() {
    // 1回のみ実行することが保証されている
    super.initState();

    bloc = BlocProvider.of<Page1Bloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('たいとる')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.increment();
          },
        ),
        body: StreamBuilder(
          stream: bloc.countStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Text('すとりーむ：${snapshot.data}');
          },
        ));
  }
}
