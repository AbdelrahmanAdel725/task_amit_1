import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitialState());
  static ProductsCubit get(context)=> BlocProvider.of(context);

  List<ProductsModel> products = [];

  void getProducts() async
  {
    emit(ProductsLoadingState());
    await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products/')).then((value)
    {
      if(value.statusCode == 200)
      {
        var json = jsonDecode(value.body);
        products = [];
        for(var element in json)
        {
          products.add(ProductsModel.fromJson(element));
        }
        emit(ProductsSuccessState());
      }else
      {
        emit(ProductsErrorState());
      }
    }).catchError((e){
      emit(ProductsErrorState());
    });
  }

}
