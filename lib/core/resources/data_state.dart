import 'package:dio/dio.dart';

// abstract class to manage the state of the data
abstract class DataState<T> {
  final T? data;
  final DioException? error;
  const DataState({this.data, this.error});
}

// success case
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

// failure case
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
