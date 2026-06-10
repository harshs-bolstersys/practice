import 'package:flutter_riverpod/legacy.dart';
import 'package:practical/repo/api_repo.dart';
import 'package:practical/view/get_api_riverpod/model/get_api_model.dart';

class GetApiState {
  final List<GetApiModel> getApiList;
  final bool isLoading;
  final String error;
  GetApiState({required this.getApiList, required this.isLoading, required this.error});

  GetApiState copyWith({List<GetApiModel>? getApiList, bool? isLoading, String? error}) {
    return GetApiState(
      getApiList: getApiList ?? this.getApiList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class GetApiController extends StateNotifier<GetApiState> {
  GetApiController() : super(GetApiState(getApiList: [], isLoading: false, error: ''));

  Future<void> getApi() async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final response = await AuthRepo.getApiRepo();
      state = state.copyWith(getApiList: response, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final getApiControllerProvider = StateNotifierProvider<GetApiController, GetApiState>((ref) {
  return GetApiController();
});
