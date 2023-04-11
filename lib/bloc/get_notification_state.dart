part of 'get_notification_bloc.dart';

@immutable
abstract class GetNotificationState {}

class GetNotificationInitial extends GetNotificationState {}
class GetNotificationLoading extends GetNotificationState {}
class GetNotificationLoaded extends GetNotificationState {
  final List<Data>getModelList;
 
  GetNotificationLoaded({required this.getModelList});
  @override
  List<Object> get props => [getModelList];
  
}

class GetNotificationError extends GetNotificationState {
  final String message;
  GetNotificationError({required this.message});
  @override
  List<Object> get props => [message];
}