import 'package:flutter/material.dart';

class SiCalculator extends StatefulWidget {
  const SiCalculator({Key? key}) : super(key: key);

  @override
  _SiCalculatorState createState() => _SiCalculatorState();
}

class _SiCalculatorState extends State<SiCalculator> {
  String? principal;
  String? rate;
  String? time;

  final _formKey = GlobalKey<FormState>();

  int result = 0;

  String? _validateField(String? value) {
    if (value!.isEmpty) {
      return "Value can not be empty";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SI Calculator"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    principal = newValue;
                  },
                  validator: (value) {
                    return _validateField(value);
                  },
                  decoration: const InputDecoration(
                      label: Text("Principal"),
                      hintText: "Total amount in Rs,"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (newValue) => time = newValue,
                  validator: (value) {
                    return _validateField(value);
                  },
                  decoration: const InputDecoration(
                    label: Text("Time"),
                    hintText: "Time in year",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (newValue) => rate = newValue,
                  validator: (value) {
                    return _validateField(value);
                  },
                  decoration: const InputDecoration(
                    label: Text("Rate"),
                    hintText: "Rate per annum",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        int tempresult = int.parse(principal.toString()) *
                            int.parse(rate.toString()) *
                            int.parse(time.toString());
                        result = tempresult ~/ 100;
                      });
                    }
                  },
                  child: const Text("Submit"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                    setState(() {
                      result = 0;
                    });
                  },
                  child: const Text("Clear"),
                ),
                Text("Result : Rs $result")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
