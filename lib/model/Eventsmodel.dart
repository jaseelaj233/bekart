// class Eventsmodel {
//   final String Event;
//   final String Eventteamname;
//   final String Eventimage;

//   Eventsmodel({
//     required this.Event,
//     required this.Eventteamname,
//     required this.Eventimage,

//   });
//   factory Eventsmodel.(Map<String, dynamic> json) {
//     return Eventsmodel(
//       Event: json['Event'],
//       Eventteamname: json['Eventteamname'],
//       Eventimage: json['eventimage'],

//     );
//   }

//   get docs => null;
//   Map<String, dynamic> toJson() {
//     return {
//       'Event': Event,
//       'Eventteamname': Eventteamname,
//       'eventimage': Eventimage,

//     };
//   }
// }

class Eventsmodel {
  final String event;
  final String eventTeamName;
  final String eventImage;
  final String phone;

  Eventsmodel({
    required this.event,
    required this.eventTeamName,
    required this.eventImage,
    required this.phone,
  });

  // Factory constructor to create Eventsmodel from a map (JSON)
  factory Eventsmodel.fromJson(Map<String, dynamic> json) {
    return Eventsmodel(
      event: json['Event'],
      eventTeamName: json['Eventteamname'],
      eventImage: json['eventimage'],
      phone: json['phone'],
    );
  }

  // Method to convert Eventsmodel to a map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'eventteamname': eventTeamName,
      'eventImage': eventImage,
      'phone': phone,
    };
  }
}
