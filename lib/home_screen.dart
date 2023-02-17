import 'package:flutter/material.dart';

import 'item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  // List<Item> ITEM_LIST = [
  //   Item(name: "Sản phẩm 1", id: 'Loại 1'),
  //   Item(name: "Sản phẩm 2", id: 'Loại 2'),
  //   Item(name: "Sản phẩm 3", id: 'Loại 1'),
  //   Item(name: "Sản phẩm 4", id: 'Loại 2'),
  //   Item(name: "Sản phẩm 5", id: 'Loại 2'),
  //   Item(name: "Sản phẩm 6", id: 'Loại 3'),
  // ];

  List<Item> ITEM_LIST = [
    Item(name: "Sản phẩm 1", id: ['Loại 1', 'loại 2', 'loại 5']),
    Item(name: "Sản phẩm 2", id: ['Loại 2', 'loại 3']),
    Item(name: "Sản phẩm 3", id: ['Loại 3', 'loại 4']),
    Item(name: "Sản phẩm 4", id: ['Loại 4', 'loại 5']),
    Item(name: "Sản phẩm 5", id: ['Loại 5', 'loại 6', 'loại 3']),
    Item(name: "Sản phẩm 6", id: ['Loại 6', 'loại 7']),
  ];
  List<Item> foundItems = [];

  @override
  void initState() {
    // TODO: implement initState
    foundItems = ITEM_LIST;
    super.initState();
  }

  void runFilter(String enterKeyWord) {
    List<Item> result = [];
    if (enterKeyWord.isEmpty) {
      result = ITEM_LIST;
    } else {
      result = ITEM_LIST
          .where((element) =>
              element.id.toString().toLowerCase().contains(enterKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      foundItems = result;
    });
  }


  Widget allItem(String searchText) {
    return ElevatedButton(
        onPressed: () {
          runFilter(searchText);
        },
        child: const Text(
          "All",
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget singleItem(String searchText) {
    return ElevatedButton(
        onPressed: () {
          runFilter(searchText);
        },
        child: Text(
          searchText,
          style: const TextStyle(color: Colors.white),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text("Filter App"),
        centerTitle: true,
        bottom: PreferredSize(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) => runFilter(value),
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search) 
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.white.withOpacity(0.7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        allItem(""),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 1"),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 2"),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 3"),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 4"),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 5"),
                        const SizedBox(
                          width: 10,
                        ),
                        singleItem("Loại 6"),
                        const SizedBox(
                          width: 10,
                        ),
                      ]),
                ),
              ),
              Container(
                height: 30,
                width: double.infinity,
                color: Colors.white.withOpacity(0.9),
                child: Text("Search for: $text"),
              )
            ],
          ),
          preferredSize: const Size(3, 130),
        ),
      ),
      body: foundItems.isNotEmpty
          ? ListView.builder(
              
              itemCount: foundItems.length,
              itemBuilder: ((context, index) {
                return Column(
                  key: ValueKey(foundItems[index].id),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(foundItems[index].name),
                    )
                  ],
                );
              }))
          : const Text("NO DATA"),
    );
  }
}
