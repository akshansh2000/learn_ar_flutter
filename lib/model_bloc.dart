import 'dart:async';

import 'package:learn_ar_flutter/model_event.dart';

class ModelBloc {
  String _prefab = "carModel";

  final _modelStateController = StreamController<String>();
  StreamSink<String> get _inModel => _modelStateController.sink;
  Stream<String> get selectedModel => _modelStateController.stream;

  final _modelEventController = StreamController<ModelEvent>();
  StreamSink<ModelEvent> get modelSink => _modelEventController.sink;

  ModelBloc() {
    void _mapEventToState(ModelEvent event) {
      if (event is CarModelSelectEvent) {
        _prefab = "carModel";
      } else if (event is CubeModelSelectEvent) {
        _prefab = "cubeModel";
      }

      _modelEventController.stream.listen(_mapEventToState);
    }
  }

  void dispose() {
    _modelStateController.close();
    _modelEventController.close();
  }
}
