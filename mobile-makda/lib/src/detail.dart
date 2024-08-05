import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/src/update.dart';

class Detail extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.chevron_left,color:Colors.blue),
        onPressed: (){
          Navigator.pop(context);
        },),
        title: Text('Add Product',
        style:TextStyle(
          fontSize: 16,
        )),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(left:30.0,right:30.0),
        child: Expanded(
          
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 156,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Color.fromARGB(12, 27, 23, 23),
                    
                  ),
                  
                  child:Container(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    alignment: Alignment.center,
                    child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   
                    children: [
                      
                      Icon(
                    Icons.image,
                    color: Colors.grey,
                    size: 60,
                  ),
                  Text('Upload image',
                  style: TextStyle(
                    color:Colors.black,
                    fontSize: 14,
                  ),),
                   
                    ],
                  ),
                  ),
                ),
              
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top:10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('name'),
                  TextField(
                   maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Color.fromARGB(12, 27, 23, 23),
                    filled:true,
                    
                  ),
                                    ),
                  
                ],)
              ),
                Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top:20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('catagory'),
                  TextField(
                     maxLines: 1,
                    decoration: InputDecoration(
                       border: InputBorder.none,
                      fillColor: Color.fromARGB(12, 27, 23, 23),
                      filled:true,
                      
                    ),
                  )
                ],)
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top:20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('price'),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                       border: InputBorder.none,
                      fillColor: Color.fromARGB(12, 27, 23, 23),
                      filled:true,
                      
                    ),
                  )
                ],)
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top:20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Description'),
                  Container(
                    padding:EdgeInsets.only(bottom: 22),
                    child: TextFormField(
                      maxLines: 6,
                      decoration: InputDecoration(
                         border: InputBorder.none,
    
                        fillColor: Color.fromARGB(12, 27, 23, 23),
                        filled:true,
                        
                      ),
                    ),
                  )
                ],)
              ),
              
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [

                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(onPressed:(){},
                        child: Text('Add',
                        style: TextStyle(
                          fontSize: 18,
                        ),),
                        autofocus: true,
                        style:ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        )
                        ),
                      ),
                    ),
                    
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:Border.all(
                          color:Colors.red,
                        )
                      ),
                      child: SizedBox(
                        width:300,
                        height: 50,
                        child: ElevatedButton(onPressed: (){}, 
                        child: Text('Delete',
                        style: TextStyle(
                         fontSize: 18
                        ),
                        
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: Colors.red,
                          
                    
                        
                        )
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
    ));
  }
}
