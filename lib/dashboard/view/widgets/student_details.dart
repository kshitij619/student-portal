import 'package:flutter/material.dart';
import 'package:mini_project_sem_6/student_provider.dart';
import 'package:provider/provider.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (provider.error != null) {
      return Center(child: Text('Error: ${provider.error}'));
    }
    final profile = provider.student;
    if (profile == null) {
      return const Center(child: Text('No student data'));
    }

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
                radius: 150, backgroundImage: AssetImage(profile.image)),
            const SizedBox(height: 8),
            Text(profile.name,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 12),
            Text('Email: ${profile.email}'),
            Text('Id: ${profile.rollNumber}'),
            Text('Phone: ${profile.phone}'),
            Text('Address: ${profile.address}'),
            Text('Gender: ${profile.gender.name}'),
            Text('Department: ${profile.department}'),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:mini_project_sem_6/dashboard/model/student_details_model.dart';
// import 'package:mini_project_sem_6/dashboard/view-model/dashboard_view_model.dart';
// import 'package:provider/provider.dart';

// class StudentDetails extends StatelessWidget {
//   final String email;

//   const StudentDetails({
//     super.key,
//     required this.email,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dashboardViewModel = Provider.of<DashboardViewModel>(context);
//     return FutureBuilder<StudentDetailsModel?>(
//       future: dashboardViewModel.fetchUserByEmail(email),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//         final profile = snapshot.data;
//         if (profile == null) {
//           return const Center(child: Text('No student found'));
//         }

//         return Padding(
//           padding: const EdgeInsets.all(32.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: CircleAvatar(
//                     radius: 150,
//                     backgroundImage: NetworkImage(profile.image),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Center(
//                   child: Text(
//                     profile.name,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineMedium
//                         ?.copyWith(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Text('Email: ${profile.email}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 Text('Id: ${profile.rollNumber}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 Text('Phone: ${profile.phone}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 Text('Address: ${profile.address}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 Text('Gender: ${profile.gender.name}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//                 Text('Department: ${profile.department}',
//                     style: Theme.of(context).textTheme.bodyLarge),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
