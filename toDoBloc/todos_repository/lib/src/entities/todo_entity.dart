import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_entity.g.dart';

@JsonSerializable()
class TodoEntity extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;

  const TodoEntity(this.task, this.id, this.note, this.complete);

  List<Object> get props => [complete, id, note, task];

  @override
  String toString() {
    return 'TodoEntity { complete: $complete, task: $task, note: $note, id: $id }';
  }

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TodoEntityToJson(this);

  factory TodoEntity.fromSnapshot(DocumentSnapshot snap) => TodoEntity(
        snap.data['task'],
        snap.documentID,
        snap.data['note'],
        snap.data['complete'],
      );

  Map<String, Object> toDocument() {
    return {
      "complete": complete,
      "task": task,
      "note": note,
    };
  }
}
