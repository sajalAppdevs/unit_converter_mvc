class UnitConverterModel {
  // Length Conversion
  double convertLength(double value, String fromUnit, String toUnit) {
    final Map<String, double> lengthUnits = {
      'meters': 1.0,
      'kilometers': 0.001,
      'centimeters': 100.0,
      'inches': 39.37,
      'feet': 3.28084,
    };
    return value * lengthUnits[fromUnit]! / lengthUnits[toUnit]!;
  }

  // Weight Conversion
  double convertWeight(double value, String fromUnit, String toUnit) {
    final Map<String, double> weightUnits = {
      'kilograms': 1.0,
      'grams': 1000.0,
      'pounds': 2.20462,
      'ounces': 35.274,
    };
    return value * weightUnits[fromUnit]! / weightUnits[toUnit]!;
  }

  // Temperature Conversion
  double convertTemperature(double value, String fromUnit, String toUnit) {
    if (fromUnit == 'Celsius' && toUnit == 'Fahrenheit') {
      return (value * 9/5) + 32;
    } else if (fromUnit == 'Fahrenheit' && toUnit == 'Celsius') {
      return (value - 32) * 5/9;
    } else {
      return value; // Same unit, no conversion needed
    }
  }
}
