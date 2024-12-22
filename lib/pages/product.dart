import 'package:flutter/material.dart';
import 'productdetail.dart'; 

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<Map<String, dynamic>> allProducts = [
    {
      'name': 'Samsung Galaxy',
      'category': 'phone',
      'price': 59.99,
      'image': 'assets/images/s24.jpg',
    },
    {
      'name': 'Samsung Galaxy',
      'category': 'phone',
      'price': 59.99,
      'image': 'assets/images/s24.jpg',
    },
    {
      'name': 'Samsung Galaxy',
      'category': 'phone',
      'price': 59.99,
      'image': 'assets/images/s24.jpg',
    },
    {
      'name': 'Samsung Watch',
      'category': 'Accessories',
      'price': 99.99,
      'image': 'assets/images/watch.jpg',
    },
    {
      'name': 'Samsung Watch',
      'category': 'Accessories',
      'price': 99.99,
      'image': 'assets/images/watch.jpg',
    },
    {
      'name': 'Samsung Watch',
      'category': 'Accessories',
      'price': 99.99,
      'image': 'assets/images/watch.jpg',
    },
    {
      'name': 'Samsung Tablet',
      'category': 'tablette',
      'price': 49.99,
      'image': 'assets/images/tab.webp',
    },
    {
      'name': 'Samsung Tablet',
      'category': 'tablette',
      'price': 49.99,
      'image': 'assets/images/tab.webp',
    },
    {
      'name': 'Samsung TV',
      'category': 'tv',
      'price': 499.99,
      'image': 'assets/images/tv.jpg',
    },
    {
      'name': 'Samsung TV',
      'category': 'tv',
      'price': 499.99,
      'image': 'assets/images/tv.jpg',
    },
  ];

  late List<Map<String, dynamic>> filteredProducts;
  TextEditingController searchController = TextEditingController();
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
    searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    setState(() {
      filteredProducts = allProducts
          .where((product) {
            bool matchesSearch = product['name']
                .toLowerCase()
                .contains(searchController.text.toLowerCase());
            bool matchesCategory = selectedCategory == 'All' ||
                product['category'] == selectedCategory;

            return matchesSearch && matchesCategory;
          })
          .toList();
    });
  }

  void _onCategoryChanged(String? value) {
    setState(() {
      selectedCategory = value!;
      _filterProducts();
    });
  }

  void _navigateToProductDetail(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for products...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 8),
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: _onCategoryChanged,
                  items: <String>['All', 'phone', 'tv', 'Accessories', 'tablette']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Profile Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context); 
                
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.8,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return GestureDetector(
              onTap: () => _navigateToProductDetail(product),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Category: ${product['category']}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(
                                fontSize: 14, color: Colors.green[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
