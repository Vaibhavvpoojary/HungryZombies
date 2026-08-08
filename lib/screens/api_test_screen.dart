import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  String result = 'Testing API...';

  @override
  void initState() {
    super.initState();
    testApi();
  }

  Future<void> testApi() async {
    try {
      final data = await ApiService.getRestaurantMenu(1);

      setState(() {
        result = data.toString();
      });
    } catch (e) {
      setState(() {
        result = 'ERROR: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Test'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(result),
      ),
    );
  }
}