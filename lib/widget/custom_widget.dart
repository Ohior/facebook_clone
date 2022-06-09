

import 'package:facebook_clone/config/config.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widget/widgets.dart';
import 'package:flutter/material.dart';

class HomePageNavBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  const HomePageNavBar({Key? key, this.title = "FaceBook Alt", required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      title: Text(
          title,
          style: const TextStyle(
            color: Palette.facebookBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          )
      ),
      centerTitle: false,
      floating: true,
      actions: actions,
    );
  }
}

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  Function() onPressed;
  CircleButton({Key? key, required this.icon, required this.iconSize, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
        onPressed: onPressed,
      ),
    );
  }
}

class CusFlatButton extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final IconData icon;
  final Color color;
  const CusFlatButton({Key? key, required this.title, required this.icon, required this.color, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: color,),
        label: Text(title),
      ),
    );
  }
}

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl,),
              const SizedBox(width: 8.0,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: "What's happen today?"),
                ),
              ),
            ],
          ),
          const Divider(thickness: 0.5, height: 10.0,),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CusFlatButton(
                  title: "Live",
                  icon: Icons.videocam,
                  color: Colors.red,
                  onPressed: (){},
                ),
                const VerticalDivider(width: 20.0,),
                CusFlatButton(
                  title: "Photos",
                  icon: Icons.photo_library,
                  color: Colors.green,
                  onPressed: (){},
                ),
                const VerticalDivider(width: 20.0,),
                CusFlatButton(
                  title: "Room",
                  icon: Icons.video_call,
                  color: Colors.purpleAccent,
                  onPressed: (){},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index){
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index-1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true,),
          );
        }
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("Create Room"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0)
      ),
      color: Colors.white,
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent),
      textColor: Palette.facebookBlue,
      
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
              child: Icon(Icons.video_call, size: 35.0, color: Colors.white,)
          ),
          const SizedBox(width: 4.0,),
          Text("Create\nRoom")
        ],
      ),
    );
  }
}



