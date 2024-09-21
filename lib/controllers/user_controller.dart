import 'package:myflutterapp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var users = <UserModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      isLoading.value = true; // Set loading state to true
      print("Fetching users...");

      var snapshot = await _firestore.collection('users').get();
      print("Snapshot data: ${snapshot.docs.length} documents found.");

      users.value = snapshot.docs.map((doc) {
        print("Document data: ${doc.data()}"); // Log document data
        return UserModel(
          uid: doc.data().containsKey('uid')
              ? doc['uid']
              : '', // Check for 'uid'
          firstName:
              doc.data().containsKey('firstName') ? doc['firstName'] : '',
          lastName: doc.data().containsKey('lastName') ? doc['lastName'] : '',
          email: doc.data().containsKey('email') ? doc['email'] : '',
        );
      }).toList();

      print("Fetched users: $users");
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false; // Set loading state to false
    }
  }
}
