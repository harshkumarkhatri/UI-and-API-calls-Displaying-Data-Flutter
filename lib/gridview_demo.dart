import 'package:flutter/material.dart';
import 'package:ui_and_api_calls_to_display_data_in_gridview/details.dart';
import 'album.dart';
import 'gridCell.dart';
import 'services.dart';
import 'details.dart';
import 'dart:async';

class GridViewDemo extends StatefulWidget {
  GridViewDemo() : super();
  final String title = "Photos";
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {

  StreamController<int> streamcontroller=new StreamController<int>();

  circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  gridview(AsyncSnapshot<List<Album>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data.map(
          (album) {
            return GestureDetector(
              child: GridTile(
                child: AlbumCell(album),
              ),onTap: (){
                goToDetailsPage(context,album);
              },
            );
          },
        ).toList(),
      ),
    );
  }


  goToDetailsPage(BuildContext context,Album album){
    Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (BuildContext context)=>GridDetails(curlAlbum:album),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: 0,
          stream: streamcontroller.stream,
        builder: (BuildContext context,AsyncSnapshot snapshot){
          return Text('${widget.title} ${snapshot.data}');
        },),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder<List<Album>>(
              future: Services.getPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                }
                if (snapshot.hasData) {
                  streamcontroller.sink.add(snapshot.data.length);
                  // Gridview
                  return gridview(snapshot);
                }
                return circularProgress();
              },
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose(){
    streamcontroller.close();
    super.dispose();
  }
}
