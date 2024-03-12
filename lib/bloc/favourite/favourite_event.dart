
import 'package:equatable/equatable.dart';

abstract class FavouriteItemEvents extends Equatable{
  const FavouriteItemEvents();
  @override
  List<Object> get props => [];
}

class FetchFavouriteList extends FavouriteItemEvents{}