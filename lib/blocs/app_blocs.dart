import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_image_app/blocs/app_events.dart';
import 'package:google_api_image_app/network/network_helper.dart';
import 'package:google_api_image_app/network/query.dart';
import '../network/response_model.dart';
import 'app_states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final NetworkHelper _networkHelper;

  UserBloc(this._networkHelper) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      // try {
      var query = Query().queryHeaders(event.queryText);
      final queryData = await _networkHelper.getData(query);
      JSON jsonModel = JSON.fromJson(queryData);
      List<String> urls = createImageUrlsIterable(jsonModel);
      emit(UserLoadedState(urls));
      // } catch (e) {
      //   emit(UserErrorState(e.toString()));
      // }
    });
    on<LoadInitalEvent>((event, emit) {
      emit(UserInitialState());
    });
  }

  List<String> createImageUrlsIterable(JSON json) {
    List<String> imageUrls = [];
    if (json.items == null) {
      return [];
    }
    for (int i = 0; i < json.items!.length; i++) {
      try {
        //in not every response is an image
        String? url = json.items![i].pagemap?.cseImage![0].src;
        print(url);
        imageUrls.add(url!);
      } catch (e) {
        print(e);
      }
    }
    return imageUrls;
  }
}
