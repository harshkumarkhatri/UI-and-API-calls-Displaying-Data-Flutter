import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'album.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.album);
  @required
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: "image${album.id}",
                  child: FadeInImage.assetNetwork(
                    placeholder: 'images/no_image.png',
                    image: album.thumbnailUrl,
                    width: 100,
                    height: 100,
                  ),
                ),
              )),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  album.title,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
