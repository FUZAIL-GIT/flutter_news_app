// generic class for all the use cases inside app
abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});
}
