import 'package:intl/intl.dart';

class DateTimeFormat{
  
  ///Process DateTime to String('1 Oktober 2023')
  static String dateTimeToString(DateTime dateTime){
    return DateFormat('d MMMM y', 'id_ID').format(dateTime);
  }

  ///Process DateTime to String('10:30')
  static String dateTimeToString2(DateTime dateTime){
    return DateFormat('H:m', 'id_ID').format(dateTime);
  }

  ///Process DateTime to String('Oct 1, 2023 10:30 AM')
  static String dateTimeToString3(DateTime dateTime){
    return DateFormat('MMM d, y H:m a', 'en_US').format(dateTime);
  }

  ///Process DateTime to String('1 Oktober 2023, 10:30')
  static String dateTimeToString4(DateTime dateTime){
    return DateFormat('d MMMM y, H:m', 'id_ID').format(dateTime);
  }

  ///Process String('Oct 13, 2023 12:00 AM') to DateTime?
  static DateTime? stringToDateTime(String? dateTimeString){
    if(dateTimeString == null){
      return null;
    }
    return DateFormat('MMM d, y H:m a', 'en_US').parse(dateTimeString);
  }
}