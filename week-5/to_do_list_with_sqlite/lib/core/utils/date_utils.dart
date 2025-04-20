String getMonthAbbreviation(int month) {
  const months = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];
  return months[month - 1];
}

String getWeekdayName(int weekday) {
  const weekdays = [
    'SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY',
    'THURSDAY', 'FRIDAY', 'SATURDAY',
  ];
  return weekdays[weekday - 1];
}
