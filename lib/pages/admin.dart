import 'package:flutter/material.dart';
import 'user.dart'; 
import 'productObj.dart'; 

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
 
  final List<User> users = [
    User(email: 'user1@example.com', password: 'password1', name: 'User One', phone: '123456789'),
    User(email: 'user2@example.com', password: 'password2', name: 'User Two', phone: '987654321'),
    User(email: 'user3@example.com', password: 'password3', name: 'User Three', phone: '555123456'),
  ];

 
  List<Product> products = [
    Product(name: 'Produit 1', price: 19.99, imageUrl: 'assets/images/s24.jpg'),
    Product(name: 'Produit 2', price: 29.99, imageUrl: 'assets/images/tab.webp'),
    Product(name: 'Produit 3', price: 39.99, imageUrl: 'assets/images/tv.jpg'),
    Product(name: 'Produit 4', price: 49.99, imageUrl: 'assets/images/watch.jpg'),
  ];

  void _addProduct() {
    final _formKey = GlobalKey<FormState>();
    String name = '';
    String category = '';
    double price = 0.0;
    String imageUrl = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ajouter un produit'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nom du produit'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le nom du produit';
                      }
                      return null;
                    },
                    onSaved: (value) => name = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Catégorie'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer la catégorie';
                      }
                      return null;
                    },
                    onSaved: (value) => category = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Prix'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer le prix';
                      }
                      try {
                        double.parse(value);
                      } catch (_) {
                        return 'Veuillez entrer un prix valide';
                      }
                      return null;
                    },
                    onSaved: (value) => price = double.parse(value!),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'URL de l’image'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer une URL d’image';
                      }
                      return null;
                    },
                    onSaved: (value) => imageUrl = value!,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    products.add(Product(name: name, price: price, imageUrl: imageUrl));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Utilisateurs',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name),
                    subtitle: Text('Email: ${users[index].email}\nTéléphone: ${users[index].phone}'),
                    isThreeLine: true,
                    leading: Icon(Icons.person),
                  );
                },
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produits',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: _addProduct,
                    child: Text('Ajouter un produit'),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Image.asset(
                        products[index].imageUrl,
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          products[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('\$${products[index].price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
