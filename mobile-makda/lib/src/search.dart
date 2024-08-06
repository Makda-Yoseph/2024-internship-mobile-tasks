import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'products.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double _start = 50;
  double _end = 150;

  TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    String query = _searchController.text;
    // Add your search logic here
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<Item> shoes = ItemProvider.retrive();
    List<Widget> dispCards = shoes.map((shoe) {
      return Mycard(shoes: shoe);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Product'),
        leading: Padding(
          padding: EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: screenWidth * 2,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'summer shoes',
                          suffixIcon: Container(
                            child: IconButton(
                              onPressed: _performSearch,
                              icon: Icon(Icons.east),
                              color: Color.fromRGBO(63, 81, 243, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 81, 243, 1),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(63, 81, 243, 1),
                          ),
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: screenHeight * 0.285,
                                    padding: EdgeInsets.all(16.0),
                                    child: Expanded(

                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 15, bottom: 8),
                                              child: Text(
                                                'Category',
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: const Color.fromRGBO(217, 217, 217, 1)),
                                                ),
                                                border: UnderlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text('Price'),
                                            ),
                                            RangeSlider(
                                              min: 10,
                                              max: 200,
                                              values: RangeValues(_start, _end),
                                              onChanged: (RangeValues values) {
                                                setState(() {
                                                  _start = values.start;
                                                  _end = values.end;
                                                });
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Text('Selected Range: \$${_start.round()} - \$${_end.round()}'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.filter_list),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: dispCards,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
