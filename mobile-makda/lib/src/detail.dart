import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'products.dart';

class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Detail> {
  File? _image;
  final picker = ImagePicker();
  File? _imagePath;
  int currentID = 3;
  String? name;
  String? category;
  String? price;
  String? description;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  

  // Future<void> saveImageToAssets(File imageFile, String filename) async {
  //   try {
  //     final directory = await getApplicationDocumentsDirectory();
  //     final String newPath = join(directory.path, 'assets', filename);
  //     // // final assetsDirectory = Directory(join(directory.path, 'assets'));
  //     // if (!assetsDirectory.existsSync()) {
  //     //   assetsDirectory.createSync(recursive: true);
  //     // }
  //     final File newImageFile = await imageFile.copy(newPath);
  //     _imagePath = newImageFile;
  //     // return newImageFile.path;
  //   } catch (e) {
  //     throw Exception('Error saving image to assets: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {   

  //   void idincreament() {
  //   currentID++;
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void addHandler() {
    setState(() {
      name = _nameController.text;
      price = _priceController.text;
      category = _categoryController.text;
      description = _descriptionController.text;
      Item item = Item(
        
        name: name ?? '',
        category: category ?? '',
        description: description ?? '',
        price: price ?? '',
        imgpath: _imagePath,
      );
      
      // ItemProvider.addItem(item);
      
    Provider.of<ItemProvider>(context, listen: false).addItem(item);
      // idincreament();
    });
  }

  
Future<File?> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _imagePath = File(pickedFile.path);
    return File(pickedFile.path);

  } else {
    return null; 
  }
}


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             GestureDetector(
                onTap: () => pickImage(),
                child: Container(
                  height: 156,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(12, 27, 23, 23),
                  ),
                  child: Container(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Colors.grey,
                          size: 60,
                        ),
                        Text(
                          'Upload image',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    TextField(
                      controller: _nameController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(12, 27, 23, 23),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Category'),
                    TextField(
                      controller: _categoryController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(12, 27, 23, 23),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Price'),
                    TextField(
                      
                      controller: _priceController,
                      maxLines: 1,
                      
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          child:Icon(Icons.attach_money)
                        ),
                       
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(12, 27, 23, 23),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description'),
                    Container(
                      padding: EdgeInsets.only(bottom: 22),
                      child: TextFormField(
                        controller: _descriptionController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(12, 27, 23, 23),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: addHandler,
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        autofocus: true,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
