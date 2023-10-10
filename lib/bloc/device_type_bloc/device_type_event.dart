part of 'device_type_bloc.dart';

@immutable
sealed class DeviceTypeEvent {
  const DeviceTypeEvent({required this.width});

  ///To save the width of device which will be used to determine the type of device is mobile sized or not
  final int width;
}

final class DeviceTypeDetermineEvent extends DeviceTypeEvent{
  const DeviceTypeDetermineEvent({required int width}) : super(width: width);
}
