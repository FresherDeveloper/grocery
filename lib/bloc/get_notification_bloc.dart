import 'package:bloc/bloc.dart';
import 'package:grocery_app/modelclass/fetch_api_model.dart';
import 'package:grocery_app/service/api_provider.dart';
import 'package:meta/meta.dart';

part 'get_notification_event.dart';
part 'get_notification_state.dart';

class GetNotificationBloc extends Bloc<GetNotificationEvent, GetNotificationState> {
  GetNotificationBloc() : super(GetNotificationInitial()) {
    List<Data>? _list = [];
    // PostApiModel? postlist ;
    ApiProvider _apiProvider = ApiProvider();
    on<GetNotificationEvent>((event, emit) async {
     emit(GetNotificationLoading()); 
      
        try {
          
       await Future.delayed(Duration(seconds: 3));
          var value = await _apiProvider.getApi();
          _list = value.data;
              
          emit(GetNotificationLoaded(getModelList: _list!));
        } catch (e) {
          emit(GetNotificationError(message: e.toString()));
        }
    
    });
  }
}
