import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  String? _nameError;
  String? _contentError;
  String? _rateError;

  int? _selectedRate; 

  void _submit() {
    setState(() {
      _nameError = null;
      _contentError = null;
      _rateError = null;
    });

    if (_nameController.text.trim().isEmpty) {
      setState(() => _nameError = "Vui lòng nhập họ tên");
    }
    if (_contentController.text.trim().isEmpty) {
      setState(() => _contentError = "Vui lòng nhập góp ý");
    }
    if (_selectedRate == null) {
      setState(() => _rateError = "Vui lòng chọn số sao");
    }

    if (_nameError != null || _contentError != null || _rateError != null) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Cảm ơn bạn đã gửi phản hồi!\n"
          "Họ tên: ${_nameController.text}\n"
          "Đánh giá: $_selectedRate sao\n"
          "Góp ý: ${_contentController.text}",
        ),
      ),
    );

    _nameController.clear();
    _contentController.clear();
    setState(() => _selectedRate = null); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      
      appBar: AppBar(
        title: const Text("Gửi phản hồi", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Họ tên",
                prefixIcon: const Icon(Icons.person),
                border: const OutlineInputBorder(),
                errorText: _nameError,
              ),
            ),
            const SizedBox(height: 16),

            const Text("Đánh giá (1 - 5 sao)"),
            const SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _rateError == null ? Colors.grey : Colors.red, 
                ),
              ),
              child: DropdownButton<int>(
                value: _selectedRate,
                isExpanded: true,
                underline: const SizedBox(),
                hint: const Text("Chọn số sao"),
                icon: const Icon(Icons.arrow_drop_down),
                items: List.generate(
                  5,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text("${i + 1} sao"),
                      ],
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedRate = value!;
                    _rateError = null;
                  });
                },
              ),
            ),

            if (_rateError != null)
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 8),
                child: Text(
                  _rateError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            const SizedBox(height: 16),

            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Nội dung góp ý",
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
                errorText: _contentError,
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: _submit,
                icon: const Icon(Icons.send, color: Colors.white,),
                label: const Text("Gửi phản hồi", style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
