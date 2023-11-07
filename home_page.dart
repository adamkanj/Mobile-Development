import 'package:flutter/material.dart';
import 'login_page.dart';
import 'ReservationsPage.dart';


class HomePage extends StatelessWidget {
  final User user= User(name: 'adam kanj', email: 'adamk@mail.com', profileImageUrl: 'profile.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 120, 224),
        title: Text(
          "Reservations",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Welcome to myAPP",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                 Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage("assets/images/banner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Text(
                      "Welcome to myapp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      "Customer is always right",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Choose a date and time', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text(_selectedDateTime == null
                ? 'Select a date and time'
                : 'Selected date and time: ${_selectedDateTime!.toString()}'),
            onPressed: () async {
              final selectedDateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 365)),
              );
              if (selectedDateTime != null) {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  setState(() {
                    _selectedDateTime = DateTime(
                      selectedDateTime.year,
                      selectedDateTime.month,
                      selectedDateTime.day,
                      selectedTime.hour,
                      selectedTime.minute,
                    );
                  });
                }
              }
            },
          ),
          SizedBox(
            height:10          
            ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  MouseRegion(
            cursor: SystemMouseCursors.click,
            child:  _buildCategoryCard(
                    context,
                    "Room number 1 in hotel",
                    "assets/images/hotel.jpg",
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationsPage()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
            child: _buildCategoryCard(
                    context,
                    "Room number 2 in hotel",
                    "assets/images/hotel2.jpg",
                    ()
                     {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationsPage()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
                  child: _buildCategoryCard(
                    context,
                    "Room number 3 in hotel ...",
                    "assets/images/hotel3.jpg",
                    
                  
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationsPage()));
                    },
                  ),
                  ),
                  MouseRegion(
            cursor: SystemMouseCursors.click,
                  child: _buildCategoryCard(
                    context,
                    "Room number 4 in hotel ..",
                    "assets/images/Hotel4.jpg",
                    () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationsPage()));
                    },
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String imagePath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.2),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      height: 250, // Updated height
    ),
  );
}
}