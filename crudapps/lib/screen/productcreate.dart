import 'package:crudapps/Api/Restcilent.dart';
import 'package:crudapps/screen/productgrid.dart';
import 'package:crudapps/style/style.dart';
import 'package:flutter/material.dart';

class Productcreate extends StatefulWidget {
  const Productcreate({super.key});

  @override
  State<Productcreate> createState() => _ProductcreateState();
}

class _ProductcreateState extends State<Productcreate> {
  Map<String, String> Formvalues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

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
      ProductcreateRequst(Formvalues);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                  onChanged: (Textvalue) {
                    Inputonchange("ProductName", Textvalue);
                  },
                  decoration: AppInput('Product Name ')),
              SizedBox(height: 15),
              TextFormField(
                  onChanged: (Textvalue) {
                    Inputonchange("ProductCode", Textvalue);
                  },
                  decoration: AppInput('Product Code')),
              SizedBox(height: 15),
              TextFormField(
                  onChanged: (Textvalue) {
                    Inputonchange("Img", Textvalue);
                  },
                  decoration: AppInput('Product img URL')),
              SizedBox(height: 15),
              AppDropDownStyle(
                DropdownButton(
                  value: Formvalues["Qty"],
                  items: [
                    DropdownMenuItem(
                      child: Text('Select QT'),
                      value: '',
                    ),
                    DropdownMenuItem(
                      child: Text('1 pc'),
                      value: '1 pc',
                    ),
                    DropdownMenuItem(
                      child: Text('2 pc'),
                      value: '2 pc',
                    ),
                    DropdownMenuItem(
                      child: Text('3 pc'),
                      value: '3 pc',
                    ),
                    DropdownMenuItem(
                      child: Text('4 Pc'),
                      value: '4 pc',
                    ),
                  ],
                  onChanged: (Textvalue) {
                    Inputonchange("Qty", Textvalue);
                  },
                  isExpanded: true,
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                  onChanged: (Textvalue) {
                    Inputonchange("UnitPrice", Textvalue);
                  },
                  decoration: AppInput('Unit Price')),
              SizedBox(height: 15),
              TextFormField(
                  onChanged: (Textvalue) {
                    Inputonchange("TotalPrice", Textvalue);
                  },
                  decoration: AppInput('Total Price')),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    FormOnsubmit();
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Productgridviwescreen()));
                  },
                  child: Text('Submit')
                  
                 
                  )
            ],
          ),
        ),
      ),
    );
  }
}
