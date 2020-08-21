import 'package:flutter/material.dart';

class JsonSchemaDialog extends StatefulWidget {
  final BuildContext context;
  final String title;
  final TextStyle titleStyle;
  final String btnText;
  final TextStyle btnTextStyle;
  final Function onButtonPressed;
  final List<String> listItems;
  final Function onListItemPressed;

  JsonSchemaDialog(
      {this.context,
      this.title,
      this.titleStyle,
      this.btnText,
      this.btnTextStyle,
      this.onButtonPressed,
      this.listItems,
      this.onListItemPressed});

  @override
  _JsonSchemaDialog createState() => new _JsonSchemaDialog();
}

class _JsonSchemaDialog extends State<JsonSchemaDialog> {
  @override
  Widget build(BuildContext context) {
    return new Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(children: <Widget>[
          Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(211, 211, 211, 1.0),
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(16),
                              topRight: const Radius.circular(16),
                            )),
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: widget.titleStyle,
                        )),
                    Flexible(
                      child: Container(
                        height: 200,
                        width: double.minPositive,
                        padding: EdgeInsets.fromLTRB(
                            0, 8.0, 0, 8.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: widget.listItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text(widget.listItems[index])),
                              ),
                              onTap: () {
                                Navigator.pop(context, widget.listItems[index]);
                              },
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      ),
                    ),
                    Container(
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(211, 211, 211, 1.0),
                            shape: BoxShape.rectangle,
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(16),
                              bottomRight: const Radius.circular(16),
                            )),
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: widget.onButtonPressed,
                          child: Text(
                            widget.btnText,
                            textAlign: TextAlign.center,
                            style: widget.btnTextStyle,
                          ),
                        )),
                  ]))
        ]));
  }
}
