import 'package:flutter/material.dart'; // Import ไลบรารี Material ของ Flutter
import 'package:google_fonts/google_fonts.dart';

void main() {
  // จุดเริ่มต้นของแอป Flutter
  runApp(const MyApp()); // บอก Flutter ว่าวิดเจ็ตใดคือรากฐานของแอป
}

// MyApp โดยทั่วไปคือวิดเจ็ตรากฐานของแอปพลิเคชันของคุณ
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // เมธอด build() ส่งคืนโครงสร้างต้นไม้วิดเจ็ตสำหรับวิดเจ็ตนี้
    return MaterialApp(
      title: 'My Awesome App',
      debugShowCheckedModeBanner: false, // ซ่อนแบนเนอร์ debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // ใช้ Material Design เวอร์ชันล่าสุด
      ),
      home: const MyHomePage(), // วิดเจ็ตหน้าจอหลักของคุณ
    );
  }
}

// ตัวอย่างวิดเจ็ตที่ส่งคืนโดย property 'home' ของ MaterialApp
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // ภายในเมธอด build ของ MyHomePage
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ), // ปรับแต่งสี AppBar
      body: Padding(
        // เพิ่ม Padding รอบ Column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.network('https://picsum.photos/seed/flutter/400/200'),
              const SizedBox(height: 10.0),
            //Image.asset(
            //  'assets/image/view.jpg',),
            //  const SizedBox(height: 10.0),
            Image.asset(
              'D:/66314477/flutter_windows_3.32.7-stable/flutter/flutter_application_1/assets/image/view.jpg',
              errorBuilder: (context, error, stackTrace) {
                return const Text(
                  'เกิดข้อผิดพลาดในการโหลด asset',
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            const SizedBox(height: 10.0), // เพิ่มช่องว่างใต้ asset image
            // ภายในลิสต์ children ของ Column, หลัง SizedBox ตัวที่สอง
            Container(
              // กล่องสีอำพันจากแล็บ บทที่ 3
              width: 200.0, // หรือปรับตามต้องการ
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Colors.amber.shade100, // สีอำพันอ่อนลงเล็กน้อย
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                // คงข้อความไว้ก่อน
                'สวัสดี วิดเจ็ต Flutter!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lacquer(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 9.0), // เว้นวรรคมากขึ้นก่อนปุ่ม
            // ... ปุ่มจะตามมา ...
            // ภายในลิสต์ children ของ Column, หลัง SizedBox สุดท้าย
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // จัดกึ่งกลางปุ่มแนวนอน
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    print('กดปุ่ม Elevated');
                  },
                  child: const Text('Elevated'),
                ),
                const SizedBox(width: 9.0), // เว้นวรรคระหว่างปุ่ม
                OutlinedButton(
                  onPressed: () {
                    print('กดปุ่ม Outlined');
                  },
                  child: const Text('Outlined'),
                ),
                const SizedBox(width: 9.0), // เว้นวรรคระหว่างปุ่ม
                TextButton(
                  onPressed: () {
                    print('กดปุ่ม Text');
                  },
                  child: const Text('Text'),
                ),
              ],
            ),
            const SizedBox(height: 9.0), // เว้นวรรคใต้ปุ่ม
            // ภายในลิสต์ children ของ Column, หลัง Row และ SizedBox
            IconButton(
              onPressed: () {
                print('กดไอคอน Info');
              },
              icon: const Icon(Icons.info_outline),
              iconSize: 15.0,
              tooltip: 'ข้อมูล', // ข้อความช่วยเหลือ
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
