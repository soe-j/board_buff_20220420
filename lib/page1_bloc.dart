import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class Page1Bloc extends Bloc {
  final _count = BehaviorSubject<int>.seeded(0);

  Stream<int> get countStream => _count.stream;

  void increment() {
    _count.add(_count.value + 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
