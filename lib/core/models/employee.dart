class Employee {
  int? id;
  String? firstName;
  String? lastName;
  String? designation;
  int? level;
  int? productivityScore;
  String? currentSalary;
  int? employmentStatus;

  Employee(
      {this.id,
        this.firstName,
        this.lastName,
        this.designation,
        this.level,
        this.productivityScore,
        this.currentSalary,
        this.employmentStatus});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    designation = json['designation'] ?? '';
    level = json['level'] ?? 0;
    productivityScore = json['productivity_score'] ?? 0;
    currentSalary = json['current_salary'] ?? '';
    employmentStatus = json['employment_status'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['designation'] = designation;
    data['level'] = level;
    data['productivity_score'] = productivityScore;
    data['current_salary'] = currentSalary;
    data['employment_status'] = employmentStatus;
    return data;
  }
}
