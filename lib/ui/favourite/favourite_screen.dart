import 'package:block_state_management/bloc/favourite/favourite_bloc.dart';
import 'package:block_state_management/bloc/favourite/favourite_event.dart';
import 'package:block_state_management/bloc/favourite/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteItemState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.success:
              return ListView.builder(
                  itemCount: state.favouriteItemModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          state.favouriteItemModelList[index].value.toString()),
                    );
                  }
              );
            case ListStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ListStatus.failure:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return Container(); // Or any other appropriate widget
          }
        },
      ),
    );
  }
}