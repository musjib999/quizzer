import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoPlay extends StatefulWidget {
  static const String id = 'VideoPlay';
  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  VlcPlayerController _videoViewController;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isPlaying = true;
  double sliderValue = 0.0;
  double currentPlayerTime = 0;
  double volumeValue = 100;
  String position = "";
  String duration = "";
  int numberOfCaptions = 0;
  int numberOfAudioTracks = 0;
  bool isBuffering = true;
  bool getCastDeviceBtnEnabled = false;

  final String urlToStreamVideo =
      'http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_1080p_60fps_normal.mp4';
  @override
  void initState() {
    _videoViewController = new VlcPlayerController(
      onInit: () {
        _videoViewController.play();
      },
    );
    _videoViewController.addListener(() {
      if (!this.mounted) return;
      if (_videoViewController.initialized) {
        var oPosition = _videoViewController.position;
        var oDuration = _videoViewController.duration;
        if (oDuration.inHours == 0) {
          var strPosition = oPosition.toString().split('.')[0];
          var strDuration = oDuration.toString().split('.')[0];
          position =
              "${strPosition.split(':')[1]}:${strPosition.split(':')[2]}";
          duration =
              "${strDuration.split(':')[1]}:${strDuration.split(':')[2]}";
        } else {
          position = oPosition.toString().split('.')[0];
          duration = oDuration.toString().split('.')[0];
        }
        sliderValue = _videoViewController.position.inSeconds.toDouble();
        numberOfCaptions = _videoViewController.spuTracksCount;
        numberOfAudioTracks = _videoViewController.audioTracksCount;

        switch (_videoViewController.playingState) {
          case PlayingState.PAUSED:
            setState(() {
              isBuffering = false;
            });
            break;

          case PlayingState.STOPPED:
            setState(() {
              isPlaying = false;
              isBuffering = false;
            });
            break;
          case PlayingState.BUFFERING:
            setState(() {
              isBuffering = true;
            });
            break;
          case PlayingState.PLAYING:
            setState(() {
              isBuffering = false;
            });
            break;
          case PlayingState.ERROR:
            setState(() {});
            print("Video an encountered error");
            break;
          default:
            setState(() {});
            break;
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _videoViewController.dispose();
    super.dispose();
  }
  //add listerners

  final double playerWidth = double.infinity;
  final double playerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: playerHeight,
                    width: playerWidth,
                    child: Stack(
                      children: [
                        new VlcPlayer(
                          aspectRatio: 16 / 9,
                          url: urlToStreamVideo,
                          options: [
                            '--quiet',
//                '-vvv',
                            '--no-drop-late-frames',
                            '--no-skip-frames',
                            '--rtsp-tcp',
                          ],
                          controller: _videoViewController,
                          placeholder: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        Positioned(
                          top: 45,
                          left: 15,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xff2c3e50),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 1,
                        child: FlatButton(
                          child: isPlaying
                              ? Icon(Icons.pause_circle_outline)
                              : Icon(Icons.play_circle_outline),
                          onPressed: () => {
                            playOrPauseVideo(),
                          },
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(position),
                            Expanded(
                              child: Slider(
                                activeColor: Colors.red,
                                value: sliderValue,
                                min: 0.0,
                                max: _videoViewController.duration == null
                                    ? 1.0
                                    : _videoViewController.duration.inSeconds
                                        .toDouble(),
                                onChanged: (progress) {
                                  setState(() {
                                    sliderValue = progress.floor().toDouble();
                                  });
                                  //convert to Milliseconds since VLC requires MS to set time
                                  _videoViewController.setTime(
                                    sliderValue.toInt() * 1000,
                                  );
                                },
                              ),
                            ),
                            Text(duration),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      //milli
                      _videoViewController.setTime(
                        sliderValue.toInt() * 1000,
                      );
                    },
                    child: Text('Test'),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {
                        setState(() {
                          _videoViewController.setStreamUrl(
                              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                        });
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Understanding Ai'),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Electromagnetic Equation '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Data and Science '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Tensor Flow '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Magic Data  '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Cool MubiXy theorem '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Cool MubiXy theorem pt2 '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Awesome MubiXy Facts '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Quadratic With Data '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                    ListTile(
                      onLongPress: () {
                        _videoViewController.setStreamUrl(
                            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
                      },
                      leading: Image.network(
                          'https://i2.wp.com/p4fcourses.com/wp-content/uploads/2020/01/iOS-13-Swift-5-%E2%80%93-The-Complete-iOS-App-Development-Bootcamp-free-download.png?w=750&ssl=1'),
                      title: Text('Conclusion  '),
                      trailing: Text('5:20'),
                      subtitle: Text('Some relevant info ...'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void playOrPauseVideo() {
    String state = _videoViewController.playingState.toString();

    if (state == "PlayingState.PLAYING") {
      _videoViewController.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _videoViewController.play();
      setState(() {
        isPlaying = true;
      });
    }
  }
}
