import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Halloween Theme',
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

<<<<<<< HEAD
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  bool _isTextVisible = false; // Track visibility of animated text
  late AnimationController _imageAnimationController; // Animation controller for images
  late Animation<double> _imageAnimation; // Animation for images
  late AnimationController _textController; // Animation controller for text
  late Animation<double> _scaleAnimation; // Scale animation for text

  final List<Image> images = [
    Image.asset('assets/images/halloween.jpg', height: 50, width: 100, errorBuilder: (context, error, stackTrace) {
      return const Text('Image not found');
    }),
    Image.asset('assets/images/ghost.jpg', height: 50, width: 100, errorBuilder: (context, error, stackTrace) {
      return const Text('Image not found');
    }),
    Image.asset('assets/images/pumpkin.jpg', height: 50, width: 100, errorBuilder: (context, error, stackTrace) {
      return const Text('Image not found');
    }),
    Image.asset('assets/images/bat.jpg', height: 50, width: 100, errorBuilder: (context, error, stackTrace) {
      return const Text('Image not found');
    }),
  ];
=======
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  bool _isTextVisible = false; // Track visibility of animated text
  late AnimationController _controller; // Animation controller
  late Animation<double> _scaleAnimation; // Scale animation
>>>>>>> de5e79ad331caed5cedf0a3a385d56ac830f0e8a

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD

    // Animation controller for moving images
    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _imageAnimation = Tween<double>(begin: 0, end: 300).animate(_imageAnimationController);

    // Animation controller for text
    _textController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);
=======
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
>>>>>>> de5e79ad331caed5cedf0a3a385d56ac830f0e8a
  }

  @override
  void dispose() {
<<<<<<< HEAD
    _imageAnimationController.dispose();
    _textController.dispose();
=======
    _controller.dispose();
>>>>>>> de5e79ad331caed5cedf0a3a385d56ac830f0e8a
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
<<<<<<< HEAD
        _textController.forward();
      } else {
        _textController.reverse();
=======
        _controller.forward();
      } else {
        _controller.reverse();
>>>>>>> de5e79ad331caed5cedf0a3a385d56ac830f0e8a
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
<<<<<<< HEAD
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'TRAPS SET OFF:',
                  style: TextStyle(color: Colors.orange),
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.orange),
                ),
                // Animated text
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: Opacity(
                    opacity: _isTextVisible ? 1.0 : 0.0,
                    child: const Text(
                      'XD Happy Halloween! T_T\n YOU FOUND IT!!!',
                      style: TextStyle(fontSize: 24, color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Animated images
          AnimatedBuilder(
            animation: _imageAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  for (int i = 0; i < images.length; i++)
                    Positioned(
                      left: _imageAnimation.value + (i * 50), // Offset for separation
                      top: 100 + (i * 50), // Change the vertical position for variety
                      child: images[i],
                    ),
                ],
              );
            },
          ),
        ],
=======
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
>>>>>>> de5e79ad331caed5cedf0a3a385d56ac830f0e8a
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