class UserResponse {
  int age, count;
  String status;
  UserResponse(this.age, this.count, this.status);

  UserResponse.fromJson(Map<String, dynamic> json)
      : age = json['age'],
        count = json['count'],
        status = "Success";
}
