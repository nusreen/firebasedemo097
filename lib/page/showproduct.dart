import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/pages/addproducts.dart';
import 'package:firebasedemo/pages/editproduct.dart';
import 'package:flutter/material.dart';

class ShowProductPage extends StatefulWidget {
  const ShowProductPage({Key? key}) : super(key: key);

  @override
  _ShowProductPageState createState() => _ShowProductPageState();
}

class _ShowProductPageState extends State<ShowProductPage> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  Future<void> deleteProduct({required String id}) {
    return products
        .doc(id)
        .delete()
        .then((value) => print("Deleted data Successfully"))
        .catchError((error) => print("Failed to delete user: $error"));
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
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 100),
              child: Text(
                'สินค้าทั้งหมด',
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            showlist(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(),
              ),
            ).then((value) => setState(() {}));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget showlist() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Products').snapshots(),
      // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      builder: (context, snapshot) {
        List<Widget> listMe = [];
        if (snapshot.hasData) {
          var products = snapshot.data;
          listMe = [
            Column(
              children: products!.docs.map((DocumentSnapshot doc) {
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProductPage(id: doc.id),
                        ),
                      ).then((value) => setState(() {}));
                    },
                    title: Text(
                      '${data['product_name']}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 236, 114, 155)),
                    ),
                    subtitle: Text('${data['price']}' + ' THB'),
                    trailing: IconButton(
                      onPressed: () {
                        var alertDialog = AlertDialog(
                          title: const Text('ยืนยันการลบข้อมูลสินค้า'),
                          content: Text(
                              'คุณต้องการลบสินค้า ${data['product_name']} ใช่หรือไม่'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('ยกเลิก')),
                            TextButton(
                                onPressed: () {
                                  deleteProduct(id: doc.id)
                                      .then((value) => Navigator.pop(context));
                                },
                                child: const Text(
                                  'ยืนยัน',
                                  style: TextStyle(color: Colors.red),
                                )),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) => alertDialog,
                        );
                      },
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ];
        }
        return Center(
          child: Column(
            children: listMe,
          ),
        );
      },
    );
  }

  Container txt() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: const Text(
        'Products list',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}