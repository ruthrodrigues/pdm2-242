import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/cart.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    // Aqui estamos escutando o CartModel
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Consumer escuta as mudanças do modelo CartModel
            Consumer<CartModel>(
              builder: (context, cart, child) {
                String itemList = '';
                int total = 0;

                // Iterando sobre os itens no carrinho
                for (var item in cart.items) {
                  itemList += '${item.name} - \$${item.price} + ';
                  total += item.price;
                }

                // Removendo o último " + "
                if (itemList.isNotEmpty) {
                  itemList = itemList.substring(0, itemList.length - 2);
                }

                // Exibindo a lista e o total calculado no SnackBar
                final snackBarMessage = '$itemList = Total \$${total}';

                return Row(
                  children: [
                    Text('\$${total}', style: hugeStyle),
                    const SizedBox(width: 24),
                    FilledButton(
                      onPressed: () {
                        // Exibe o SnackBar com o total de itens e o nome do aluno
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$snackBarMessage\nAluno:  Ruth Rodrigues'),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.white),
                      child: const Text('BUY'),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
