import 'package:breed_me/Models/consultation_comment.dart';

class Consultation {
  String id;
  String userId;
  String description;
  String image;
  String createdAt;
  List<ConsultationComment> consultationComments;
  Consultation(
      this.id, this.userId, this.description, this.image, this.createdAt,this.consultationComments);
}
