import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String formatValidityDate(String dateString){
    var inputDate=DateFormat('yyyy-MM-dd hh:mm:ss').parse(dateString);
    var outputFormat=DateFormat('dd MMM yyyy').format(inputDate);
    return outputFormat;
  }

  static String estimatedDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy - hh:mm:ss a').format(dateTime);
  }

  static String estimatedTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss a').format(dateTime);
  }

  static String formatDepositTimeWithAmFormat(String dateString){

    var newStr = '${dateString.substring(0,10)} ${dateString.substring(11,23)}';
    DateTime dt = DateTime.parse(newStr);

    String formatedDate= DateFormat("yyyy-MM-dd").format(dt);

    return formatedDate;
  }

  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    //return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
    return DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").parse(dateTime);
  }

  static String convertIsoToString(String dateTime){
    DateTime time=convertStringToDatetime(dateTime);
    String result=DateFormat('dd MMM yyyy hh:mm aa',).format(time);
    return result;
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').parse(dateTime, true).toLocal();
  }

  static String isoToLocalTimeSubtract(String dateTime){
    DateTime date=isoStringToLocalDate(dateTime);
    final currentDate=DateTime.now();
    final difference=currentDate.difference(date).inDays;
    return difference.toString();
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('hh:mm aa').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    try{
      return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
    }catch(v){
      return "--";
    }
  }
  static String isoStringToLocalFormattedDateOnly(String dateTime) {
    try{
      return DateFormat('dd MMM, yyyy').format(isoStringToLocalDate(dateTime));
    }catch(v){
      return "--";
    }
  }

  static String localDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime.toUtc());
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String convertTimeToTime(String time) {
    return DateFormat('hh:mm a').format(DateFormat('hh:mm:ss').parse(time));
  }

  static String nextReturnTime(String dateTime) {
    try{
      final date = DateFormat("dd MMM, yyyy hh:mm a").format(DateTime.parse(dateTime));
      return date;
    } catch(e){
      return dateTime;
    }

  }


  static String getFormatedSubtractTime(String time,{ bool numericDates=false}){

    final date1 = DateTime.now();
    final isoDate = isoStringToLocalDate(time);
    final difference = date1.difference(isoDate);

    if ((difference.inDays / 365).floor() >= 1) {
      int year = (difference.inDays/365).floor();
      return '$year year ago';
    }else if((difference.inDays / 30).floor() >= 1){
      int month = (difference.inDays/30).floor();
      return '$month month ago';
    }
    else if((difference.inDays / 7).floor() >= 1){
      int week = (difference.inDays/7).floor();
      return '$week week ago';
    }
    else if (difference.inDays >= 1) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago';
    }  else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago';
    }  else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }

  }
  static String subtractDate(String date1, String date2) {
    final date1 = DateTime.now();
    final isoDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date2);
    final difference = isoDate.difference(date1);

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    String formattedTime = '';
    String hour = 'h';
    String minute = 'm';
    String second = 's';

    if (days > 0) {
      formattedTime += '$days $hour';
    }
    if (hours > 0 || days > 0) {
      formattedTime += ' $hours $hour';
    }
    if (minutes > 0 || hours > 0 || days > 0) {
      formattedTime += ' $minutes $minute';
    }
    if (seconds > 0 || minutes > 0 || hours > 0 || days > 0) {
      formattedTime += ' $seconds $second';
    }

    if (formattedTime.isEmpty) {
      return '';
    }

    return formattedTime.trim();
  }



}