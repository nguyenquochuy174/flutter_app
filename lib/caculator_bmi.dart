import 'package:flutter/material.dart';

class CaculatorBmi extends StatefulWidget {
  const CaculatorBmi({super.key});

  @override
  State<CaculatorBmi> createState() => _CaculatorBmiState();
}

class _CaculatorBmiState extends State<CaculatorBmi> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String? _heightError;
  String? _weightError;

  double? _bmi;
  String _category = "";

  void _calculateBmi() {
    setState(() {
      _heightError = null;
      _weightError = null;
    });

    final String heightText = _heightController.text.trim();
    final String weightText = _weightController.text.trim();

    // Validate rỗng
    if (heightText.isEmpty) {
      setState(() => _heightError = "Vui lòng nhập chiều cao");
    }
    if (weightText.isEmpty) {
      setState(() => _weightError = "Vui lòng nhập cân nặng");
    }
    if (_heightError != null || _weightError != null) {
      return;
    }

    // Parse sang số
    final double? height = double.tryParse(heightText);
    final double? weight = double.tryParse(weightText);

    if (height == null || height <= 0) {
      setState(() => _heightError = "Chiều cao không hợp lệ");
      return;
    }
    if (weight == null || weight <= 0) {
      setState(() => _weightError = "Cân nặng không hợp lệ");
      return;
    }

    // Tính BMI
    double bmi = weight / (height * height);

    String category;
    if (bmi < 18.5) {
      category = "Thiếu cân";
    } else if (bmi < 25) {
      category = "Bình thường";
    } else if (bmi < 30) {
      category = "Thừa cân";
    } else {
      category = "Béo phì";
    }

    setState(() {
      _bmi = bmi;
      _category = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tính chỉ số BMI",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Chiều cao (m)"),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.height),
                border: const OutlineInputBorder(),
                hintText: "Nhập chiều cao (VD: 1.75)",
                errorText: _heightError,
              ),
            ),
            const SizedBox(height: 16),

            const Text("Cân nặng (kg)"),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.monitor_weight),
                border: const OutlineInputBorder(),
                hintText: "Nhập cân nặng",
                errorText: _weightError,
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                onPressed: _calculateBmi,
                icon: const Icon(Icons.calculate),
                label: const Text("Tính BMI"),
              ),
            ),
            const SizedBox(height: 20),

            if (_bmi != null)
              Center(
                child: Column(
                  children: [
                    Text(
                      "Chỉ số BMI: ${_bmi!.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Phân loại: $_category",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
