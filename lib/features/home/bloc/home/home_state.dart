part of 'home_bloc.dart';

class HomeState extends Equatable{
  final String? token;
  final int index;

  const HomeState({this.token, required this.index});

  factory HomeState.initial() {
    return const HomeState(token: '', index: 0);
  }

  @override
  List<Object?> get props => [token, index];

  @override
  bool get stringify => true;

  HomeState copyWith({String? token, int? index}) {
    return HomeState(
      token: token ?? this.token,
      index: index ?? this.index,
    );
  }
}
