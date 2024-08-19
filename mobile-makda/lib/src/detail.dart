// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'products.dart';

// class Detail extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return DetailState();
//   }
// }

// class DetailState extends State<Detail> {
//   File? _image;
//   final picker = ImagePicker();
//   File? _imagePath;
//   int currentID = 3;
//   String? name;
//   String? category;
//   String? price;
//   String? description;

//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _categoryController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

  

//   // Future<void> saveImageToAssets(File imageFile, String filename) async {
//   //   try {
//   //     final directory = await getApplicationDocumentsDirectory();
//   //     final String newPath = join(directory.path, 'assets', filename);
//   //     // // final assetsDirectory = Directory(join(directory.path, 'assets'));
//   //     // if (!assetsDirectory.existsSync()) {
//   //     //   assetsDirectory.createSync(recursive: true);
//   //     // }
//   //     final File newImageFile = await imageFile.copy(newPath);
//   //     _imagePath = newImageFile;
//   //     // return newImageFile.path;
//   //   } catch (e) {
//   //     throw Exception('Error saving image to assets: $e');
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {   

//   //   void idincreament() {
//   //   currentID++;
//   // }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _categoryController.dispose();
//     _priceController.dispose();
//     _descriptionController.dispose();
//     super.dispose();
//   }

//   void addHandler() {
//     setState(() {
//       name = _nameController.text;
//       price = _priceController.text;
//       category = _categoryController.text;
//       description = _descriptionController.text;
//       Item item = Item(
        
//         name: name ?? '',
//         category: category ?? '',
//         description: description ?? '',
//         price: price ?? '',
//         imgpath: _imagePath,
//       );
      
//       // ItemProvider.addItem(item);
      
//     Provider.of<ItemProvider>(context, listen: false).addItem(item);
//       // idincreament();
//     });
//   }

  
// Future<File?> pickImage() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     _imagePath = File(pickedFile.path);
//     return File(pickedFile.path);

//   } else {
//     return null; 
//   }
// }


//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.chevron_left, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Add Product',
//           style: TextStyle(fontSize: 16),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30.0, right: 30.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//              GestureDetector(
//                 onTap: () => pickImage(),
//                 child: Container(
//                   height: 156,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Color.fromARGB(12, 27, 23, 23),
//                   ),
//                   child: Container(
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
//                     alignment: Alignment.center,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.image,
//                           color: Colors.grey,
//                           size: 60,
//                         ),
//                         Text(
//                           'Upload image',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.only(top: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Name'),
//                     TextField(
//                       controller: _nameController,
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         fillColor: Color.fromARGB(12, 27, 23, 23),
//                         filled: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.only(top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Category'),
//                     TextField(
//                       controller: _categoryController,
//                       maxLines: 1,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         fillColor: Color.fromARGB(12, 27, 23, 23),
//                         filled: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.only(top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Price'),
//                     TextField(
                      
//                       controller: _priceController,
//                       maxLines: 1,
                      
//                       decoration: InputDecoration(
//                         suffixIcon: Container(
//                           child:Icon(Icons.attach_money)
//                         ),
                       
//                         border: InputBorder.none,
//                         fillColor: Color.fromARGB(12, 27, 23, 23),
//                         filled: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 padding: EdgeInsets.only(top: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Description'),
//                     Container(
//                       padding: EdgeInsets.only(bottom: 22),
//                       child: TextFormField(
//                         controller: _descriptionController,
//                         maxLines: 6,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           fillColor: Color.fromARGB(12, 27, 23, 23),
//                           filled: true,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(bottom: 10),
//                     child: SizedBox(
//                       width: 300,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: addHandler,
//                         child: Text(
//                           'Add',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         autofocus: true,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: Colors.red,
//                       ),
//                     ),
//                     child: SizedBox(
//                       width: 300,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text(
//                           'Delete',
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           foregroundColor: Colors.red,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_block.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_event.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_state.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_event.dart';


class Detail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Detail> {
  File? _image;
  final picker = ImagePicker();
  bool _isSubmitting = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  var counter = 0;
  void _incrementCounter() {
    counter++;
  }

  void _addHandler(BuildContext context) {
    setState(() {
      _isSubmitting = true;
    });

    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final description = _descriptionController.text;
    final imageUrl = _image?.path ?? '';

    if (name.isNotEmpty && price > 0 && description.isNotEmpty && imageUrl.isNotEmpty) {
      final id = counter.toString();
      _incrementCounter();

      final Product =product (
        name: name,
        imageUrl: imageUrl,
        price: price,
        description: description,
        id: id,
      );

      context.read<AddBloc>().add(FormSubmitted(Product: Product));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all the fields correctly.")),
      );
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => getIt<AddBloc>(),
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color:const Color.fromRGBO(63, 81, 243, 1)),
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
        body: BlocListener<AddBloc, AddState>(
          listener: (context, state) {
            if (state is AddedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product added successfully!")),
              );
              context.read<HomeBloc>().add(ImageFetch());
              Navigator.pushNamed(context, '/');
            } else if (state is AddFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
            setState(() {
              _isSubmitting = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 156,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(12, 27, 23, 23),
                      ),
                      child: Center(
                        child: _image == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image, color: Colors.grey, size: 60),
                                  Text('Upload image', style: TextStyle(fontSize: 14)),
                                ],
                              )
                            : Image.file(_image!),
                      ),
                    ),
                  ),
                  _buildTextField('Name', _nameController),
                  _buildTextField('Price', _priceController, isPrice: true),
                  _buildTextField('Description', _descriptionController, isDescription: true),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isSubmitting ? null : () => _addHandler(context),
                    child: _isSubmitting
                        ? CircularProgressIndicator()
                        : Text('Add', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPrice = false, bool isDescription = false}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            controller: controller,
            keyboardType: isPrice ? TextInputType.number : TextInputType.text,
            maxLines: isDescription ? 6 : 1,
            decoration: InputDecoration(
              suffixIcon: isPrice ? Icon(Icons.attach_money) : null,
              border: InputBorder.none,
              fillColor: Color.fromARGB(12, 27, 23, 23),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }
}


