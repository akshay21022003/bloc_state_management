
import 'package:block_state_management/bloc/favourite/favourite_event.dart';
import 'package:block_state_management/bloc/favourite/favourite_state.dart';
import 'package:block_state_management/model/favourite_item_model.dart';
import 'package:block_state_management/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteItemEvents,FavouriteItemState>{

  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteList = [];
  FavouriteBloc(this.favouriteRepository):super(const FavouriteItemState()){
    on<FetchFavouriteList>(fetchList);
  }

  void fetchList(FetchFavouriteList event , Emitter<FavouriteItemState> emit)async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(favouriteItemModelList: favouriteList,listStatus:ListStatus.success ));
  }
}