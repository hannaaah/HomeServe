import '../model/usermodel.dart';
import '../services/auth.dart';
import '../services/firestore.dart';

Auth auth = Auth();

register(String password, String confirmpwd, String type) async {
  if (password == confirmpwd) {
    dynamic result = await auth.register(User.email, password);
    if (result != null) {
      Database.addData(type);
      return true;
    }
  }
  return false;
}

login(String email, String password) async {
  dynamic result = await auth.signIn(email, password);
  if (result != null) {
    await Database.getUser(email);
    return true;
  }
  return false;
}
