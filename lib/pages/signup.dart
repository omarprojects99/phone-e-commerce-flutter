import 'package:act6/pages/product.dart';
import 'package:flutter/material.dart';
import 'user.dart'; 
import 'admin.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController telController = TextEditingController();

  
  static List<User> usersList = [];
  

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgs24.webp'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.brown[200],
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email), 
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        
                        
                        TextField(
                          controller: nomController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person), 
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        
                        
                        TextField(
                          controller: telController,
                          decoration: InputDecoration(
                            labelText: 'Telephone',
                            prefixIcon: Icon(Icons.phone_rounded), 
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        
                        
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 24),
                        
                        
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                },
                                child: Text(
                                  'I agree to the terms and conditions',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 24),
                        
                        
                        ElevatedButton(
                          onPressed: () {
                            String email = emailController.text;
                            String password = passwordController.text;
                            String name = nomController.text;
                            String phone = telController.text;

                            if (email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill in all fields')),
                              );
                            } else if (!_isChecked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please agree to the terms and conditions')),
                              );
                            } else {
                              
                              User newUser = User(
                                email: email,
                                password: password,
                                name: name,
                                phone: phone,
                              );
                              usersList.add(newUser);

                              
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductPage(),
                                ),
                              );
                            }
                          },
                          child: Text('Sign Up'),
                        ),
                        SizedBox(height: 16),
                        
                        
                        Center(
                          child: GestureDetector(
                            onTap: () {
                             
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Already have an account? Log In',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
