import 'package:flutter/material.dart';
import 'package:ui_and_api_calls_to_display_data_in_gridview/album.dart';

class GridDetails extends StatefulWidget {
  final Album curlAlbum;
  GridDetails({@required this.curlAlbum});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "image${widget.curlAlbum.id}",
            child: FadeInImage.assetNetwork(
              placeholder: "images/no_image.png",
              image: widget.curlAlbum.url,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          OutlineButton(
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    ));
  }
}
