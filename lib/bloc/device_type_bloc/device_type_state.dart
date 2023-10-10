part of 'device_type_bloc.dart';

///An enum to determine the type of device is mobile sized or not
enum DeviceType{
  mobile,
  notMobile,
}

@immutable
sealed class DeviceTypeState {
  const DeviceTypeState({this.deviceType = DeviceType.mobile});

  final DeviceType deviceType;
}

final class DeviceTypeInitialState extends DeviceTypeState {
  const DeviceTypeInitialState() : super();
}

final class DeviceTypeDeterminedState extends DeviceTypeState {
  const DeviceTypeDeterminedState({required DeviceType deviceType}) : super(deviceType: deviceType);
}
