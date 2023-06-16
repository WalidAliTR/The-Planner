import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ActivePlan.dart';
import 'UnDonePlans.dart';
import 'CompletedPlans.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {

    // ignore: non_constant_identifier_names
    Future<void> GotoActivePlans() async {
      Navigator.pop(context);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const ActivePlan()));
    }
    // ignore: non_constant_identifier_names
    Future<void> GotoUnDonePlans() async {
      Navigator.pop(context);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const UnDonePlans()));
    }
    // ignore: non_constant_identifier_names
    Future<void> GotoCompletedPlans() async {
      Navigator.pop(context);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const CompletedPlans()));
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('WA Tech\'s',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,)),
            accountEmail: const Text('kg4626494@gmail.com',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('Assets/Images/users.png',
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.library_add),
            title: const Text('Active Plans / Add New'),
            onTap: () => GotoActivePlans(),
          ),
          ListTile(
            leading: const Icon(Icons.library_add_check),
            title: const Text('Completed Plans'),
            onTap: () => GotoCompletedPlans(),
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: const Text('Uncompleted Plans'),
            onTap: () => GotoUnDonePlans(),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => SystemNavigator.pop(),
          ),
          const Divider(),

        ],
      ),
    );
  }
}