import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_class_ias/favouriteapp/favout_provider.dart';
import 'package:provider/provider.dart';

class FavouritAppScreen extends StatefulWidget {
  @override
  State<FavouritAppScreen> createState() => _FavouritAppScreenState();
}

class _FavouritAppScreenState extends State<FavouritAppScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FavouriteProvider provider=Provider.of<FavouriteProvider>(context,listen: false);
    provider.listApiCall();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return  Consumer<FavouriteProvider>(builder: (context,provider,chiled){
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
            itemBuilder: (context, index) {
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
                          " ${provider.userList[index].userId}",
                          style: TextStyle(),
                        ),
                        title: Text(provider.userList[index].title??""),
                        trailing: InkWell(
                            onTap: () => {
                              if (provider.favouriteList.contains(provider.userList[index]))
                                {
                                 provider.removeFavourite(provider.userList[index]),
                                }
                              else
                                {
                                  provider.addFavourite(provider.userList[index]),
                                },
                              print("$index"),

                              // setState(() {})
                            },
                            child: Icon(provider.favouriteList.contains(provider.userList?[index] )
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
