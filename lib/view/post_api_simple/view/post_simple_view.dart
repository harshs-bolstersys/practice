import 'package:flutter/material.dart';
import 'package:practical/view/post_api_riverpod/view/home_view.dart';
import 'package:practical/view/post_api_simple/controller/post_simple_controller.dart';

class PostSimpleApiView extends StatefulWidget {
  const PostSimpleApiView({super.key});

  @override
  State<PostSimpleApiView> createState() => _PostSimpleApiViewState();
}

class _PostSimpleApiViewState extends State<PostSimpleApiView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Simple API')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameCtrl,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Username', border: OutlineInputBorder()),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _passwordCtrl,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await PostSimpleController().postApi(_usernameCtrl.text.trim(), _passwordCtrl.text.trim());
                      if (response.token != null && response.token!.isNotEmpty) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeView()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid credentials')));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white),
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
