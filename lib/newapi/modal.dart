class New {
  int? allocationId;
  int? clientId;
  int? categoryId;
  int? employeeId;
  String? description;
  String? scheduledDate;
  String? dueDate;
  String? status;
  String? startedDate;
  String? completedDate;
  String? uploadsPath;
  int? createdBy;

  New(
      {this.allocationId,
        this.clientId,
        this.categoryId,
        this.employeeId,
        this.description,
        this.scheduledDate,
        this.dueDate,
        this.status,
        this.startedDate,
        this.completedDate,
        this.uploadsPath,
        this.createdBy});

  New.fromJson(Map<String, dynamic> json) {
    allocationId = json['allocationId'];
    clientId = json['clientId'];
    categoryId = json['categoryId'];
    employeeId = json['employeeId'];
    description = json['description'];
    scheduledDate = json['scheduledDate'];
    dueDate = json['dueDate'];
    status = json['status'];
    startedDate = json['startedDate'];
    completedDate = json['completedDate'];
    uploadsPath = json['uploadsPath'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allocationId'] = this.allocationId;
    data['clientId'] = this.clientId;
    data['categoryId'] = this.categoryId;
    data['employeeId'] = this.employeeId;
    data['description'] = this.description;
    data['scheduledDate'] = this.scheduledDate;
    data['dueDate'] = this.dueDate;
    data['status'] = this.status;
    data['startedDate'] = this.startedDate;
    data['completedDate'] = this.completedDate;
    data['uploadsPath'] = this.uploadsPath;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
