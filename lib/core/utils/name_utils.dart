String getInitials(String names, String surnames) {
  final firstName = names.trim().split(' ').first;
  final firstSurname = surnames.trim().split(' ').first;

  return "${firstName.isNotEmpty ? firstName[0] : ''}"
         "${firstSurname.isNotEmpty ? firstSurname[0] : ''}";
}

String getShortName(String names, String surnames) {
  final firstName = names.trim().split(' ').first;
  final firstSurname = surnames.trim().split(' ').first;

  return "$firstName $firstSurname";
}