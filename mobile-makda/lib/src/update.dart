import 'package:flutter/material.dart';
import 'app.dart';

class Update extends StatelessWidget{
   
  Widget build (BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
   
  
    return MaterialApp(
      home:Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
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
                  child:Image(image: AssetImage('assets/boot.jpg'),
                  fit:BoxFit.cover
                  ),
                  ),
                  Positioned(
                    top: 10,
                    left:10,
                    child:Container(
                      padding:EdgeInsets.only(left:10,top:8),
                      child: Container(
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
                       
                      Text('summer shoe',
                      style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22),
                      ),
                      Text('\$120',style: TextStyle(color:const Color.fromRGBO(62, 62, 62, 1),fontSize: 22),)
                    ],),
                  ),
                ),
                Container(
                  child:Padding(padding: EdgeInsets.only(left:15,right:15,bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('bestshoes',style:TextStyle(fontSize:15,color:const Color.fromRGBO(170, 170, 170, 1)) ,),
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
                  width: 50,
                  
                   
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      ElevatedButton(onPressed: (){}, 
                  child: Text('37'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                  ElevatedButton(onPressed: (){}, 
                  child: Text('38'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                  ElevatedButton(onPressed: (){

                  }, 
                  child: Text('39'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromRGBO(63, 81, 243, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                   ElevatedButton(onPressed: (){
                    
                     
                    
                   }, 
                  child: Text('40'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                   ElevatedButton(onPressed: (){}, 
                  child: Text('41'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                   ElevatedButton(onPressed: (){}, 
                  child: Text('42'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                  SizedBox(width: 8,),
                   ElevatedButton(onPressed: (){}, 
                  child: Text('43'),
                  style: ElevatedButton.styleFrom(
                    padding:EdgeInsetsDirectional.all(3),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  ),
                    ]
                    
                  
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left:15,right:15,top: 20),
                  child:Text('A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.')
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
                          child: ElevatedButton(onPressed: (){}, 
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
                          child: ElevatedButton(onPressed: (){}, 
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
      )
      );
      
    
  }
}