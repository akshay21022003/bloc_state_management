import 'package:block_state_management/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus{loading,success,failure}
class FavouriteItemState extends Equatable{

  final List<FavouriteItemModel> favouriteItemModelList;
  final ListStatus listStatus;
  const FavouriteItemState({
    this.favouriteItemModelList =  const [],
    this.listStatus = ListStatus.loading
  });

  FavouriteItemState copyWith({List<FavouriteItemModel>? favouriteItemModelList, ListStatus? listStatus}){
    return FavouriteItemState(
      favouriteItemModelList: favouriteItemModelList ?? this.favouriteItemModelList,
      listStatus: listStatus ?? this.listStatus
    );
  }
@override
List<Object> get props =>[favouriteItemModelList,listStatus];
}