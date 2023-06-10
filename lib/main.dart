import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: pomenu_drawer(),
    debugShowCheckedModeBanner: false,
  ));
}

class pomenu_drawer extends StatefulWidget {
  const pomenu_drawer({Key? key}) : super(key: key);

  @override
  State<pomenu_drawer> createState() => _pomenu_drawerState();
}

class _pomenu_drawerState extends State<pomenu_drawer> with SingleTickerProviderStateMixin{
  String str = "Start";
  int Cur_indx=0;

  TabController ?tabcontorll;
  PageController?pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontorll=TabController(initialIndex: Cur_indx,length: 4, vsync: this);


  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Column(children: [
          UserAccountsDrawerHeader(
              accountName: Text("Alpa"), accountEmail: Text("alpa@gmail.com")),
          Expanded(
            child: Container( color: Colors.white,
              child: ListView(
                children: [
                  ListTile(title: Text("One"),onTap: () {
                    str = "one";
                      tabcontorll?.animateTo(Cur_indx);
                      pageController!.jumpToPage(Cur_indx);
                      setState(() {});

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(title: Text("Two"), onTap: () {str = "two";
                  tabcontorll?.animateTo(1);

                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(title: Text("Three"), onTap: () {str = "three";
                  tabcontorll?.animateTo(2);
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),ListTile(title: Text("Four"), onTap: () {str = "four";
                  tabcontorll?.animateTo(3);
                  setState(() {});
                  Navigator.pop(context);
                  },
                  )
                ],
              ),
            ),
          )
        ]),
        appBar: AppBar(
          title: Text("Demo"),
          actions: [
              PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(value: "one", child: Text("One"),
                  onTap: () {
                    str = "one";


                    setState(() {});
                  },
                ),
                PopupMenuItem(value: "two", child: Text("Two"),
                  onTap: () {
                    str = "two";

                    setState(() {});
                  },
                ),
                PopupMenuItem(value: "three", child: Text("Three"),
                  onTap: () {
                    str = "three";

                    setState(() {});
                  },
                ),
                PopupMenuItem(value: "four", child: Text("Four"),
                  onTap: () {
                    str = "four";
                    tabcontorll!.animateTo(3);
                    setState(() {});
                  },
                )
              ],
            )
          ],
          bottom: TabBar(onTap: (value) {

            setState(() {
              Cur_indx=value;
              //print("Tab:${Cur_indx}");

            });
          }, controller: tabcontorll, tabs: [
            Tab(child: Text("One"),),
            Tab(child: Text("Two"),),
            Tab(child: Text("Three"),),
            Tab(child: Text("Four"),)
          ]),
        ),
         body: //Center(
        //     child: Text(
        //   "$str",
        //   style: TextStyle(fontSize: 50),
        // )),
        TabBarView(

            controller: tabcontorll,children: [ One(Cur_indx),Two(Cur_indx),Three(Cur_indx),Four(Cur_indx)]),

        //  PageView(onPageChanged: (value) {
        //    setState(() {
        //      Cur_indx=value;
        //      tabcontorll!.animateTo(Cur_indx);
        //    });
        //  },controller: pageController ,
        //    children: [
        //    One(Cur_indx),Two(Cur_indx),Three(Cur_indx),Four(Cur_indx)],
        // ),

        bottomNavigationBar: BottomNavigationBar( type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.blue,currentIndex: Cur_indx,
          onTap: (Cur_indx) {
          //print("bottom;${Cur_indx}");
           this.Cur_indx=Cur_indx;
          //Cur_indx=value;
          tabcontorll!.animateTo(Cur_indx);
          setState(() {});

        },selectedItemColor: Colors.black,iconSize: 40,items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: "one",backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarms_sharp),label: "Two",backgroundColor: Colors.blue),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo_outlined),label: "Three",backgroundColor: Colors.green),
          BottomNavigationBarItem(icon: Icon(Icons.add_call),label: "Four",backgroundColor: Colors.pink),
        ]),
      ),
    );

  }
  void ontapped(int value){
    setState(() {
      Cur_indx=value;
      print("Page:${value}");
    });
    pageController?.jumpToPage(value);

  }/*void tabcontroller(int value){

    setState(() {
      Cur_indx=value;
    });
    tabcontroller

  }*/

}

class One extends StatelessWidget {
  // const One({Key? key}) : super(key: key);
  int cur_index;
  One(this.cur_index);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade900,
      width: double.infinity,
      height: double.infinity,
      child: Text("One$cur_index"),
    );
  }
}

class Two extends StatelessWidget {
  //const Two({Key? key}) : super(key: key);
  int cur_index;
  Two(this.cur_index);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.blue,
      width: double.infinity,
      height: double.infinity,
      child: Text("Two$cur_index"),
    );
  }
}

class Three extends StatelessWidget {
  //const Three({Key? key}) : super(key: key);
  int cur_index;
  Three(this.cur_index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: double.infinity,
      child: Text("Three$cur_index"),
    );
  }
}

class Four extends StatelessWidget {
  //const Four({Key? key}) : super(key: key);
  int cur_index;
  Four(this.cur_index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      width: double.infinity,
      height: double.infinity,
      child: Text("Four$cur_index"),
    );
  }
}



