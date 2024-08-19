import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:myapp/core/connectivity/connection.dart'; // Ensure this path is correct
import 'package:myapp/features/product/Data/Data_source/Local_data_source/local_data_src.dart';
import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
import 'package:myapp/features/product/Data/repository/repo.dart';
import 'package:myapp/features/product/Domain/repository/product_repository.dart';
import 'package:myapp/features/product/Domain/usecase/add_product.dart';
import 'package:myapp/features/product/Domain/usecase/delete_product.dart';
import 'package:myapp/features/product/Domain/usecase/getAll_product.dart';
import 'package:myapp/features/product/Domain/usecase/update._product.dart';
import 'package:myapp/features/product/presentation/blocks/Add_blocks/add_block.dart';
import 'package:myapp/features/product/presentation/blocks/Delete_blocks/delete_block.dart';
import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
import 'package:myapp/features/product/presentation/blocks/update_blocks/update_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> setup() async {
  var sharedPreference = await SharedPreferences.getInstance();
  var client = http.Client();
  var connectionChecker = Connectivity();

  // Register services
  getIt.registerSingleton<SharedPreferences>(sharedPreference);
  getIt.registerSingleton<http.Client>(client);
  getIt.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker());

  // Register services that depend on others
  getIt.registerSingleton<LocalDataSrc>(LocalDataSrc());
  getIt.registerSingleton<NetworkInfo>(NetworkInfo(getIt()));
  getIt.registerSingleton<RemoteSource>(RemoteSource(client: getIt()));
  
  // Register repository and use case
  getIt.registerSingleton<productRepo>(ProductRepositoryImpl(
    remoteSource: getIt<RemoteSource>(),
    localDataSrc: getIt<LocalDataSrc>(),
    networkInfo: getIt<NetworkInfo>(),
  ));
  getIt.registerSingleton<GetAllProd>(GetAllProd(getIt<productRepo>()));
  getIt.registerSingleton<HomeBloc>(HomeBloc(getallproduct: getIt<GetAllProd>()));
  getIt.registerSingleton<AddProduct>(AddProduct(getIt<productRepo>()));
  getIt.registerSingleton<AddBloc>(AddBloc());
  getIt.registerSingleton<Updateprod>(Updateprod(getIt<productRepo>()));
  getIt.registerSingleton<UpdateBloc>(UpdateBloc());
  getIt.registerSingleton<Deleteprod>(Deleteprod(getIt<productRepo>()));
  getIt.registerSingleton<DeleteBlock>(DeleteBlock());
  
}

// mport 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get_it/get_it.dart';
// import 'package:myapp/core/connectivity/connection.dart';
// import 'package:myapp/features/product/Data/Data_source/Local_data_source/local_data_src.dart';
// import 'package:myapp/features/product/Data/Data_source/remote_data_source/remote_data_src.dart';
// import 'package:myapp/features/product/Data/repository/repo.dart';
// import 'package:myapp/features/product/Domain/repository/product_repository.dart';
// import 'package:myapp/features/product/Domain/usecase/getAll_product.dart';
// import 'package:myapp/features/product/presentation/blocks/Home_blocks/home_block.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// final getIt = GetIt.instance;

// Future<void> setup() async{
//   var sharedPreference = await SharedPreferences.getInstance();
//   var client = http.Client();
//   var connectionChecker = Connectivity();
//   getIt.registerSingleton<SharedPreferences>(sharedPreference);
//   getIt.registerSingleton<http.Client>(client);
//   getIt.registerSingleton<Connectivity>(connectionChecker);
//   getIt.registerSingleton<RemoteSource>(RemoteSource(client: getIt()));
//   getIt.registerSingleton<LocalDataSrc>(LocalDataSrc());
//   getIt.registerSingleton<NetworkInfo>(NetworkInfo(getIt()));
//   getIt.registerSingleton<productRepo>(ProductRepositoryImpl(remoteSource: getIt(), localDataSrc: getIt(), networkInfo: getIt()));
//   getIt.registerSingleton<GetAllProd>(GetAllProd(getIt()));
//   getIt.registerSingleton<HomeBloc>(HomeBloc(getallproduct: getIt()));

// }
// and the connectivity file has this syntax
// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkInfo {
//   final Connectivity connectivity;

//   NetworkInfo(this.connectivity);

//   Future<bool> isConnected() async {
//     var result = await connectivity.checkConnectivity();
//     return result != ConnectivityResult.none;
//   }
// }