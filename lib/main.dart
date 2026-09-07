import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive UI Design - Experiment 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Adaptive UI Design',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Experiment 2 Info',
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Experiment 2',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.aspect_ratio, size: 40, color: Colors.deepPurple),
                children: const [
                  Text('Aim: Adaptive and Responsive UI Design'),
                  Text('Uses LayoutBuilder to adapt UI based on screen constraints (< 600px vs >= 600px).'),
                ],
              );
            },
          ),
        ],
      ),

      // Step 4 - LayoutBuilder to create adaptive layout
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return Column(
            children: [
              // Screen size feedback banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: isMobile ? Colors.amber.shade100 : Colors.teal.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isMobile ? Icons.phone_android : Icons.desktop_windows,
                      size: 20,
                      color: isMobile ? Colors.amber.shade900 : Colors.teal.shade900,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Width: ${constraints.maxWidth.toInt()}px  |  Mode: ${isMobile ? "Mobile Layout (< 600px)" : "Desktop / Tablet Layout (≥ 600px)"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: isMobile ? Colors.amber.shade900 : Colors.teal.shade900,
                      ),
                    ),
                  ],
                ),
              ),

              // Main content: Step 5 (Mobile Column) vs Step 6 (Desktop Row)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: isMobile
                      ? _buildMobileLayout(context)
                      : _buildDesktopLayout(context),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Step 5 – Create mobile layout (Column layout for smaller screens)
  Widget _buildMobileLayout(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Mobile View (Single Column)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Card(
          elevation: 2,
          color: Colors.deepPurple.shade50,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: const Text('Student', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('View and manage student profiles'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showSnackBar(context, 'Opened Mobile Student View'),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          color: Colors.indigo.shade50,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Icon(Icons.book, color: Colors.white),
            ),
            title: const Text('Courses', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Browse active curriculum and subjects'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showSnackBar(context, 'Opened Mobile Courses View'),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          color: Colors.teal.shade50,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.teal,
              child: Icon(Icons.school, color: Colors.white),
            ),
            title: const Text('Faculty', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Department professors and lab instructors'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showSnackBar(context, 'Opened Mobile Faculty View'),
          ),
        ),
      ],
    );
  }

  // Step 6 – Create desktop layout (Row with Expanded widgets for larger screens)
  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Desktop / Tablet View (Horizontal Expanded Row)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 3,
                color: Colors.deepPurple.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.deepPurple,
                      child: Icon(Icons.person, size: 28, color: Colors.white),
                    ),
                    title: const Text('Student', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: const Text('Total Enrolled: 120 Students\nActive Profiles'),
                    isThreeLine: true,
                    onTap: () => _showSnackBar(context, 'Opened Desktop Student Portal'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                elevation: 3,
                color: Colors.indigo.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.book, size: 28, color: Colors.white),
                    ),
                    title: const Text('Courses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: const Text('Active Modules: 6 Subjects\nFlutter, Cloud, DBMS'),
                    isThreeLine: true,
                    onTap: () => _showSnackBar(context, 'Opened Desktop Courses Portal'),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                elevation: 3,
                color: Colors.teal.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.school, size: 28, color: Colors.white),
                    ),
                    title: const Text('Faculty', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: const Text('Department Staff: 15\nCSE Department'),
                    isThreeLine: true,
                    onTap: () => _showSnackBar(context, 'Opened Desktop Faculty Portal'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
