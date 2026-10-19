import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_sign_up/post_page/cubits/cubit/post_cubit.dart';
import 'package:try_sign_up/post_page/cubits/cubit/post_state.dart';
import 'package:try_sign_up/post_page/widget/post_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), centerTitle: true),
      body: BlocBuilder<GetPostCubit, GetPostState>(
        builder: (context, state) {
          if (state is GetPostLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetPostError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 12),
                  Text(state.error, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<GetPostCubit>().fetchData();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is GetPostSuccess) {
            final posts = context.read<GetPostCubit>().posts;

            if (posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }

            return RefreshIndicator(
              onRefresh: () => context.read<GetPostCubit>().fetchData(),
              child: ListView.separated(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return PostItemWidget(post: post);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 1),
              ),
            );
          }

          return const Center(child: Text('Loading posts...'));
        },
      ),
    );
  }
}
