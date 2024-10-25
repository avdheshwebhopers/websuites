import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String selectedSetting = 'Select a setting to view details';

  // Map of settings options and corresponding content to display
  final Map<String, String> settingsDetails = {
    'Wi-Fi': 'Wi-Fi settings allow you to manage your wireless networks.',
    'Bluetooth': 'Bluetooth settings enable device connectivity via Bluetooth.',
    'Network': 'Network settings control your data connections.',
    'Battery': 'Battery settings provide details on battery usage.',
    'General': 'General settings include device management options.',
    'Accessibility': 'Accessibility settings help you configure accessibility features.',
    'Appearance': 'Appearance settings allow customization of the system look.',
    'Privacy & Security': 'Control your privacy and security settings here.',
    'Notifications': 'Manage notifications for your apps here.',
    'Sound': 'Adjust sound settings and volumes.',
    'Display': 'Display settings manage screen brightness and resolution.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: Builder(
          builder: (BuildContext context) {

            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                if (MediaQuery.of(context).size.width <= 600) {
                  Scaffold.of(context).openDrawer();
                }
              },
            );
          },
        ),
      ),
      // Use LayoutBuilder to determine the layout
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Fixed side menu for larger screens
            return Row(
              children: [
                Container(
                  width: 250,
                  color: Colors.grey[200],
                  child: ListView(
                    children: settingsDetails.keys.map((setting) {
                      return _buildSettingsItem(setting);
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: _buildDetailView(),
                ),
              ],
            );
          } else {
            // Drawer for smaller screens
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: settingsDetails.keys.map((setting) {
                  return _buildSettingsItem(setting);
                }).toList(),
              ),
            );
          }
        },
      ),
      // Right-side content area for displaying selected setting details
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: settingsDetails.keys.map((setting) {
            return _buildSettingsItem(setting);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDetailView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          settingsDetails[selectedSetting] ?? 'Select a setting to view details',
          style: TextStyle(fontSize: 18, color: Colors.grey[800]),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildSettingsItem(String setting) {
    return ListTile(
      leading: Icon(_getIconForSetting(setting), size: 30),
      title: Text(setting, style: TextStyle(fontSize: 18)),
      tileColor: selectedSetting == setting ? Colors.green[100] : null, // Highlight selected item
      onTap: () {
        setState(() {
          selectedSetting = setting; // Update the selected setting
        });
        if (MediaQuery.of(context).size.width <= 600) {
          Navigator.of(context).pop(); // Close the drawer after selection
        }
      },
    );
  }

  IconData _getIconForSetting(String setting) {
    switch (setting) {
      case 'Wi-Fi':
        return Icons.wifi;
      case 'Bluetooth':
        return Icons.bluetooth;
      case 'Network':
        return Icons.network_cell;
      case 'Battery':
        return Icons.battery_full;
      case 'General':
        return Icons.settings;
      case 'Accessibility':
        return Icons.accessibility;
      case 'Appearance':
        return Icons.color_lens;
      case 'Privacy & Security':
        return Icons.lock;
      case 'Notifications':
        return Icons.notifications;
      case 'Sound':
        return Icons.volume_up;
      case 'Display':
        return Icons.screen_lock_landscape;
      default:
        return Icons.settings;
    }
  }
}