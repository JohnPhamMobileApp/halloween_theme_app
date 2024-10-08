import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart'; // audio player

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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  bool _isTextVisible = false;
  late AnimationController _imageAnimationController;
  late Animation<double> _imageAnimation;
  late AnimationController _textController;
  late Animation<double> _scaleAnimation;
  final AudioPlayer _backgroundPlayer = AudioPlayer(); // AudioPlayer instance

  final List<Image> images = [
    Image.asset('assets/images/halloween.jpg', height: 50, width: 100),
    Image.asset('assets/images/ghost.jpg', height: 50, width: 100),
    Image.asset('assets/images/pumpkin.jpg', height: 50, width: 100),
    Image.asset('assets/images/bat.jpg', height: 50, width: 100),
  ];

  @override
  void initState() {
    super.initState();

    _imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _imageAnimation = Tween<double>(begin: 0, end: 300).animate(_imageAnimationController);

    _textController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_textController);

    // Start background music
    _playBackgroundMusic();
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    _textController.dispose();
    _backgroundPlayer.dispose(); // Dispose of the audio player
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
        _textController.forward();
      } else {
        _textController.reverse();
      }
    });
  }

  Future<void> _playBackgroundMusic() async {
    try {
      await _backgroundPlayer.setAsset('assets/audio/spooky.mp3');
      _backgroundPlayer.setLoopMode(LoopMode.one); // Loop the background music
      _backgroundPlayer.play();
    } catch (e) {
      print('Error playing background music: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
          AnimatedBuilder(
            animation: _imageAnimation,
            builder: (context, child) {
              return Stack(
                children: [
                  for (int i = 0; i < images.length; i++)
                    Positioned(
                      left: _imageAnimation.value + (i * 50),
                      top: 100 + (i * 50),
                      child: images[i],
                    ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _toggleText,
            tooltip: 'Show/Hide Animated Text',
            child: const Icon(Icons.text_fields),
          ),
        ],
      ),
    );
  }
}
