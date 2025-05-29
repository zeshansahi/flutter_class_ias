import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_ias/favouriteapp/favout_provider.dart';
import 'package:provider/provider.dart';

class FavouritAppScreen extends StatefulWidget {
  @override
  State<FavouritAppScreen> createState() => _FavouritAppScreenState();
}

class _FavouritAppScreenState extends State<FavouritAppScreen> {
  List<int> favouriteList = [];
  List<int> listItem = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouritProvider provider=Provider.of<FavouritProvider>(context,listen: false);
    provider.listApiCall();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  Consumer<FavouritProvider>(builder: (context,provider,chiled){
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("FavouritApp"),
          actions: [
            InkWell(
                onTap:() {

                  provider.addUserPostApiCall(
                    userId: 111,
                    id:98,
                    title: "title",
                    textBody: "body message"
                  );
                },
                child: Icon(Icons.favorite)),
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: ListView.builder(
            itemCount: provider.userList?.length,
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: ListTile(
                        leading: Text(
                          " ${provider.userList?[item].userId}",
                          style: TextStyle(),
                        ),
                        title: Text(provider.userList?[item].title??""),
                        trailing: InkWell(
                            onTap: () => {
                              // if (favouriteList.contains(listItem[item]))
                              //   {
                              //     favouriteList.remove(listItem[item]),
                              //   }
                              // else
                              //   {
                              //     favouriteList.add(listItem[item]),
                              //   },
                              // print("$item"),
                              // print("Size::${favouriteList.length}"),
                              // setState(() {})
                            },
                            child: Icon(favouriteList.contains(provider.userList?[item] )
                                ? Icons.favorite
                                : Icons.favorite_border_outlined)),
                      ),
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
