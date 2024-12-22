import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  String selectedColor = ''; 

  @override
  Widget build(BuildContext context) {
    
    final Map<String, Color> colors = {
      'Red': Colors.red,
      'Blue': Colors.blue,
      'Green': Colors.green,
      'Black': Colors.black,
      'White': Colors.white,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Image.asset(
                widget.product['image'],
                height: 450,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              
              Text(
                widget.product['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              
              Text(
                'Category: ${widget.product['category']}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              
              Text(
                '\$${widget.product['price']}',
                style: TextStyle(fontSize: 20, color: Colors.green[700]),
              ),
              SizedBox(height: 16),
              
              Text(
                'Choose a Color:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: colors.keys.map((colorName) {
                  return RadioListTile<String>(
                    title: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: colors[colorName],
                        border: Border.all(
                          color: Colors.grey, 
                          width: 1,
                        ),
                      ),
                    ),
                    value: colorName,
                    groupValue: selectedColor,
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              
              Text(
                'deeeesscriiiiiptionnnnnnnnnnn.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: () {
                  if (selectedColor.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added ${widget.product['name']} in $selectedColor to cart')),
                    );
                   
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a color!')),
                    );
                  }
                },
                child: Text('Add to Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
