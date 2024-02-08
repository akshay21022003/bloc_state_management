import 'package:equatable/equatable.dart';

abstract class SwitchEvents extends Equatable{
SwitchEvents();

@override
List<Object> get props =>[];
}

class EnableOrDisableNotifications extends SwitchEvents{}


