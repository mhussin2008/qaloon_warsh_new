import 'package:flutter/material.dart';
// import 'package:zoom_widget/zoom_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key,
   // required this.title
  });
  // final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String Qaloon_path = 'assets/qaloon/Kaloon- ';
  String Warsh_path = 'assets/warsh/warsh- ';
  String Qaloon_title='assets/frames/qaloon.jpg';
  String Warsh_title='assets/frames/warsh.jpg';
  String current_title='assets/frames/qaloon.jpg';

  bool rewaya = true;
  String current_rewaya = 'assets/qaloon/Kaloon- ';
  int pageNumber = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
          Image.asset(current_title) ,
            SizedBox(height: 20,)
            ,
          Dismissible(

              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  _pageGoBack();
                } else {
                  _pageGoForword();
                }
              },
              key: ValueKey(pageNumber),
              resizeDuration: null,
              child: Center(

                  child: InteractiveViewer(
                      panEnabled: false,
                      child: Image.asset('$current_rewaya($pageNumber).jpg',))
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(onPressed: () {
        setState(() {
          rewaya = !rewaya;
          current_rewaya = rewaya ? Qaloon_path : Warsh_path;
          current_title=rewaya ? Qaloon_title:Warsh_title;
        });
      }, icon:Icon(
          size:40,
          Icons.account_circle_rounded),

      ),
    );
  }


  void _pageGoBack() {
    if (pageNumber< 2) {
      return;
    }
    setState(() {
      pageNumber--;
      //_makeFileName();
    });
  }

  void _pageGoForword() {
    if (pageNumber>603) {
      return;
    }
    setState(() {
      pageNumber++;
      //_makeFileName();
    });

  }


}