import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HALLOWEEN THEME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _isTextVisible = false; // Track visibility of animated text
  late AnimationController _controller; // Animation controller
  late Animation<double> _scaleAnimation; // Scale animation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleText() {
    setState(() {
      _isTextVisible = !_isTextVisible;
      if (_isTextVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/halloween.jpg'), // child
            const Text(
              'TRAPS SET OFF:',
              style: TextStyle(color: Colors.orange), // Set text color to orange
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.orange), // Set text color to orange
            ),
            // Animated text
            ScaleTransition(
              scale: _scaleAnimation,
              child: Opacity(
                opacity: _isTextVisible ? 1.0 : 0.0,
                child: const Text(
                  'XD Happy Halloween! T_T\n YOU FOUND IT!!!',
                  style: TextStyle(fontSize: 24, color: Colors.orange), // Text style
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16), // Space between buttons
          FloatingActionButton(
            onPressed: _toggleText, // Button to toggle animated text
            tooltip: 'Show/Hide Animated Text',
            child: const Icon(Icons.text_fields),
          ),
        ],
      ),
    );
  }
}
