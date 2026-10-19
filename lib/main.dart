import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_sign_up/post_page/cubits/cubit/post_cubit.dart';
import 'package:try_sign_up/post_page/view/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      title: 'Get Post',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => GetPostCubit()..fetchData(),
        child: const PostPage(),
    ));
  }
}

