class StringsManpilation {
  // custom method to return name of domain as source without com or htttps://www.
  static String sourceNameFromDomain(String source) {
    if (source.contains(".com")) {
      int endIndex = source.indexOf(".com");
      source = source.substring(0, endIndex);
      if (source.contains("https")) {
        int startIndex = source.indexOf(".");
        source = source.substring(startIndex + 1, endIndex);
      }
    }
    return source;
  }

// custom method to return string first charcter uppercase
// make it title
  static String title(String title) {
    title = title[0].toUpperCase() + title.substring(1);
    return title;
  }

// custom method to edit text to be clear as y-m-d only
  static String date(String date) {
    int endIndex = date.toLowerCase().indexOf("t");
    date = date.substring(0, endIndex);
    return date;
  }
}
