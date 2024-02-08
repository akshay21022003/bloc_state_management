import 'package:block_state_management/bloc/switch/switch_event.dart';
import 'package:block_state_management/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchStates>{
  
  SwitchBloc():super(SwitchStates()){
    on<EnableOrDisableNotifications>(_EnableOrDisableNotifications);
  }

  void _EnableOrDisableNotifications(EnableOrDisableNotifications events, Emitter<SwitchStates> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }
}