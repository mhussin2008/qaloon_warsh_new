import 'package:flutter/material.dart';
import 'index_data.dart';
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
  int pageNumber = 1;
  var dropdownvalue='إختر رقم الآية';
  List<String> ayaList=['إختر رقم الآية','البقرة   5','الأنفال   6','7','8'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        GestureDetector(onTap: (){
          setState(() {
            rewaya = !rewaya;
            current_rewaya = rewaya ? Qaloon_path : Warsh_path;
            current_title=rewaya ? Qaloon_title:Warsh_title;
          });
        },
            child: Image.asset(current_title),
        ) ,

        actions: [IconButton(icon: Image.asset('assets/icons/icons8-left-94.png'), onPressed: () { _pageGoForword(); })
        ,SizedBox(width: 40,),

          DropdownButton(

            // Initial Value
            value:  dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: ayaList.map((String items) {
              return DropdownMenuItem(
                alignment: Alignment.centerRight,
                value: items,
                child: Text(

                    items
                ,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                ),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (t){
              setState(() {
                dropdownvalue=t??ayaList[0];


              });
            }
          )



          ,SizedBox(width: 40,)
          ,IconButton(icon: Image.asset('assets/icons/icons8-right-94.png'), onPressed: () {_pageGoBack() ; })
          ,SizedBox(width: 40,),
        ],
        ),

      drawer: SafeArea(

        child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: suraNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(' ${suraPageNum[index]}'),
                            Expanded(
                                child: SizedBox(
                                    child: Text(
                                      suraNames[index],
                                      textAlign: TextAlign.right,
                                    )
                                )
                            ),

                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          pageNumber = suraPageNum[index] ;
                          //privacy=true;
                         // _makeFileName();
                        });
                        Navigator.pop(context);
                      });
                })),
      ),


      body: SafeArea(
        child: GestureDetector(
          onTap: (){print('tapped');},
          onTapUp: (dsd){
            print('tap up');
            print('${dsd.globalPosition.dx}  ${dsd.localPosition.dx}');
            print('${dsd.globalPosition.dy}  ${dsd.localPosition.dy}');


          },


          child: InteractiveViewer(
                                panEnabled: false,
                                child: Image.asset('$current_rewaya($pageNumber).jpg',)
                ),
        )





          // Dismissible(
          //
          //     onDismissed: (DismissDirection direction) {
          //       if (direction == DismissDirection.endToStart) {
          //         _pageGoBack();
          //       } else {
          //         _pageGoForword();
          //       }
          //     },
          //     key: ValueKey(pageNumber),
          //     resizeDuration: null,
          //     child: Center(
          //
          //         child: InteractiveViewer(
          //             panEnabled: false,
          //             child: Image.asset('$current_rewaya($pageNumber).jpg',))
          //     ),
          //   ),
          
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