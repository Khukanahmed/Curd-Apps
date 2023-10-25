import 'package:crudapps/Api/Restcilent.dart';
import 'package:crudapps/style/style.dart';
import 'package:flutter/material.dart';

class ProductUpdatescreen extends StatefulWidget {
  final Map productitem;
  const ProductUpdatescreen(this.productitem);

  @override
  State<ProductUpdatescreen> createState() => _ProductUpdatescreenState();
}

class _ProductUpdatescreenState extends State<ProductUpdatescreen> {
  Map<String, String> Formvalues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  @override
  void initState() {
    setState(() {
      Formvalues.update('Img', (value) => widget.productitem['Img']);
      Formvalues.update(
          'ProductCode', (value) => widget.productitem['ProductCode']);
      Formvalues.update(
          'ProductName', (value) => widget.productitem['ProductName']);
      Formvalues.update('Qty', (value) => widget.productitem['Qty']);
      Formvalues.update(
          'TotalPrice', (value) => widget.productitem['TotalPrice']);
      Formvalues.update(
          'UnitPrice', (value) => widget.productitem['UnitPrice']);
      super.initState();
    });
  }

  Inputonchange(key, Textvalue) {
    setState(() {
      Formvalues.update(key, (value) => Textvalue);
    });
  }

  FormOnsubmit() {
    if (Formvalues['ProductName']!.length == 0) {
      errorMassage('Input ProductName');
    } else if (Formvalues['ProductCode']!.length == 0) {
      errorMassage('Input ProductCode');
    } else if (Formvalues['Img']!.length == 0) {
      errorMassage('Input Img');
    } else if (Formvalues['Qty']!.length == 0) {
      errorMassage('Input Qty');
    } else if (Formvalues['TotalPrice']!.length == 0) {
      errorMassage('Input TotalPrice');
    } else if (Formvalues['UnitPrice']!.length == 0) {
      errorMassage('Input UnitPrice');
    } else {
      ProductUpdateRequst(Formvalues,widget.productitem['_id']);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  initialValue: Formvalues['ProductName'],
                  onChanged: (Textvalue) {
                    Inputonchange("ProductName", Textvalue);
                  },
                  decoration: AppInput('Product Name ')),
              SizedBox(height: 15),
              TextFormField(
                  initialValue: Formvalues['ProductCode'],
                  onChanged: (Textvalue) {
                    Inputonchange("ProductCode", Textvalue);
                  },
                  decoration: AppInput('Product Code')),
              SizedBox(height: 15),
              TextFormField(
                  initialValue: Formvalues['Img'],
                  onChanged: (Textvalue) {
                    Inputonchange("Img", Textvalue);
                  },
                  decoration: AppInput('Product img URL')),
              SizedBox(height: 15),
              // AppDropDownStyle(
                
              //   DropdownButton(
                  
              //     value: Formvalues["Qty"],
              //     items: [
              //       DropdownMenuItem(
              //         child: Text('Select QT'),
              //         value: '',
              //       ),
              //       DropdownMenuItem(
              //         child: Text('1 pc'),
              //         value: '1 pc',
              //       ),
              //       DropdownMenuItem(
              //         child: Text('2 pc'),
              //         value: '2 pc',
              //       ),
              //       DropdownMenuItem(
              //         child: Text('3 pc'),
              //         value: '3 pc',
              //       ),
              //       DropdownMenuItem(
              //         child: Text('4 Pc'),
              //         value: '4 pc',
              //       ),
              //     ],
              //     onChanged: (Textvalue) {
              //       Inputonchange("Qty", Textvalue);
              //     },
              //     underline: Container(),
              //     isExpanded: true,
              //   ),
              // ),
              SizedBox(height: 15),
              TextFormField(
                  initialValue: Formvalues['UnitPrice'],
                  onChanged: (Textvalue) {
                    Inputonchange("UnitPrice", Textvalue);
                  },
                  decoration: AppInput('Unit Price')),
              SizedBox(height: 15),
              TextFormField(
                  initialValue: Formvalues['TotalPrice'],
                  onChanged: (Textvalue) {
                    Inputonchange("TotalPrice", Textvalue);
                  },
                  decoration: AppInput('Total Price')),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    FormOnsubmit();
                    Navigator.pop(context);
                  },
                  child: Text('   Update  '))
            ],
          ),
        ),
      ),
    );
  }
}
