import 'package:flutter/material.dart';
import '../controllers/unit_converter_controller.dart';

class UnitConverterView extends StatefulWidget {
  @override
  _UnitConverterViewState createState() => _UnitConverterViewState();
}

class _UnitConverterViewState extends State<UnitConverterView> {
  final UnitConverterController _controller = UnitConverterController();
  final TextEditingController _valueController = TextEditingController();

  String _category = 'Length';
  String _fromUnit = 'meters';
  String _toUnit = 'kilometers';
  String? _result;

  final Map<String, List<String>> _units = {
    'Length': ['meters', 'kilometers', 'centimeters', 'inches', 'feet'],
    'Weight': ['kilograms', 'grams', 'pounds', 'ounces'],
    'Temperature': ['Celsius', 'Fahrenheit'],
  };

  void _convert() {
    final value = double.tryParse(_valueController.text);
    if (value != null) {
      final result = _controller.convertUnit(_category, value, _fromUnit, _toUnit);
      setState(() {
        _result = result.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _category,
              onChanged: (String? newValue) {
                setState(() {
                  _category = newValue!;
                  _fromUnit = _units[_category]![0];
                  _toUnit = _units[_category]![1];
                });
              },
              items: _units.keys.map<DropdownMenuItem<String>>((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: _fromUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _fromUnit = newValue!;
                    });
                  },
                  items: _units[_category]!.map<DropdownMenuItem<String>>((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
                Text('to'),
                DropdownButton<String>(
                  value: _toUnit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _toUnit = newValue!;
                    });
                  },
                  items: _units[_category]!.map<DropdownMenuItem<String>>((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            if (_result != null)
              Text(
                'Result: $_result $_toUnit',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}
