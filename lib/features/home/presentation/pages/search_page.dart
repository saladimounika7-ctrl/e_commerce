import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: const Color(0xff9EE7F4),

        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.black),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

        title: Container(

          height: 46,

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(30),

          ),

          child: TextField(

            controller: searchController,

            autofocus: true,

            decoration: const InputDecoration(

              hintText: "Search Amazon.in",

              border: InputBorder.none,

              prefixIcon: Icon(Icons.search),

              suffixIcon: Icon(Icons.mic_none),

            ),

          ),

        ),

      ),

      body: ListView(

        children: const [

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Shoes"),
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Mobiles"),
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Laptop"),
          ),

          ListTile(
            leading: Icon(Icons.history),
            title: Text("Headphones"),
          ),

        ],

      ),

    );

  }

}