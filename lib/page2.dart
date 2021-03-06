import 'package:bloc_provider/bloc_provider.dart';
import 'package:board_buff_20220420/page2_bloc.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<Page2Bloc>(context);

    return Scaffold(
        appBar: AppBar(title: const Text('住所検索')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('郵便番号:'),
                  SizedBox(
                    width: 150,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        bloc.inputZip(value);
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        bloc.search();
                      },
                      child: const Text('検索'))
                ],
              ),
              StreamBuilder<String>(
                  stream: bloc.addressStream,
                  builder: (context, snapshot) {
                    return Text('住所: ${snapshot.data}');
                  })
            ],
          ),
        ));
  }
}
