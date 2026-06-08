import 'package:flutter_riverpod/legacy.dart';
import 'package:practical/repo/api_repo.dart';
import 'package:practical/service/storage_services.dart';

class PostApiState {
  final bool isLoading;
  final String error;

  PostApiState({this.isLoading = false, this.error = ''});

  PostApiState copyWith({bool? isLoading, String? error}) {
    return PostApiState(isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

class PostApiController extends StateNotifier<PostApiState> {
  PostApiController() : super(PostApiState());

  Future<bool> postApi(String username, String password) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await AuthRepo.postApiRepo({'username': username, 'password': password});
      final token = response.token;
      if (token == null || token.isEmpty) {
        state = state.copyWith(isLoading: false, error: 'Invalid credentials');
        return false;
      }
      await SharedPrefHelper.setString('token', token);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

final postApiControllerProvider = StateNotifierProvider<PostApiController, PostApiState>((ref) {
  return PostApiController();
});
