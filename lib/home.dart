import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  const AppHeader(),
                  SizedBox(height: 3.h),
                  const WelcomeSection(),
                  SizedBox(height: 3.h),
                  const QuickActionsGrid(),
                  SizedBox(height: 3.h),
                  const RecentPrescriptionsSection(),
                  SizedBox(height: 3.h),
                  const FamilyAccessSection(),
                  SizedBox(height: 3.h),
                  const StatsSection(),
                  SizedBox(height: 3.h),
                  const UploadButton(),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(),
      );
      },
    );
  }
}


class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 2.w,
              height: 2.w,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              'MediSense',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 1.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.3.h),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'pro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 6.w,
          ),
        ),
      ],
    );
  }
}


class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, Sarah',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          'Manage your medications effortlessly',
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionCard(
            icon: Icons.upload_file_outlined,
            title: 'Upload\nPrescription',
            color: Colors.blue.shade50,
            iconColor: Colors.blue,
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: QuickActionCard(
            icon: Icons.description_outlined,
            title: 'View\nRecords',
            color: Colors.green.shade50,
            iconColor: Colors.green,
          ),
        ),
        SizedBox(width: 3.w),
        Expanded(
          child: QuickActionCard(
            icon: Icons.store_outlined,
            title: 'Order\nMedicine',
            color: Colors.orange.shade50,
            iconColor: Colors.orange,
          ),
        ),
      ],
    );
  }
}

class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final Color iconColor;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 7.w,
            color: iconColor,
          ),
          SizedBox(height: 1.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class RecentPrescriptionsSection extends StatelessWidget {
  const RecentPrescriptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Prescriptions',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'View All',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.blue.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Expanded(
              child: PrescriptionCard(
                doctorName: 'Dr. Smith',
                specialty: 'Neurologist',
                date: 'June 25, 2024',
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: PrescriptionCard(
                doctorName: 'Dr. Smith',
                specialty: 'Neurologist',
                date: 'June 25, 2024',
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            Expanded(
              child: MedicationCard(
                title: 'Listen\nInstructions',
                subtitle: 'All medication online\ninstruction',
                icon: Icons.headset_mic_outlined,
                color: Colors.purple.shade50,
                iconColor: Colors.purple,
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: MedicationCard(
                title: 'Translate\nContent',
                subtitle: 'Multi-language\nsupport',
                icon: Icons.translate_outlined,
                color: Colors.teal.shade50,
                iconColor: Colors.teal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String date;

  const PrescriptionCard({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.description_outlined,
              color: Colors.grey,
              size: 5.w,
            ),
          ),
          const Spacer(),
          Text(
            doctorName,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            specialty,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            date,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const MedicationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 8.w,
            color: iconColor,
          ),
          const Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
              height: 1.2,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey.shade600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyAccessSection extends StatelessWidget {
  const FamilyAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Family Access',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 2.h),
        Row(
          children: [
            _buildAvatar('assets/avatar1.jpg', Colors.blue),
            SizedBox(width: 3.w),
            _buildAvatar('assets/avatar2.jpg', Colors.green),
            SizedBox(width: 3.w),
            _buildAvatar('assets/avatar3.jpg', Colors.orange),
            SizedBox(width: 3.w),
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Colors.grey.shade600,
                size: 6.w,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.5.h),
        Text(
          'Manage your family members. Get notifications and share prescriptions',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String imagePath, Color color) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 7.w,
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStat('12', 'Total\nPrescriptions'),
        _buildStat('5', 'Active\nMedications'),
        _buildStat('8', 'Completed\nTreatments'),
      ],
    );
  }

  Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 2.2.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          'Upload New Prescription',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_filled, true),
          _buildNavItem(Icons.calendar_today_outlined, false),
          _buildNavItem(Icons.chat_bubble_outline, false),
          _buildNavItem(Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: EdgeInsets.all(3.w),
      child: Icon(
        icon,
        size: 7.w,
        color: isSelected ? Colors.blue.shade600 : Colors.grey.shade400,
      ),
    );
  }
}
