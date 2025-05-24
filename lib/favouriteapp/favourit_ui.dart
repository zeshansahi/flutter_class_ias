import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FavouritAppScreen extends StatefulWidget {
  @override
  State<FavouritAppScreen> createState() => _FavouritAppScreenState();
}

class _FavouritAppScreenState extends State<FavouritAppScreen> {
  List<int> favouriteList = [];
  List<int> listItem = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];


  Future<void> listApiCall() async {

    var request = http.Request('GET',
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    http.StreamedResponse response = await request.send();

    var data = await response.stream.bytesToString();

    print("Request::${request}");
    print("ResponseCode::${response.statusCode}");
    print("ResponseData::${data}");

    if (response.statusCode == 200) {
      try {
        print("Api Called successfully");


      } catch (e,ex) {
        print("ReportJasonParsingError:$ex");
      }

      // print(await response.stream.bytesToString());
    } else if (response.statusCode == 401) {
      print("Session expired");
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listApiCall();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("FavouritApp"),
        actions: [
          Icon(Icons.favorite),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: listItem.length,
          itemBuilder: (context, item) {
            return Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                      color: Colors.red,
                      child: Text(
                        "Item ${listItem[item]}",
                        style: TextStyle(),
                      )),
                  title: Text("Title"),
                  trailing: InkWell(
                      onTap: () => {
                            if (favouriteList.contains(listItem[item]))
                              {
                                favouriteList.remove(listItem[item]),
                              }
                            else
                              {
                                favouriteList.add(listItem[item]),
                              },
                            print("$item"),
                            print("Size::${favouriteList.length}"),
                            setState(() {})
                          },
                      child: Container(
                          color: Colors.green,
                          child: Icon(favouriteList.contains(listItem[item])
                              ? Icons.favorite
                              : Icons.favorite_border_outlined))),
                ),
              ),
            );
          }),
    );
  }
}
