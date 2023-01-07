// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class PostProject {
   ImageFile? imageFile;
   String projectName;
   String customerId;
   String memberId;
   String note;
   List<String> tags;
  PostProject({
    this.imageFile,
    required this.projectName,
    required this.customerId,
    required this.memberId,
    required this.note,
    required this.tags,
  });
  

  PostProject copyWith({
    ImageFile? imageFile,
    String? projectName,
    String? customerId,
    String? memberId,
    String? note,
    List<String>? tags,
  }) {
    return PostProject(
      imageFile: imageFile ?? this.imageFile,
      projectName: projectName ?? this.projectName,
      customerId: customerId ?? this.customerId,
      memberId: memberId ?? this.memberId,
      note: note ?? this.note,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageFile': imageFile,
      'projectName': projectName,
      'customerId': customerId,
      'memberId': memberId,
      'note': note,
      'tags': tags,
    };
  }

  factory PostProject.fromMap(Map<String, dynamic> map) {
    return PostProject(
      imageFile: map['imageFile'] != null ? map['imageFile'] as ImageFile : null,
      projectName: map['projectName'] as String,
      customerId: map['customerId'] as String,
      memberId: map['memberId'] as String,
      note: map['note'] as String,
      tags: List<String>.from((map['tags'] as List<String>),)
    );
  }

  String toJson() => json.encode(toMap());

  factory PostProject.fromJson(String source) => PostProject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostProject(imageFile: $imageFile, projectName: $projectName, customerId: $customerId, memberId: $memberId, note: $note, tags: $tags)';
  }

  @override
  bool operator ==(covariant PostProject other) {
    if (identical(this, other)) return true;
  
    return 
      other.imageFile == imageFile &&
      other.projectName == projectName &&
      other.customerId == customerId &&
      other.memberId == memberId &&
      other.note == note &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return imageFile.hashCode ^
      projectName.hashCode ^
      customerId.hashCode ^
      memberId.hashCode ^
      note.hashCode ^
      tags.hashCode;
  }
}
