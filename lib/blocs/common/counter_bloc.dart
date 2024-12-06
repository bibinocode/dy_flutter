import 'package:flutter_bloc/flutter_bloc.dart';

// 直播页码

// 直播列表页码
enum CounterEvent { increment, reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(1) {
    on<CounterEvent>((event, emit) {
      switch (event) {
        case CounterEvent.reset:
          emit(1);
          break;
        case CounterEvent.increment:
          emit(state + 1);
          break;
      }
    });
  }
}
