import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Domain/entities/product.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_block.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_event.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_state.dart';
import 'package:myapp/service_locator.dart';
import 'app.dart';

class up extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
       return Update();
    
  }
}

class Update extends State<up>{
   var flag = false;
   var selected = -1;
  Widget build (BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
   
    final routes=ModalRoute.of(context)?.settings.arguments as product;

    // return BlocProvider(
    //    create: (_) => getIt<DeleteBlock>(),
    //    child: BlocListener<DeleteBlock, DeleteState>(
    //   listener: (context, state) {
    //     if (state is Deleted) {
          
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text("Product deleted successfully.")),
    //       );
    //        Navigator.pushNamed(context, '/');
    //     } else if (state is DeleteFailure) {
          
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(state.error)),
    //       );
    //     }
    //   },
      return Scaffold(
          extendBody: true,
      body: BlocListener<DeleteBlock, DeleteState>(
        listener: (context, state) {
          if (state is Deleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Product deleted successfully.")),
            );
            Navigator.pushNamed(context, '/');
          } else if (state is DeleteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                     Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        
                        Container(
                          padding: EdgeInsets.only(bottom:15),
                          width:screenWidth ,
                          height: screenHeight *0.4,
                      child:Image.network(routes.imageUrl),
                  
                      ),
                      Positioned(
                        top: 15,
                        left:10,
                        child:Container(
                          padding:EdgeInsets.only(left:10,top:8),
                          child: Container(
                            width: 40,
                            height: 40,
                              constraints: BoxConstraints(minHeight: 2),
                             decoration: BoxDecoration(
                                color: Colors.white, 
                                shape: BoxShape.circle, 
                              ),
                            child: IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, 
                                      icon: Icon(Icons.chevron_left),color: Color.fromRGBO(63, 81, 243, 1),),
                          ),
                        ),
                      )
                      
                      ]
                      
                    ),
                    
              
                    Container(
              
                      child: Padding(
                        padding: EdgeInsets.only(left:15,right:15,bottom: 10),
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                          Text(routes.name,
                          style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22),
                          ),
                          Text('\$ ${routes.price}',style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22),)
                        ],),
                      ),
                    ),
                    Container(
                      child:Padding(padding: EdgeInsets.only(left:15,right:15,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('best product',style:TextStyle(fontSize:15,color:const Color.fromRGBO(170, 170, 170, 1)) ,),
                            Row(
                              children: [
                                 Icon(Icons.star, color: Colors.yellow),
                            Text('4.8',style: TextStyle(fontSize:15,color:const Color.fromRGBO(170, 170, 170, 1)),)
                              ]
                             
                            )
                            
                          ],
                        ),
                      )
              
                        
              
                    ),
                    
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(padding: EdgeInsets.only(left:15),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8,bottom: 8),
                        child: Text('Size:',
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.left,
                        ),
                      ))
                      
                    ),
                    
                    Container(
                      height:50,
                      
                      child:ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:8 ,
                        itemBuilder: (context,index){
                          final size = 37+index;
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child:ElevatedButton(onPressed: (){
                              setState(() {
                                flag = !flag;
                                selected = index;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: selected==index? Color.fromRGBO(63, 81, 243, 1) : Colors.white,
                  
                              foregroundColor: selected==index? Colors.white :Colors.black,
                            ),
                            child:Text('$size'),
                            ),
                          );
                        },
                      )
                       
                      
                    ),
                    Container(
                      padding: EdgeInsets.only(left:15,right:15,top: 20),
                      child:Text(routes.description)
                    ),
                    Container(
                      
                      
                      padding: EdgeInsets.only(left:20,right:20,top:50),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          decoration: BoxDecoration(
                           border:Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8)
              
                          ),
                          child: SizedBox(
                            height:50,
                            width:130,
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                 context
                                  .read<DeleteBlock>()
                                  .add(DeleteRequest(id: routes.id));
                              }, 
                              child: Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                  
                                  
                                )
                              ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)
              
                          ),
                          child: SizedBox(
                            height:50,
                            width:130,
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: (){
                                   Navigator.pushNamed(context, '/updatingform', arguments: routes);
                                }, 
                              child: Text('Update'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)
                                  
                                  
                                )
                              ),
                              ),
                            ),
                          ),
                        ),
                        
            
                      ],)
                    )
              
                    
                  ],
                ),
              ),
            ),
          ),
        );
      // );
    
      
    
  }
}