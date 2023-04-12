import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_image_app/blocs/app_events.dart';
import 'package:google_api_image_app/network/network_helper.dart';
import 'package:google_api_image_app/network/query.dart';

import '../network/response_model.dart';
import 'app_states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final NetworkHelper _networkHelper;
  // final _textController = StreamController<String>();

  // Stream<String> get textStream => _textController.stream;

  // dispose() {
  //   _textController.close();
  // }

  // updateText(String text) {
  //   (text == null || text == "")
  //       ? _textController.sink.addError("Invalid value entered!")
  //       : _textController.sink.add(text);
  // }

  UserBloc(this._networkHelper) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        var query = Query().queryHeaders(event.queryText);
        print(query);
        final queryData = await _networkHelper.getData(query);

        JSON jsonModel = JSON.fromJson(queryData);
        List<String> urls = createImageUrlsIterable(jsonModel);
        emit(UserLoadedState(urls));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
    on<LoadInitalEvent>((event, emit) {
      emit(UserInitialState());
    });
  }

  List<String> createImageUrlsIterable(JSON json) {
    List<String> urls = [];
    for (int i = 0; i < json.items!.length; i++) {
      String? url = json.items![i].pagemap?.cseImage![0].src;
      print(url);
      urls.add(url!);
    }
    return urls;
  }
}
