import 'package:easy_pie_chart/easy_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:kfupm_bootcamp/item.dart';
import 'package:kfupm_bootcamp/list.dart';
import 'package:kfupm_bootcamp/pie_chart.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  BottomSheetApp({super.key});

  final List<Item> data = [];

  @override
  Widget build(BuildContext context) {

    final List<PieData> mm = [];
    const List<Color> colors = [
      Color.fromARGB(255, 249, 209, 88),
      Color.fromARGB(255, 250, 206, 197),
      Color.fromARGB(255, 209, 175, 148),
      Color.fromARGB(255, 153, 213, 224),
      Color.fromARGB(255, 136, 176, 77),
    ];

    for(int i=0; i<data.length; i++){
      mm.add(PieData(value: data[i].price, color: colors[i]));
    }
  

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        // body: BottomSheetExample(data: data),
        floatingActionButton: NewWidget(data: data),
        body: SingleChildScrollView(
          child: Column(
            children: [
              PieChart(
                data: mm,
              ),
              OurList(subscriptionItems: data),
            ],
          ),
        ),
      ),
    );
  }
}

// just copy paste the bottom stuff
class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.data,
  });

  final List<Item> data;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400,
              color: Colors.white,
              child: FormExample(data: data),
            );
          },
        );
      },
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  BottomSheetExample({super.key, required this.data});
  final List<Item> data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 500,
                color: Colors.white,
                child: FormExample(data: data),
              );
            },
          );
        },
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  FormExample({super.key, required this.data});

  List<Item> data;

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var name = TextEditingController();
  var price = TextEditingController();
  var date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(left: 50, right: 50, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: <Widget>[
            // todo Center this text 
            const Text('Add a new Subscription', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your subscription name',
              ),
              controller: name,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Name';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the subscription\'s price',
              ),
              controller: price,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Price';
                } //if (double.parse(value, (e)=> null) != null){
                //   return 'The price must be a number';
                // }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter the subscription\'s billing date',
              ),
              controller: date,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Date';
                }
                return null;
              },
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // todo add item to list
                    widget.data.add(Item(name.text, double.parse(price.text), date.text));
                    Navigator.pop(context);
                    setState(() {
                      
                    });
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
