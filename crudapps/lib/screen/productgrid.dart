import 'package:crudapps/screen/ProductUpdate.dart';
import 'package:crudapps/screen/productcreate.dart';
import 'package:flutter/material.dart';

import '../Api/Restcilent.dart';
import '../style/style.dart';

class Productgridviwescreen extends StatefulWidget {
  const Productgridviwescreen({super.key});

  @override
  State<Productgridviwescreen> createState() => _ProductgridviwescreenState();
}

class _ProductgridviwescreenState extends State<Productgridviwescreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    calldata();
    super.initState();
  }

  calldata() async {
    Loading = true;
    var data = await Productgridviwe();

    setState(() {
      ProductList = data;
    });
  }

  deletaitem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text('Alert Box'),
            content: Text('Do you want deleta This Product'),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    await productdelete(id);

                    await calldata();
                  },
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No')),
            ],
          );
        });
  }

  Gotoupdate(context,productitem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductUpdatescreen(productitem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await calldata();
        },
        child: Container(
          child: GridView.builder(
              gridDelegate: ProductgridViwe(),
              itemCount: ProductList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            //  Image.network(ProductList[index]["img"]),

                            Text("Product Name: " +
                                ProductList[index]['ProductName']),

                            SizedBox(
                              height: 10,
                            ),
                            Text("Price: " + ProductList[index]['TotalPrice']),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Gotoupdate(context,ProductList[index]);
                                    },
                                    child: Icon(Icons.update)),
                                SizedBox(
                                  width: 25,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      deletaitem(ProductList[index]['_id']);
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Productcreate()));
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
