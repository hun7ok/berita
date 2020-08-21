import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'detail_berita.dart';


void main() => runApp(Listdata());


class Listdata extends StatefulWidget {
  @override
  _ListdataState createState() => _ListdataState();
}

class _ListdataState extends State<Listdata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ListDatanya(),
    );
  }
}

class ListDatanya extends StatefulWidget {
  @override
  _ListDatanyaState createState() => _ListDatanyaState();
}

class _ListDatanyaState extends State<ListDatanya> {

  Future<List> getData() async {
    final response = await http.get("https://portal.tanahlautkab.go.id/berita/json_berita_1");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListData"),
        leading: Icon(Icons.lock_open),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context,snapshot) {
            if(snapshot.hasError)print(snapshot.error);

            return snapshot.hasData
                ? ItemList(
              list: snapshot.data,
            ) : Center(
                child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context,i){
          return Container(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: ()=>Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context)=>Detail(list: list,index: i,)
                  )
              ),
                child: Card(
                  child: ListTile(
                    title: Text(list[i]['judul'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                    subtitle: Text("Tanggal : ${list[i]['tanggal']} "),
                    trailing: Image.network("https://portal.tanahlautkab.go.id/asset/foto_berita/"+list[i]['gambar'],
                    fit: BoxFit.cover,height: 60.0,width: 60.0)

                  ),

                ),

            )

          );

        }
    );
  }
}


