// Row(
//                 children: [
//                   FlatButton(
//                     child: Text("Change URL"),
//                     onPressed: () =>
//                         _videoViewController.setStreamUrl(changeUrl),
//                   ),
//                   FlatButton(
//                       child: Text("+speed"),
//                       onPressed: () =>
//                           _videoViewController.setPlaybackSpeed(2.0)),
//                   FlatButton(
//                       child: Text("Normal"),
//                       onPressed: () =>
//                           _videoViewController.setPlaybackSpeed(1)),
//                   FlatButton(
//                       child: Text("-speed"),
//                       onPressed: () =>
//                           _videoViewController.setPlaybackSpeed(0.5)),
//                 ],
//               ),
//               Divider(height: 1),
//               Container(
//                 padding: EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text("position=" +
//                         _videoViewController.position.inSeconds.toString() +
//                         ", duration=" +
//                         _videoViewController.duration.inSeconds.toString() +
//                         ", speed=" +
//                         _videoViewController.playbackSpeed.toString()),
//                     Text(
//                         "ratio=" + _videoViewController.aspectRatio.toString()),
//                     Text("size=" +
//                         _videoViewController.size.width.toString() +
//                         "x" +
//                         _videoViewController.size.height.toString()),
//                     Text("state=" +
//                         _videoViewController.playingState.toString()),
//                   ],
//                 ),
//               ),
//               Divider(height: 1),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   RaisedButton(
//                     child: Text('Get Subtitle Tracks'),
//                     onPressed: () {
//                       _getSubtitleTracks();
//                     },
//                   ),
//                   RaisedButton(
//                     child: Text('Get Audio Tracks'),
//                     onPressed: () {
//                       _getAudioTracks();
//                     },
//                   )
//                 ],
//               ),
//               Divider(height: 1),
//               Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Flexible(
//                     flex: 1,
//                     child: RaisedButton(
//                       padding: EdgeInsets.all(5),
//                       child: Text(
//                         'Discover Cast Devices',
//                         style: TextStyle(fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                       onPressed: () async {
//                         await _videoViewController.startCastDiscovery();
//                         _scaffoldKey.currentState.showSnackBar(
//                             SnackBar(content: Text("Cast Discovery Started")));
//                         setState(() {
//                           getCastDeviceBtnEnabled = true;
//                         });
//                       },
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: RaisedButton(
//                       padding: EdgeInsets.all(5),
//                       child: Text(
//                         'Get Cast Devices',
//                         style: TextStyle(fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                       onPressed: !getCastDeviceBtnEnabled
//                           ? null
//                           : () {
//                               _getCastDevices();
//                             },
//                     ),
//                   ),
//                   Flexible(
//                     flex: 1,
//                     child: RaisedButton(
//                       padding: EdgeInsets.all(5),
//                       child: Text(
//                         'Stop Discovery',
//                         style: TextStyle(fontSize: 12),
//                         textAlign: TextAlign.center,
//                       ),
//                       onPressed: () async {
//                         await _videoViewController.stopCastDiscovery();
//                         _scaffoldKey.currentState.showSnackBar(
//                             SnackBar(content: Text("Cast Discovery Stopped")));
//                         setState(() {
//                           getCastDeviceBtnEnabled = false;
//                         });
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               Divider(height: 1),
//               image == null
//                   ? Container()
//                   : Container(child: Image.memory(image)),
