import 'dart:convert';
import 'package:demo/view/custompullrefresh/custom_pull_refresh.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class UserList extends StatefulWidget {
  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final String apiUrl = "https://randomuser.me/api/?results=10";
  List<dynamic> _users = [];

  Future<void> fetchUsers() async {
    var result = await http.get(apiUrl);
    setState(() {
      if (result.statusCode == 200) {
        _users = json.decode(result.body)['results'];
      }
    });
  }

  String _name(dynamic user) {
    return user['name']['title'] +
        " " +
        user['name']['first'] +
        " " +
        user['name']['last'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  Widget _buildList() {
    return _users.length == 0
        ? Center(child: Lottie.asset('lib/30426-ic-cogs.json'))
        : CustomPullToRefreshIndicator(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  _users[index]['picture']['large'])),
                          title: Text(_name(_users[index])),
                          subtitle: Text(_location(_users[index])),
                          trailing: Text(_age(_users[index])),
                        )
                      ],
                    ),
                  );
                }),
            onRefresh: _getData,
          );
  }

  Future<void> _getData() async {
    await fetchUsers();
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: Container(
        child: _buildList(),
      ),
    );
  }
}
