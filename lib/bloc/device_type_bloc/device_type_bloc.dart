import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'device_type_event.dart';
part 'device_type_state.dart';

class DeviceTypeBloc extends Bloc<DeviceTypeEvent, DeviceTypeState> {
  DeviceTypeBloc() : super(const DeviceTypeInitialState()) {
   
    on<DeviceTypeEvent>((event, emit) {
      
      ///If width is less than 900, the device is mobile sized
      ///Else it is not mobile sized
      DeviceType deviceType = event.width <= 800 ? DeviceType.mobile : DeviceType.notMobile;
      emit(DeviceTypeDeterminedState(deviceType: deviceType));
    });
  }
}
