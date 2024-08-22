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
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_bloc.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_event.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_state.dart';
import 'package:myapp/service_locator.dart'; // Ensure this is the correct import for GetIt setup

class Updatingform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailState();
  }
}

class DetailState extends State<Updatingform> {
  // File? _image;
  // final picker = ImagePicker();
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


  void _addHandler(BuildContext context, product route) {
    setState(() {
      _isSubmitting = true;
    });

    final name = _nameController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;
    final description = _descriptionController.text;
    final imageUrl = route.imageUrl;

    if (name.isNotEmpty && price > 0 && description.isNotEmpty && imageUrl.isNotEmpty) {
      // final id = counter.toString();
      // _incrementCounter();

      final Product =product (
        name: name,
        imageUrl: imageUrl,
        price: price,
        description: description,
        id: route.id,
      );

      context.read<UpdateBloc>().add(UpdateFormSubmitted(Product: Product));
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
    final route = ModalRoute.of(context)?.settings.arguments as product;

    // return BlocProvider(
      // create: (_) => getIt<AddBloc>(),
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: const Color.fromRGBO(63, 81, 243, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Update Product',
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: BlocListener<UpdateBloc, UpdateState>(
          listener: (context, state) {
            if (state is Updatedstate) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Product updated successfully!")),
              );
              context.read<HomeBloc>().add(ImageFetch());
              Navigator.pushNamed(context, '/homescreen');
            } else if (state is Updatefailure) {
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
                  // GestureDetector(
                  //   onTap: _pickImage,
                  //   child: Container(
                  //     height: 156,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Color.fromARGB(12, 27, 23, 23),
                  //     ),
                  //     child: Center(
                  //       child: _image == null
                  //           ? Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Icon(Icons.image, color: Colors.grey, size: 60),
                  //                 Text('Upload image', style: TextStyle(fontSize: 14)),
                  //               ],
                  //             )
                  //           : Image.file(_image!),
                  //     ),
                  //   ),
                  // ),
                  _buildTextField('Name', _nameController, ),
                  _buildTextField('Price', _priceController, isPrice: true),
                  _buildTextField('Description', _descriptionController, isDescription: true),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                      onPressed: ()=>Navigator.of(context).pop(),
                      child:Text('Cancel', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 40, right: 40,top: 15,bottom: 15),
                        foregroundColor: Color.fromARGB(255, 212, 56, 56),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color:Color.fromARGB(255, 212, 56, 56)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: _isSubmitting ? null : () => _addHandler(context,route),
                      child: _isSubmitting
                          ? CircularProgressIndicator()
                          : Text('update', style: TextStyle(fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.only(left: 40,right: 40,top: 15,bottom: 15),
                        backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    ],
                    
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
