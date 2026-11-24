import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List contacts = [];


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF29384D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF29384D),
        elevation: 0,
        title: Image.asset(
          "assets/images/route.png",
          height: 40,
        ),
      ),


      body: contacts.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.list_alt, size: 90, color: Color(0xFFFFF1D4)),
            SizedBox(height: 10),
            Text(
              'There is No Contacts Added Here',
              style: TextStyle(color: Color(0xFFFFF1D4), fontSize: 16),
            ),
          ],
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.65,
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return buildContactCard(index);
        },
      ),


      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          if (contacts.isNotEmpty)
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  contacts.removeLast();
                });
              },
              child: const Icon(Icons.delete, color: Colors.white),
            ),
          const SizedBox(height: 10),

          if (contacts.length < 6)
            FloatingActionButton(
              backgroundColor: const Color(0xFFFFF1D4),
              onPressed: () {
                openAddSheet();
              },
              child: const Icon(Icons.add, color: Color(0xFF29384D)),
            ),
        ],
      ),
    );
  }


  Widget buildContactCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1D4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [

          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF3E5068),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: const Icon(Icons.person, size: 60, color: Color(0xFFFFF1D4)),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF1D4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contacts[index]['name']!,
                      style: const TextStyle(
                        color: Color(0xFF29384D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.email, size: 15, color: Color(0xFF29384D)),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        contacts[index]['email']!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 15, color: Color(0xFF29384D)),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        contacts[index]['phone']!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      setState(() {
                        contacts.removeAt(index);
                      });
                    },
                    icon: const Icon(Icons.delete, size: 15, color: Colors.white),
                    label: const Text('Delete', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  void openAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF29384D),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter User Name',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter User Email',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                ),
              ),
              const SizedBox(height: 12),


              TextField(
                controller: phoneController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Enter User Phone',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFFFF1D4)),
                  ),
                ),
              ),
              const SizedBox(height: 20),


              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF1D4),
                  ),
                  onPressed: () {

                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      setState(() {
                        contacts.add({
                          'name': nameController.text,
                          'email': emailController.text,
                          'phone': phoneController.text,
                        });
                      });


                      nameController.clear();
                      emailController.clear();
                      phoneController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Enter user',
                    style: TextStyle(color: Color(0xFF29384D), fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}