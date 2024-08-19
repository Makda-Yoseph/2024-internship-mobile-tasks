import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/connectivity/connection.dart';
import 'package:myapp/features/product/Data/Data_source/Local_data_source/local_data_src.dart';
import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
import 'package:myapp/features/product/Data/repository/repo.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_block.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_event.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_bloc.dart';
import 'package:myapp/service_locator.dart';
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
          )
      ],
      // create: (context) => getIt<HomeBloc>()..add(ImageFetch()),
      // // create: (_)=> getIt.get<HomeBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          
          '/': (context) => HomeScreen(),
          '/update': (context) => up(),
          '/updatingform':(context)=>Updatingform(),
          '/detail': (context) => Detail(),
          '/search': (context) => Search(),
        },
      ),
    );
  }
}

// return BlocProvider<HomeBloc>(
//   create: (context) => getIt<HomeBloc>(),
//   child: MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: '/',
//     routes: {
//       '/': (context) => HomeScreen(),
//       '/update': (context) => UpdateScreen(),
//       '/detail': (context) => DetailScreen(),
//       '/search': (context) => SearchScreen(),
//     },
//   ),
// );

