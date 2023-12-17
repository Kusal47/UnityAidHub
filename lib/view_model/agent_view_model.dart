// import 'package:bms_win/db/app.db.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import '../db/repository/agent_repository.dart';
// import 'dart:async';
// // import 'package:path/path.dart' as path;

// class AgentViewModel with ChangeNotifier {
//   //  make a constructor and call getall agents function
//   AgentViewModel() {
//     getAllAgents();
//   }
//   final AgentRepository _agentRepository = AgentRepository();
//   Logger logger = Logger();

//   List<AgentData> _agents = [];
//   int? selectedAgentId;

//   List<AgentData> _allAgents = [];
//   List<AgentData> get allAgents => _allAgents;

//   List<AgentData> get agents => _agents;



//   int? get selectedCustomer => selectedAgentId;
//   Future<void> getAllAgents() async {
//     try {
//       var agents = await _agentRepository.getAgent();
//       _allAgents = agents;
//       _agents = agents.where((element) => false == element.isDeleted).toList();

//       notifyListeners();
//     } on Exception catch (e) {
//       logger.e(e.toString());
//     }
//   }

//   AgentData getAgentById(int id) {
//     return _allAgents.firstWhere((element) => element.id == id);
//   }

//   // void refreshAgents() {
//   //   AgentRepository().getAgent().then((agents) {
//   //     var agentss = agents;
//   //     _agents = agentss.where((element) => false == element.isDeleted).toList();
//   //     notifyListeners();
//   //   });
//   // }
//   void refreshAgents() {
//     AgentRepository().getAgent().then((agents) {
//       var agentss = agents;
//       _agents = agentss.where((element) => false == element.isDeleted).toList();
//       notifyListeners();
//     });
//   }

//   void addAgent(AgentCompanion agent) {
//     print(agent);
//     AgentRepository().addAgent(agent);
//     refreshAgents();
//     notifyListeners();
//   }

//   void updateAgent(AgentCompanion agent) {
//     AgentRepository().updateAgent(agent);
//     refreshAgents();
//     notifyListeners();
//   }

//   void removeAgent(int id) {
//     AgentRepository().getdeletedAgent().then((_) {
//       refreshAgents();
//       notifyListeners();
//     });
//   }
//   void deleteAgent(int id) {
//   _agentRepository.deleteAgent(id).then((_) {
//     refreshAgents();
//   });
// }
//   deleteAllAgents() async {
//     await AgentRepository().deleteAllAgent();
//     // Update the _personList to an empty list after deletion
//     _agents = [];
//     notifyListeners();
//   }

// }
