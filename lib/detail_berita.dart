import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class Detail extends StatefulWidget {
  List list;
  int index;

  Detail({this.index,this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['judul']}"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          Image.network("https://portal.tanahlautkab.go.id/asset/foto_berita/"+widget.list[widget.index]['gambar']),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("Judul : "+ widget.list[widget.index]['judul'],style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        Text(
                          "Tanggal :  " + widget.list[widget.index]['tanggal'],
                          style: TextStyle(
                              color: Colors.grey[500]
                          ),
                        ),

                      ],
                    )
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),

              ],
            ),
          ),
          Container(
                  padding: EdgeInsets.all(32.0),
                  child: Html(
                      data: widget.list[widget.index]['isi_berita'],


                  )
                       // Text(widget.list[widget.index]['isi_berita'],softWrap: true,),
          )

        ],
      ),
    );
  }
}
