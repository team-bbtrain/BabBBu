class AppChipProperties {
  final double chipHeight;
  final double iconSize;
  final double border;
  final double verticalPadding;
  final double horizontalPadding;

  const AppChipProperties({
    this.border = 0,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.chipHeight,
    required this.iconSize,
  });

  static const AppChipProperties small = AppChipProperties(
    verticalPadding: 4,
    horizontalPadding: 0,
    chipHeight: 34,
    iconSize: 24,
    border: 1,
  );

  static const AppChipProperties medium = AppChipProperties(
    verticalPadding: 8,
    horizontalPadding: 6,
    chipHeight: 40,
    iconSize: 20,
  );

  static const AppChipProperties large = AppChipProperties(
    verticalPadding: 8,
    horizontalPadding: 10.5,
    chipHeight: 44,
    iconSize: 24,
  );
}
