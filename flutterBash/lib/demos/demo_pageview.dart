import 'package:flutter/material.dart';

 List<dynamic> colors = [
  {"color":Colors.blue[50],"img":"http://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=9a76a404452a766b8c9c839224dd0382"},
  {"color":Colors.blue[50],"img":"http://t8.baidu.com/it/u=3571592872,3353494284&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=a25b544ad68550fb1add757b3c4d724f"},
  {"color":Colors.blue[50],"img":"http://t8.baidu.com/it/u=2247852322,986532796&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=a2806ad97a92979e7c5f59066fb3d13a"},
  {"color":Colors.blue[50],"img":"http://t9.baidu.com/it/u=583874135,70653437&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=cbd35dcca237e4a4f032b89806b1ae69"},
  {"color":Colors.blue[50],"img":"http://t9.baidu.com/it/u=1307125826,3433407105&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=ecd36098322b0c87ceba7f4436ecf88c"},
  {"color":Colors.blue[50],"img":"http://t7.baidu.com/it/u=3204887199,3790688592&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=e5964bb98a7cf0860250136fcd2d53df"},
  {"color":Colors.blue[50],"img":"http://t9.baidu.com/it/u=2268908537,2815455140&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=d8a88f018ad7fb6ae086e876b438aad4"},
  {"color":Colors.blue[50],"img":"http://t7.baidu.com/it/u=3616242789,1098670747&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1585294555&t=2d54bf602ebff59fc828bc0182742a56"},
  
];

/// PageView Demos
class PageViewDemo extends StatelessWidget {
  final _controller = PageController();
  
  //render
  Widget renderPageView(){
     return   PageView.builder(
                            itemBuilder: (context, index) => Container(
                              width: 300,
                              height: 300,
                              color: colors[index % colors.length]["color"], //bind colors list
                              child: FadeInImage.assetNetwork(
                                image:colors[index % colors.length]["img"],
                                placeholder: "images/loading.gif",
                              )
                            ),
                            pageSnapping: true,
                            controller: _controller,
                          );
  }

  Widget renderListView(){

     return   ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemExtent: 50.0,
                        itemBuilder: (BuildContext context, int index) => getItem(context,index)
                        
                    );
  }

   Widget renderListView2(){

     return   ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemExtent: 50.0,
                        itemBuilder: (BuildContext context, int index) => getItem(context,index)
                        
                    );
  }


  Widget getItem(context,index)
  {
      return Container(
                        child: ListTile(
                                   title: Text("这是第$index个条目"),
                                  ),
                        decoration: BoxDecoration(
                              border: Border(right: BorderSide(width: 1, color: Colors.blue))
                            ),
                     );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView Demo"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  //所有padding容器往TOP方向靠笼，中间无间距
          crossAxisAlignment: CrossAxisAlignment.start, //column所有元素左对齐
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text("PageView:",textAlign: TextAlign.left,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: SizedBox(
                width: double.maxFinite,
                height: 120,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    
                    renderPageView()
                    ,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: Icon(
                            Icons.chevron_left,
                            size: 32,
                          ),
                          onTap: () => _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOutSine),
                        ),
                        InkWell(
                          child: Icon(
                            Icons.chevron_right,
                            size: 32,
                          ),
                          onTap: () => _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOutSine),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            Text("ListView1:",textAlign: TextAlign.left,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: SizedBox(
                width: double.maxFinite,
                height: 150,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    
                    renderListView()
                  ],
                ),
              ),
            ),
            Text("ListView2:",textAlign: TextAlign.left,),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),
              child: SizedBox(
                width: double.maxFinite,
                height: 150,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                   
                    renderListView2()
                  ],
                ),
              ),
            ),
          ],
        ), 
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: PageViewDemo(),
    ));
