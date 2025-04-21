import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/ui/_core/bag_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    if (bagProvider.getMapByAmount().isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sacola'),
          actions: [
            TextButton(
              onPressed: () {
                bagProvider.clearBag();
              },
              child: Text('Limpar'),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Sua sacola está vazia',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sacola'),
          actions: [
            TextButton(
              onPressed: () {
                bagProvider.clearBag();
              },
              child: Text('Limpar'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Pedidos',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: List.generate(
                    bagProvider.getMapByAmount().keys.length,
                    (index) {
                      Dish dish =
                          bagProvider.getMapByAmount().keys.toList()[index];
                      return ListTile(
                        leading: Image.asset(
                          'assets/dishes/default.png',
                          width: 48.0,
                          height: 48.0,
                        ),
                        title: Text(dish.name),
                        subtitle: Text('R\$${dish.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                bagProvider.removeDish(dish);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              bagProvider.getMapByAmount()[dish].toString(),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                bagProvider.addAllDish([dish]);
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
