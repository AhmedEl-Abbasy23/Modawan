import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int id;
  final String title;
  final String details;
  final String color;

  const Note({
    required this.id,
    required this.title,
    required this.details,
    required this.color,
  });

  @override
  List<Object> get props => [id, title, details,color];
}
