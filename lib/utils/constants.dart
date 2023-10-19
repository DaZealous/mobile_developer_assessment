class AppConstants {
  AppConstants._();

  static String getInitials(String name) {
    try {
      var names = name.split(' ');
      names.removeWhere((element) => element.isEmpty);
      if (names.length < 2) {
        return names.first
            .split('')
            .map((e) => (e[0]).toUpperCase())
            .take(2)
            .join();
      } else {
        return names.map((l) => l[0]).take(2).join();
      }
    } catch (e) {
      return '.';
    }
  }
}
