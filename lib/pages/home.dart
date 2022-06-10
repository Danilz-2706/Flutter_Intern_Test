import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/ScrollOnWeb.dart';
import 'package:test/pages/components/AddSum.dart';
import 'package:test/pages/components/item_card.dart';
import 'package:test/services/formula_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddSum(
                  itemToAdd: (log) {
                    final fomulaService = Provider.of<FormulaService>(
                      context,
                      listen: false,
                    );
                    fomulaService.addItem(log);
                  },
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Log",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: Consumer<FormulaService>(
                      builder: ((context, value, child) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.items.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                            item: value.items[index],
                          );
                        });
                  })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
