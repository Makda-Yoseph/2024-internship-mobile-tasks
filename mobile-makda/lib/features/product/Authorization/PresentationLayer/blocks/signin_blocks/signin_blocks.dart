import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/failure/failure.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/entites/userregister.dart';
import 'package:myapp/features/product/Authorization/DomainLayer/usecase/SignIn.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin.state.dart';
import 'package:myapp/features/product/Authorization/PresentationLayer/blocks/signin_blocks/signin_event.dart';
import 'package:myapp/service_locator.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final Signin signin;

  SigninBloc() :
    signin = getIt<Signin>(),
    super(Authenticating()) {
    on<SigninButtonPressed>(_onSigninButtonPressed);
  }

  Future<void> _onSigninButtonPressed(
      SigninButtonPressed event, Emitter<SigninState> emit) async {
    emit(Authenticating());

    final result = await signin.execute(event.email, event.password);

    result.fold(
      (failure) => emit(AuthenticationFailed("Failed to authenticate. Please try again.")),
      (user) => emit(Authenticated(user)),
    );
  }
}
