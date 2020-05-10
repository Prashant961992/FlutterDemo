import 'package:demo/AppConstant/MarginsConstant.dart';
import 'package:demo/Controls/MultiSelectionListData.dart';
import 'package:flutter/material.dart';

class MultiSelectionAlert extends StatelessWidget {
  List<CountryList> listData;

  MultiSelectionAlert({
    this.listData
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 1.0,
      backgroundColor: Colors.transparent,
      content: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          width: 50,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        flex: 9,
                        child: SingleChildScrollView(
                          child: Text('What is Lorem Ipsum?',
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal[200],
                )),
            Expanded(
                flex: 7,
                child: Container(
                  height: MediaQuery.of(context)
                      .size
                      .height, // Change as per your requirement
                  width: MediaQuery.of(context).size.width,
                  color: Colors.teal[100],
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.transparent,
                        // margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        // height: 50,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text("Hello"),
                              trailing: Checkbox(
                                value: false,
                                onChanged: (bool value) {
                                  // setState(() {
                                  //     monVal = value;
                                  // });
                                },
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              height: 1,
                              indent: 15,
                              endIndent: 0,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.teal[200],
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Color(0x00000000),
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {},
                          color: Colors.lightBlueAccent,
                          child: Text('Submit',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
