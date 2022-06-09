
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             brightness: Brightness.light,
//             backgroundColor: Colors.white,
//             title: Text(
//                 "FaceBook Clone",
//                 style: const TextStyle(
//                     color: Palette.facebookBlue,
//                     fontSize: 28.0,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: -1.2,
//               )
//             ),
//             centerTitle: false,
//             floating: true,
//             actions: [
//               Container(
//                 margin: const EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.search),
//                   iconSize: 30.0,
//                   color:
//                   Colors.black,
//                   onPressed: () {  },
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   shape: BoxShape.circle,
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.search),
//                   iconSize: 30.0,
//                   color:
//                   Colors.black,
//                   onPressed: () {  },
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomePageNavBar(
            actions: [
              CircleButton(
                iconSize: 30.0,
                icon: Icons.search,
                onPressed: (){
                  print("Search");
                },
              ),
              CircleButton(
                iconSize: 30.0,
                icon: MdiIcons.facebookMessenger,
                onPressed: (){
                  print("Search");
                },
              )
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser)
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers:onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index){
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length
            ),
          )
        ],
      ),
    );
  }
}