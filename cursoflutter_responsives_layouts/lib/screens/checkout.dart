import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/main_drawer.dart';
import 'package:panucci_ristorante/components/order_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  final List items = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  "Seu pedido",
                  style: TextStyle(
                      fontFamily: "Caveat",
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return OrderItem(
                  itemTitle: items[index]["name"],
                  itemPrice: items[index]["price"],
                  imageURI: items[index]["image"],
                );
              }, childCount: items.length),
            ),
          ],
        ),
      ),
    );
  }
}
