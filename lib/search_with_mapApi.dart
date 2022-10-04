import 'package:flutter/material.dart';

class SearchDataMapApi extends StatefulWidget {
  const SearchDataMapApi({Key? key}) : super(key: key);

  @override
  State<SearchDataMapApi> createState() => _SearchDataMapApiState();
}

class _SearchDataMapApiState extends State<SearchDataMapApi> {
  // ye niche controller value ko stroe karta he jab b user kio value enter karta he to o is me store ho gi
  TextEditingController _controller=TextEditingController();
  var uuid='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: Container(
      child: Column(
        children: [
          TextFormField(
            // ab yaha par controller do ga k jasa hi value enter ho gi to o us me sotre ho jaye
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Search Value",

            ),
          )
        ],
      ),
    ),
    );
  }
}
