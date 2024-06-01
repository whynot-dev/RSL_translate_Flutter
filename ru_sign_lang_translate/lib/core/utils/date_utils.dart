class DateUtils {

  DateUtils();

  static int daysInMonth(int monthNum, int year) {
    List<int> monthLength = List.filled(12, 0);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true)
      monthLength[1] = 29;
    else
      monthLength[1] = 28;

    return monthLength[monthNum - 1];
  }

  static bool leapYear(int year) {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true)
      leapYear = false;
    else if (year % 4 == 0)
      leapYear = true;


    return leapYear;
  }

  int yearLength(int year) {
    int yearLength = 0;

    for (int counter = 1; counter < year; counter++) {
      if (counter >= 4) {
        if (leapYear(counter) == true)
          yearLength += 366;
        else
          yearLength += 365;
      }
      else
        yearLength += 365;
    }
    return yearLength;
  }

  int daysPastInYear(int monthNum, int dayNum, int year) {
    int totalMonthLength = 0;

    for (int count = 1; count < monthNum; count++) {
      totalMonthLength += daysInMonth(count, year);
    }

    int monthLengthTotal = totalMonthLength + dayNum;

    return monthLengthTotal;
  }

  int totalLengthOfDays(int monthNum, int dayNum, int year) {
    return (daysPastInYear(monthNum, dayNum, year) + yearLength(year));
  }
}