import 'package:flutter/material.dart';


class AgentDetails extends StatefulWidget {

  const AgentDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Agent Details",
            style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
