import 'dart:async';

import 'package:schauer/blocs_custom/provider.dart';

class IncrementBloc implements BlocBase {
  //
  // Constructor
  //
  IncrementBloc() {
    _counter = 0;
    _actionController.stream.listen(_handleLogic);
  }

  late int _counter;

  //
  // Stream to handle the counter
  //
  final StreamController<int> _counterController = StreamController<int>();
  StreamSink<int> get _inAdd => _counterController.sink;
  Stream<int> get outCounter => _counterController.stream;

  //
  // Stream to handle the action on the counter
  //
  final StreamController _actionController = StreamController();
  StreamSink get incrementCounter => _actionController.sink;

  void _handleLogic(data) {
    _counter = _counter + 1;
    _inAdd.add(_counter);
  }

  @override
  void dispose() {
    _actionController.close();
    _counterController.close();
  }
}