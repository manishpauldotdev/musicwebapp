import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool hasStartedPlaying = false;

  void startAudio() async {
    await audioPlayer.play(AssetSource('audio/upbeat-music.mp3'));
    setState(() {
      hasStartedPlaying = true;
      isPlaying = true;
    });
  }

  void togglePlayingStatus() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await audioPlayer.resume();
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveBuilder(builder: (context, deviceSize) {
                if (deviceSize.isTablet || deviceSize.isDesktop) {
                  return const SizedBox(
                    width: double.maxFinite,
                    height: 700,
                    child: Center(
                      child: Text('This music player is only designed for mobile view'),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Music'),
                          Text('237 Online'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.maxFinite, 56),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text('Back to Plinko'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tru Tones - Dancing (feat. Rog)',
                        style: TextStyle(fontSize: 22),
                      ),
                      const Text(
                        'Seth Pentalony',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 350,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 56,
                            width: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              color: Colors.black87,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.skip_previous_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              if (!hasStartedPlaying) {
                                startAudio();
                              } else {
                                togglePlayingStatus();
                              }
                            },
                            child: Container(
                              height: 56,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                              ),
                              child: Center(
                                child: Icon(
                                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            height: 56,
                            width: 100,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                              color: Colors.black87,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.skip_next_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.volume_mute),
                          const SizedBox(width: 8),
                          Container(
                            height: 6,
                            width: 150,
                            decoration: const BoxDecoration(color: Colors.black87),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.volume_up),
                        ],
                      ),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
