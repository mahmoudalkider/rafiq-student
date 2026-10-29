
import 'package:flutter/material.dart';

void main() {
  runApp(const RafiqStudentApp());
}

class RafiqStudentApp extends StatelessWidget {
  const RafiqStudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'رفيق الطالب',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B87),
        ),
        fontFamily: 'Arial',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      ('💻', 'الحاسوب'),
      ('🌐', 'الشبكات'),
      ('👨‍💻', 'البرمجة'),
      ('⚡', 'الكهرباء'),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('رفيق الطالب'),
          backgroundColor: const Color(0xFF176B87),
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'مرحباً بك في رفيق الطالب',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('تعلّم، تدرب، وحقق أهدافك الدراسية.'),
            const SizedBox(height: 24),
            const Text(
              'المواد التعليمية',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...subjects.map(
              (subject) => Card(
                child: ListTile(
                  leading: Text(
                    subject.$1,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(subject.$2),
                  subtitle: const Text('دروس وتمارين تعليمية'),
                  trailing: const Icon(Icons.arrow_back_ios_new),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'سيتم تجهيز قسم ${subject.$2} لاحقاً',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('سنضيف المساعد الذكي في مرحلة لاحقة'),
                  ),
                );
              },
              icon: const Icon(Icons.auto_awesome),
              label: const Text('اسأل رفيق الطالب'),
            ),
          ],
        ),
      ),
    );
  }
}
