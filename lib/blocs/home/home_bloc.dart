import 'package:flutter_bloc/flutter_bloc.dart';

// 启动页预加载首页信息
abstract class IndexEvent {}

class UpdateTab implements IndexEvent {
  final List tabs;
  UpdateTab(this.tabs);
}

class UpdateLiveData implements IndexEvent {
  final List liveData;

  UpdateLiveData(this.liveData);
}

class UpdateSwiper implements IndexEvent {
  final List swiper;

  UpdateSwiper(this.swiper);
}

class HomeBloc extends Bloc<IndexEvent, Map> {
  HomeBloc() : super({'nav': [], 'liveData': [], 'swiper': []}) {
    on<IndexEvent>((event, emit) {
      if (event is UpdateTab) {
        emit({...state, 'nav': event.tabs});
      } else if (event is UpdateLiveData) {
        emit({...state, 'liveData': event.liveData});
      } else if (event is UpdateSwiper) {
        emit({...state, 'swiper': event.swiper});
      }
    });
  }
}
