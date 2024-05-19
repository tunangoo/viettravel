import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viettravel/helpers/number_format.dart';
import 'package:viettravel/providers/ticket_provider.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final tickets = Provider.of<TicketProvider>(context).tickets;
    print(tickets);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Vé đã đặt",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: tickets.isEmpty
        ? Center(child: Text('Không có vé nào'))
        : ListView.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              print("ticket image");
              print(ticket.placeImage);
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey[200]!, width: 1.0),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      width: screenWidth * 0.4,
                      ticket.placeImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket.placeName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text("Thời gian vào: ${convertDateTimeFormat(ticket.entryTime)}"),
                        Text("Số lượng vé: ${ticket.quantity}"),
                        Text("Thanh toán: ${convertToVND(ticket.totalAmount)}₫"),
                      ],
                    ),
                  ],
                ),
              );
            },
        ),
    );
  }
}
