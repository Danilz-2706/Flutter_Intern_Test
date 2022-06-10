import 'package:flutter/material.dart';
import 'package:test/models/formula.dart';
import 'package:test/pages/components/custom_input_field.dart';
import 'package:test/models/log.dart';

class AddSum extends StatefulWidget {
  final Function(Log) itemToAdd;
  const AddSum({required this.itemToAdd, Key? key}) : super(key: key);

  @override
  State<AddSum> createState() => _AddSumState();
}

class _AddSumState extends State<AddSum> {
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.3,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text(
                "Add to log",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomInputFieldFb1(
                inputController: num1,
                hintText: 'Number 1',
                labelText: 'Number 1',
              ),
              CustomInputFieldFb1(
                inputController: num2,
                hintText: 'Number 2',
                labelText: 'Number 2',
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (num1.text.isNotEmpty && num2.text.isNotEmpty) {
                      widget.itemToAdd(Log(
                        num1: num1.text,
                        num2: num2.text,
                        sum: result,
                      ));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("SUM"))
            ],
          ),
        ),
      ),
    );
  }

  get result {
    return Fomula().GetTotal(num1.text, num2.text);
  }
}
