import 'package:flutter/material.dart';
import 'package:flutter_system/utils/net_utils.dart';
import 'dart:convert' as convert;
class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollPhysics _physicsType;

  ScrollController _controller;



  Map _lists ={};
  void _getReadMeTest() {
    
    Map<String,dynamic> param={
      "infoType":"mem",
      "type":"crystalCluster"
      };
       
 
    NetUtils.post('http://192.168.125.1:8080/readMe',param).then((res) => {  // 这里get后面是根据前面封装的请求来写的，自行替换url和参数
         
          setState(() {
            // print(res);
            _lists = convert.jsonDecode(res); // 把从接口获取的列表赋值到_list
          })
        });
  }


  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    this._getReadMeTest();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              onPressed: () async {
                _physicsType = await showMenu<ScrollPhysics>(
                  context: context,
                  position: RelativeRect.fromLTRB(160, 100, 0, 0),
                  items: [
                    PopupMenuItem(
                      child: Text("NeverScroll"),
                      value: NeverScrollableScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("AlwaysScroll"),
                      value: AlwaysScrollableScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("ClampingScroll"),
                      value: ClampingScrollPhysics(),
                    ),
                    PopupMenuItem(
                      child: Text("BounceScroll"),
                      value: BouncingScrollPhysics(),
                    ),
                  ],
                );
                setState(() {});
              },
              child: Text("physics"))
        ],
      ),
      body:ListView.separated(
        controller: _controller,
        shrinkWrap: true,
        physics: _physicsType,
        itemBuilder: (context, index) => ListTile(
          title:Text("IP"+(index+1).toString()+"已用节点内存:"+_lists["ip"+(index+1).toString()]['usedMemRate']),
          
        ),
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 2,
          color: Theme.of(context).dividerColor,
        ),
        itemCount: _lists.length,
      ),
      floatingActionButton: InkWell(
        onDoubleTap: () {
          if (_controller != null) {
            _controller.animateTo(0,
                duration: Duration(seconds: 3), curve: Curves.linear);
          }
        },
        onLongPress: () {
          if (_controller != null) {
            _controller.jumpTo(0);
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            if (_controller != null) {
              debugPrint("offset:${_controller.offset.toString()}");
              debugPrint("position:${_controller.position.toString()}");
            }
          },
          child: Icon(Icons.info),
        ),
      ),
    );
  }

}
