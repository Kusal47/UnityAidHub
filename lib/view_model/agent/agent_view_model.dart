// import 'package:bms_win/db/app.db.dart';
// import 'package:bms_win/view_model/customer/customer_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import '../../db/repository/agent_repository.dart';
// import 'dart:async';

// class AgentViewModel with ChangeNotifier {
//   AgentViewModel() {
//     getAllAgents();
//   }
//   final AgentRepository _agentRepository = AgentRepository();
//   final CustomerViewModel _customerViewModel = CustomerViewModel();

//   Logger logger = Logger();

//   List<AgentData> _agents = [];

//   List<AgentData> get agents => _agents;
//   AgentData? _selectedAgent;
//   AgentData? get selectedAgent => _selectedAgent;

//   void setSelectedAgent(AgentData agent) {
//     _selectedAgent = agent;
//     notifyListeners();
//   }

//   void setSelectedAgentBycid(int id) {
//     _selectedAgent = _agents.where((element) => element.id == _customerViewModel.getCustomerById(id).agentId).single;
//     notifyListeners();
//   }

  

//   Future<void> getAllAgents() async {
//     try {
//       var agents = await _agentRepository.getAgent();

//       _agents = agents;

//       notifyListeners();
//     } on Exception catch (e) {
//       logger.e(e.toString());
//     }
//   }

//   AgentData getAgentById(int id) {
//     return _agents.where((element) => element.id == id).toList()[0];
//   }

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
//     _agentRepository.deleteAgent(id).then((_) {
//       refreshAgents();
//     });
//   }

//   deleteAllAgents() async {
//     await AgentRepository().deleteAllAgent();
//     _agents = [];
//     notifyListeners();
//   }

//   void searchallAgents(String search) {
//     _agents = _agents
//         .where(
//           (agent) => agent.userName
//               .toString()
//               .toLowerCase()
//               .contains(search.toLowerCase()),
//         )
//         .toList();
//     print(_agents);

//     notifyListeners();
//   }
// }
