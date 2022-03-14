import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/pages/showproduct.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _type = TextEditingController();

  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');
  Future<void> addProduct() {
    return products
        .add({
          'product_name': _name.text,
          'price': _price.text,
          'product_type': _type.text,
        })
        .then((value) => print("Product data has been successfully"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 30),
              child: const Text(
                'เพิ่มข้อมูลสินค้า',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            formfield(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView formfield(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 170),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'Product name',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _price,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _type,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      label: Text(
                        'Product Type',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'บันทึกข้อมูล',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color.fromARGB(255, 238, 204, 231),
                        child: IconButton(
                            color: Colors.pink,
                            onPressed: () {
                              addProduct();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ShowProductPage(),
                                ),
                              ).then((value) => setState(() {}));
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}