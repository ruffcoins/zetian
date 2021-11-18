import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/mixins/user_helper.dart';
import 'package:zetian/models/user/read/get_user_response.dart';
import 'package:zetian/partials/sidemenu.dart';
import 'package:zetian/providers/app_provider.dart';
import 'package:zetian/providers/user_provider.dart';
import 'package:zetian/screens/basic/users/user_detail.dart';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> with UserHelper{

  bool userList = true;
  List<User> userResult = [];

  @override
  void initState() {
    getAllUsers(Provider.of<AppProvider>(context, listen: false).dio,
        Provider.of<AppProvider>(context, listen: false).baseUrl, context);

    userResult = Provider.of<UserProvider>(context, listen: false).users;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Center(
          child: Text(
            'Users',
            textScaleFactor: 1.0,
            style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Montserrat',
                color: Colors.green,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      endDrawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/register');
        },
        tooltip: "Add a new user",
        child: Icon(Icons.add),
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return provider.isLoading ?
              Container(
                child: Center(child: CircularProgressIndicator()),
              )
                  :
              ListView.builder(
                  itemCount: userResult.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetail(user: userResult[index])));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Icon(Icons.accessibility_new_sharp),
                          title: Text(userResult[index].username?? "No name added"),
                          subtitle: Text(userResult[index].id!),
                        ),
                      ),
                    );
                  }
              );
            },
          );
        }
      ),
    );
  }
}
