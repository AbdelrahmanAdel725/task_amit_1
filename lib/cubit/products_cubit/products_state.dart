part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}
class ProductsLoadingState extends ProductsState {}
class ProductsSuccessState extends ProductsState {}
class ProductsErrorState extends ProductsState {}
