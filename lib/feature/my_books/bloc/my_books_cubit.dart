import 'package:bloc/bloc.dart';

part 'my_books_state.dart';

class MyBooksCubit extends Cubit<MyBooksState> {
  MyBooksCubit() : super(MyBooksInitial());
}
