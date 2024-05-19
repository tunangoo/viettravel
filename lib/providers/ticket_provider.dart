import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:viettravel/services/api_handle.dart';

import '../models/ticket_model.dart';

class TicketProvider extends ChangeNotifier {
  List<TicketModel> _tickets = [];

  List<TicketModel> get tickets => _tickets;

  void setTickets(List<TicketModel> tickets) {
    _tickets = tickets;
    notifyListeners();
  }

  Future<void> fetchGetTickets() async {
    try {
      final response = await getAllTickets();
      print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        _tickets = jsonData.map((item) => TicketModel.fromJson(item)).toList();
      } else {
        // Handle error response
      }
    } catch (error) {
      // Handle error
    }
    notifyListeners();
  }
}