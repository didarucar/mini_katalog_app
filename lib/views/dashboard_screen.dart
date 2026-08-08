import 'package:flutter/material.dart';
import '../services/theme_service.dart';
import '../services/user_service.dart'; 

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ThemeService themeService = ThemeService();
  final UserService userService = UserService(); 
  bool notifications = true;
  double volume = 40.0;
  String gender = "Erkek";

  late final TextEditingController nameController;
  late final TextEditingController surnameController;

  @override
  void initState() {
    super.initState();
    // Mevcut ortak isimleri controller'a yüklüyoruz
    nameController = TextEditingController(text: userService.name);
    surnameController = TextEditingController(text: userService.surname);
  }

  @override
  Widget build(BuildContext context) {
    final bool darkMode = themeService.isDarkMode;
    final bgColor = darkMode ? Colors.grey.shade900 : Colors.white;
    final textColor = darkMode ? Colors.white : Colors.black;
    final subtitleColor = darkMode ? Colors.grey.shade400 : Colors.grey.shade700;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text("Dashboard", style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        iconTheme: IconThemeData(color: textColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Hosgeldin", style: TextStyle(color: subtitleColor)),
          Text("${userService.name} ${userService.surname}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
          const SizedBox(height: 20),
          
          SwitchListTile(
            title: Text("Bildirimler", style: TextStyle(color: textColor)),
            value: notifications,
            onChanged: (val) => setState(() => notifications = val),
          ),
          SwitchListTile(
            title: Text("Karanlık Mod", style: TextStyle(color: textColor)),
            value: darkMode,
            onChanged: (val) {
              setState(() {
                themeService.toggleDarkMode(val);
              });
            },
          ),
          
          ListTile(title: Text("Ses Seviyesi", style: TextStyle(color: textColor))),
          Slider(
            value: volume,
            min: 0,
            max: 100,
            onChanged: (val) => setState(() => volume = val),
          ),

          ListTile(title: Text("Cinsiyet", style: TextStyle(color: textColor))),
          Row(
            children: [
              Radio<String>(
                value: "Kadın",
                groupValue: gender,
                onChanged: (val) => setState(() => gender = val!),
              ),
              Text("Kadın", style: TextStyle(color: textColor)),
              const SizedBox(width: 20),
              Radio<String>(
                value: "Erkek",
                groupValue: gender,
                onChanged: (val) => setState(() => gender = val!),
              ),
              Text("Erkek", style: TextStyle(color: textColor)),
            ],
          ),
          const SizedBox(height: 20),

          Text("Kişisel Bilgileri Güncelle", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor)),
          const SizedBox(height: 10),
          TextField(
            controller: nameController,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              labelText: "Ad",
              labelStyle: TextStyle(color: subtitleColor),
              filled: true,
              fillColor: darkMode ? Colors.grey.shade800 : Colors.grey.shade100,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
            onChanged: (val) {
              userService.updateName(val, surnameController.text);
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          TextField(
            controller: surnameController,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              labelText: "Soyad",
              labelStyle: TextStyle(color: subtitleColor),
              filled: true,
              fillColor: darkMode ? Colors.grey.shade800 : Colors.grey.shade100,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
            onChanged: (val) {
              userService.updateName(nameController.text, val);
              setState(() {});
            },
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: darkMode ? Colors.blue.shade900 : Colors.blue.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Seçmiş Olduğunuz Ayarlar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: darkMode ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 8),
                Text("İsim: ${userService.name} ${userService.surname}", style: TextStyle(color: darkMode ? Colors.white70 : Colors.black87)),
                Text("Bildirimler: ${notifications ? 'Açık' : 'Kapalı'}", style: TextStyle(color: darkMode ? Colors.white70 : Colors.black87)),
                Text("Karanlık Mod: ${darkMode ? 'Açık' : 'Kapalı'}", style: TextStyle(color: darkMode ? Colors.white70 : Colors.black87)),
                Text("Ses Seviyesi: ${volume.toStringAsFixed(1)}", style: TextStyle(color: darkMode ? Colors.white70 : Colors.black87)),
                Text("Cinsiyet: $gender", style: TextStyle(color: darkMode ? Colors.white70 : Colors.black87)),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}