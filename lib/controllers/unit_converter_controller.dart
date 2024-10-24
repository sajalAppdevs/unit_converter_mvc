import '../models/unit_converter_model.dart';

class UnitConverterController {
  final UnitConverterModel _model = UnitConverterModel();

  double convertUnit(String category, double value, String fromUnit, String toUnit) {
    switch (category) {
      case 'Length':
        return _model.convertLength(value, fromUnit, toUnit);
      case 'Weight':
        return _model.convertWeight(value, fromUnit, toUnit);
      case 'Temperature':
        return _model.convertTemperature(value, fromUnit, toUnit);
      default:
        return value;
    }
  }
}
