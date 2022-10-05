import 'package:alnawawiforty/utils/colors.dart';
import 'package:alnawawiforty/screens/localAudio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../db/mydata.dart';
import '../model/hadithe.dart';
import '../utils/Strings.dart';

class AudioAhadithScreen extends StatefulWidget {
  @override
  State<AudioAhadithScreen> createState() => _AudioAhadithScreenState();
}

class _AudioAhadithScreenState extends State<AudioAhadithScreen> {
  Widget build(BuildContext context) {
    Widget ayah(String key, name) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img.png"),
          Image.asset("assets/unnamed-1.png"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                key,
                style: TextStyle(fontSize: 16, color: colorApp.yellow1),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: colorApp.yellow1),
                textScaleFactor: .5,
              ),
            ],
          )
        ],
      );
    }

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 220,
            child: Expanded(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "assets/svg/iPhone X, XS, 11 Pro – 9.svg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(""),
                          SvgPicture.asset("assets/svg/11.svg"),
                          SvgPicture.asset("assets/svg/arrow-right.svg"),
                        ],
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextApp.bookTwoScreen,
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/iPhone X, XS, 11 Pro – 9.svg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                FutureBuilder(

                    //we call the method, which is in the folder db file database.dart
                    future: Mydata.getAlldata(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            Hadith item = snapshot.data[index];
                            //delete one register for id
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LocalAudio(
                                          hadith: item,
                                          localAudioPath:
                                              'audio/' + item.audioHadith)));
                                },
                                child: ayah(item.key, item.nameHadith));
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            childAspectRatio: 3 / 4,
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
 ListView.builder(
              // physics: BouncingScrollPhysics(),
              //Count all records

              itemCount: snapshot.data.length,
              //all the records that are in the Operation table are passed to an item Operation item = snapshot.data [index];
              itemBuilder: (BuildContext context, int index) {
                Hadith item = snapshot.data[index];
                //delete one register for id
                return ayah(item.key, item.nameHadith);

              },
            );
 */
/*
Card(
                  margin: EdgeInsets.all(3.0),
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: ListTile(

                    title:
                    RichText(
                      textAlign: TextAlign.right,

                      text: TextSpan(
                          style:TextStyle(fontSize:20,color: Colors.teal),
                          children: [
                            TextSpan(text: item.key+': ' , style: TextStyle(color: Colors.brown)),
                            TextSpan(text: item.nameHadith ,style: TextStyle(color: Colors.deepOrange))]
                      ),
                      textDirection: TextDirection.rtl,
                    ),

                    subtitle: Text(item.textHadith.substring(0,120) +'...', textDirection: TextDirection.rtl,),
                    trailing:Icon(Icons.library_books,color: Colors.brown,) ,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                          //HadithPage(hadith: item,)
                          HomeHadith(hadith: item,)
                      ));
                    },
                  ),
                );
 */
