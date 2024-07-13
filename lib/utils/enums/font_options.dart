enum FontOptions {
  noToSerif,
  noToSerifBengali;

  String get key => switch (this) {
        FontOptions.noToSerif => "NotoSerif",
        FontOptions.noToSerifBengali => "NotoSerifBengali",
      };
}
