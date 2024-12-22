import 'package:flutter/material.dart';
import 'product.dart'; 
import 'signup.dart'; 
import 'admin.dart';  

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
             
              
              Expanded(
                child: Center(
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
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock), 
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 24),
                              
                              
                              ElevatedButton(
                                onPressed: () {
                                  String email = emailController.text;
                                  String password = passwordController.text;

                                  if (email.isEmpty || password.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Please fill in all fields')),
                                    );
                                  } else {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductPage(),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Log In'),
                              ),
                              SizedBox(height: 16),
                              
                              
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(), 
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Don\'t have an account? Sign Up',
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
              ),
              
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Go to Admin Page',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
