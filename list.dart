import 'package:flutter/material.dart';
import 'package:kfupm_bootcamp/item.dart';

const List<Color> colors = [
      Color.fromARGB(255, 249, 209, 88),
      Color.fromARGB(255, 250, 206, 197),
      Color.fromARGB(255, 209, 175, 148),
      Color.fromARGB(255, 153, 213, 224),
      Color.fromARGB(255, 136, 176, 77),
    ];

class OurList extends StatefulWidget {
  const OurList({super.key, required this.subscriptionItems});

  final List<Item> subscriptionItems;

  @override
  State<OurList> createState() => _OurListState();
}

class _OurListState extends State<OurList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.subscriptionItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.circle, color: colors[index],),
          title: Text(widget.subscriptionItems[index].name),
          trailing: Text(
            '\$${widget.subscriptionItems[index].price.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Date: ${widget.subscriptionItems[index].billingDate.toString()}',
          ),
        );
      },
    );
  }
}
