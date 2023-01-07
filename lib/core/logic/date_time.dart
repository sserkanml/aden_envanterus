class DateTimeLogic {
  DateTime getJsonData(String date) {
    var raw = date;

    var numeric = raw.split('(')[1].split(')')[0];
    var negative = numeric.contains('-');
    var parts = numeric.split(negative ? '-' : '+');
    var millis = int.parse(parts[0]);
    var local = DateTime.fromMillisecondsSinceEpoch(millis);
    return local;
  }

  String convertDateTime(DateTime time) {
    return "${time.day < 10 ? "0${time.day}" : time.day}/${time.month < 10 ? "0${time.month}" : time.month}/${time.year}";
  }
}
