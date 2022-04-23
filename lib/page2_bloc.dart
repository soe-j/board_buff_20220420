import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class Page2Bloc implements Bloc {
  final _address = BehaviorSubject<String>.seeded('');

  Stream<String> get addressStream => _address.stream;

  final _input = BehaviorSubject<String>.seeded('');

  void inputZip(String zip) {
    _input.add(zip);
  }

  Future<void> _getAddressFromZip(String zip) async {
    // TODO
    _address.add('${zip} の住所');
  }

  Future<void> search() async {
    await _getAddressFromZip(_input.value);
  }

  @override
  void dispose() {
    _address;
    _input;
  }
}
