import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin_blocks.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_bloc.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_block.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_event.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_bloc.dart';
import 'package:myapp/service_locator.dart';
import 'package:myapp/src/signin.dart';
import 'package:myapp/src/signup.dart';
import 'package:myapp/src/splashscreen.dart';
import 'package:myapp/src/updatingform.dart';
import 'src/app.dart';
import 'src/detail.dart';
import 'src/update.dart';
import 'src/search.dart';
// import 'package:provider/provider.dart';
// import 'src/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MYApp());
}


class MYApp extends StatelessWidget {
  // final prdrep  = productRepo();
  
  @override
  Widget build(BuildContext context) {  
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(ImageFetch()),
        ),
        BlocProvider(
          create: (context) => getIt<AddBloc>(),
        ),
        BlocProvider(
          create: (context)=> getIt<UpdateBloc>(),
          ),
        BlocProvider(
          create:(context)=> getIt<DeleteBlock>(),
          ),
        BlocProvider(
          create: (context)=>getIt<UserBloc>(),
          ),
        BlocProvider(
          create: (context)=>getIt<SigninBloc>(),                                      
          )
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          
          '/': (context) => SplashScreen(),
          '/signin':(context)=> Signinpage(),
          '/signup':(context)=> Signuppage(),
          '/homescreen':(context)=>HomeScreen(),
          '/update': (context) => up(),
          '/updatingform':(context)=>Updatingform(),
          '/detail': (context) => Detail(),
          '/search': (context) => Search(),
        },
      ),
    );
  }
}



