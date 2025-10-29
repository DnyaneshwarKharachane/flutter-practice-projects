// Flutter dashboard layout for Student, Faculty, and Admin roles

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: RoleSelectionScreen(),
    );
  }
}

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Role')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => StudentDashboard())),
              child: Text('Student'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FacultyDashboard())),
              child: Text('Faculty'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdminDashboard())),
              child: Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Student Dashboard',
      features: [
        'Mark Attendance',
        'Save Notes (AI Assist)',
        'Ask AI Chatbot',
        'Library',
        'Canteen Wallet',
        'Exams',
        'Notifications'
      ],
    );
  }
}

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Faculty Dashboard',
      features: [
        'Take Attendance',
        'Upload Notes',
        'Check Student Queries',
        'Generate Reports',
        'Notifications'
      ],
    );
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      title: 'Admin Dashboard',
      features: [
        'User Management',
        'Attendance Reports',
        'Payments Overview',
        'Library Management',
        'Notifications',
        'AI Analytics (Future)'
      ],
    );
  }
}

class DashboardLayout extends StatelessWidget {
  final String title;
  final List<String> features;

  const DashboardLayout({required this.title, required this.features, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  features[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}