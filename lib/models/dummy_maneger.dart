import 'package:flutter/material.dart';

class Manager {
  final String managerId;
  final String managerName;
  final String managerPostion;
  final String managerAvatar;
  

  const Manager({
    @required this.managerId,
    @required this.managerName,
    @required this.managerPostion,
    @required this.managerAvatar,
  
  });
}

final List<Manager> dummyManagers = [
  
  Manager(
    managerId: "1",
    managerName: "Alaa",
    managerPostion: "CEO",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "2",
    managerName: "Asmaa",
    managerPostion: "CFO",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "3",
    managerName: "Mohammed",
    managerPostion: "VP",
    managerAvatar: "https://via.placeholder.com/150"
  ),
   Manager(
    managerId: "4",
    managerName: "Abdullah",
    managerPostion: "CCO",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "5",
    managerName: "Bshayer",
    managerPostion: "HR",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "6",
    managerName: "Khojah",
    managerPostion: "Project Manager",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "6",
    managerName: "Khojah",
    managerPostion: "Project Manager",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "6",
    managerName: "Khojah",
    managerPostion: "Project Manager",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
   Manager(
    managerId: "6",
    managerName: "Khojah",
    managerPostion: "Project Manager",
    managerAvatar: "https://i.imgur.com/BoN9kdC.png"
  ),
];