import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:try_sign_up/post_page/cubits/cubit/post_state.dart';
import 'package:try_sign_up/post_page/model/post_model.dart';


class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());
  List<PostModel>posts=[];
  Future<void>fetchData()async{
    try{
      emit(GetPostLoading());
      final response=await Dio().get("https://dummyjson.com/posts");
      final List data = response.data['posts'];
      posts = data
          .map((e) => PostModel.fromJson(e))
          .toList();      emit(GetPostSuccess());
    }catch(e){
      emit(GetPostError(error: e.toString()));
    }
  }
}