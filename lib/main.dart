import 'package:flutter/material.dart';
import 'package:flutter_dynamic_list_view/models/user.dart';
import 'package:flutter_dynamic_list_view/app/modules/home/views/home_view.dart';
import 'package:flutter_dynamic_list_view/user_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_dynamic_list_view/app/modules/home/controllers/home_controller.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  _MyFlutterListState createState() => _MyFlutterListState();
}

class _MyFlutterListState extends State<FirstRoute> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    void addUserData(User user) {
      setState(() {
        userList.add(user);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddUserDialog(addUserData),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: new Container(
        child: new Column(
          children: [
            new Container(
              child: ElevatedButton(
                child: const Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
              ),
            ),
            new Container(
              height: 400,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.all(4),
                    elevation: 8,
                    child: ListTile(
                      title: Text(
                        userList[index].username,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        userList[index].email,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        userList[index].phoneNo,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: userList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
