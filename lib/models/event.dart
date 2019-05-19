class Event {
  String eventId;
  String eventTitle;
  String eventPrivacy;
  String eventDescription;
  String eventCategory;
  String startTime;
  String endTime;
  String location;
  String address;
  String imageUrl;
  String creatorId;
  String creatorUserName;
  List<String> coHosts;

  Event(
      {this.eventId,
      this.eventTitle,
      this.eventPrivacy,
      this.eventDescription,
      this.eventCategory,
      this.startTime,
      this.endTime,
      this.location,
      this.address,
      this.imageUrl,
      this.creatorId,
      this.creatorUserName,
      this.coHosts});

  Event.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventTitle = json['eventId'];
    eventPrivacy = json['eventId'];
    eventDescription = json['eventId'];
    eventCategory = json['eventId'];
    startTime = json['eventId'];
    endTime = json['eventId'];
    location = json['eventId'];
    address = json['eventId'];
    imageUrl = json['eventId'];
    creatorId = json['eventId'];
    creatorUserName = json['creatorUserName'];
    coHosts = json['eventId'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventId'] = this.eventId;
    data['eventTitle']= this.eventTitle;
    data['eventPrivacy']= this.eventPrivacy;
    data['eventDescription']= this.eventDescription;
    data['eventCategory']= this.eventCategory;
    data['startTime']= this.startTime;
    data['location']= this.location;
    data['address']= this.address;
    data['imageUrl']= this.imageUrl;
    data['creatorId']= this.creatorId;
    data['creatorUserName']= this.creatorUserName;
    data['coHosts']= this.coHosts;

    return data;
  }


}
