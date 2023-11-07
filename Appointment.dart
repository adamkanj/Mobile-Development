import 'package:flutter/material.dart';

class Reservation {
  final String room;
  final DateTime dateTime;

  Reservation({required this.doctor, required this.dateTime});
}

class ReservationsPage extends StatefulWidget {
  @override
  _ReservationsPageState createState() => _ReservationsPageState();
}

class _AppointmentPageState extends State<ReservationsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedroomsize;
  DateTime? _selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reservations')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('roomsize example .....', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),

                  SizedBox(height: 16),
                  Text('Date and time of availability', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),

                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('reserve room'),
                    onPressed: () {
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: _appointments.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(16),
                  child: ListTile(
                    title: Text('Reservation to this hotel room'),
        subtitle: Text('Date and Time: 00/00/00'),
        trailing: IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
        setState(() {
        _reservations.removeAt(index);
          });
            },
                ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
}







