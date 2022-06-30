/*
{"abbreviation":"+03","client_ip":"176.220.15.38","datetime":"2022-06-28T22:27:29.097114+03:00",
"day_of_week":2,"day_of_year":179,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":10800,
"timezone":"Europe/Istanbul","unixtime":1656444449,"utc_datetime":"2022-06-28T19:27:29.097114+00:00","utc_offset":"+03:00",
"week_number":26}
 */

class Clock {
  String? abbreviation;
  String? clientIp;
  String? datetime;
  int? dayOfWeek;
  int? dayOfYear;
  bool? dst;
  int? dstOffset;
  int? rawOffset;
  String? timezone;
  int? unixtime;
  String? utcDatetime;
  String? utcOffset;
  int? weekNumber;


  Clock();

  Clock.fromJSON(Map<String, dynamic> jsonMap) {
    abbreviation = jsonMap['abbreviation'] ?? "";
    clientIp = jsonMap['client_ip'] ?? "";
    datetime = jsonMap['datetime'] ?? "";
    dayOfWeek = jsonMap['day_of_week'];
    dayOfYear = jsonMap['day_of_year'];
    dst = jsonMap['dst'] ?? false;
    dstOffset = jsonMap['dst_offset'] ;
    rawOffset = jsonMap['raw_offset'] ;
    timezone = jsonMap['timezone'] ?? "";
    unixtime = jsonMap['unixtime'] ?? "";
    utcDatetime = jsonMap['utc_datetime'] ?? "";
    utcOffset = jsonMap['utc_offset'] ?? "";
    weekNumber = jsonMap['week_number'] ;
  }
}