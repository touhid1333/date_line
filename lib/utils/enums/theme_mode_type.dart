enum ThemeModeType {
  light,
  dark;

  static bool isLightTheme({required ThemeModeType type}) => switch (type) {
        light => true,
        dark => false,
      };
}
