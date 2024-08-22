import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/usecase/SignUp.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_event.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signup_blocks/user_state.dart';
import 'package:myapp/service_locator.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Signup signup;

  UserBloc() : 
    signup = getIt<Signup>(), 
    super(Autenticating()) {
    on<Register>(_onRegister);
  }

  void _onRegister(Register event, Emitter<UserState> emit) async {
    emit(Autenticating());

    final userdata = event.userdata;

    // Simple form validation
    if (userdata.name.isEmpty || 
        userdata.email.isEmpty || 
        userdata.password.isEmpty) {
      emit(AutenticateFailure("Please fill in all the fields correctly."));
      return;
    }

    try {
      final result = await signup.execute(userdata);

      result.fold(
        (failure) {
          if (failure is ServerFailure) {
            emit(AutenticateFailure("Server Error: Please try again later."));
          } else if (failure is NetworkFailure) {
            emit(AutenticateFailure("Network Error: Please check your connection."));
          } else {
            emit(AutenticateFailure("Unexpected Error: Please try again."));
          }
        },
        (user) => emit(Autenticated()),
      );
    } catch (error) {
      emit(AutenticateFailure(error.toString()));
    }
  }
}
