//https://github.com/ninghao/ninghao_flutter 

import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation Menu',
          //   onPressed: () {
          //     print('Navigation');
          //   },
          // ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Navigation Search',
              onPressed: () {
                print('Navigation');
              },
            ),
          ],
          title: Text('Tab标签'),
          elevation: 0.0, //控制阴影效果
          bottom: TabBar(
            //控制未选中样式
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_activity),
              ),
              Tab(
                icon: Icon(Icons.local_airport),
              ),
              Tab(
                icon: Icon(Icons.local_car_wash),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(
              Icons.local_activity,
              size: 128.0,
              color: Colors.yellow,
            ),
            Icon(
              Icons.local_airport,
              size: 128.0,
              color: Colors.yellow,
            ),
            Icon(
              Icons.local_car_wash,
              size: 128.0,
              color: Colors.yellow,
            ),
          ],
        ),
        //侧滑  endDrawer:  右边侧滑
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(
                  'name 123',
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),
                accountEmail: Text('13691365870@126.com',style: TextStyle(color: Colors.black),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.baidu.com/img/bd_logo1.png?qua=high&where=super'),
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow[400],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3198076584,1834164813&fm=26&gp=0.jpg'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.yellow[400].withOpacity(0.6),
                               BlendMode.hardLight)
                        ),
                  ),

                //  DrawerHeader(
                //    child: Text('header'.toUpperCase()),
                //    decoration: BoxDecoration(
                //      color: Colors.grey[100]
                //    ),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text('Message', textAlign: TextAlign.right),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
