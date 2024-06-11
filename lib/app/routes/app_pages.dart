import 'package:get/get.dart';

import '../modules/AddKereta/bindings/add_kereta_binding.dart';
import '../modules/AddKereta/views/add_kereta_view.dart';
import '../modules/EditKereta/bindings/edit_kereta_binding.dart';
import '../modules/EditKereta/views/edit_kereta_view.dart';
import '../modules/LupaPassword/bindings/lupa_password_binding.dart';
import '../modules/LupaPassword/views/lupa_password_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/kereta/bindings/kereta_binding.dart';
import '../modules/kereta/views/kereta_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.KERETA,
      page: () => KeretaView(),
      binding: KeretaBinding(),
    ),
    GetPage(
      name: _Paths.ADD_KERETA,
      page: () => const AddKeretaView(),
      binding: AddKeretaBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_KERETA,
      page: () => const EditKeretaView(),
      binding: EditKeretaBinding(),
    ),
    GetPage(
      name: _Paths.LUPA_PASSWORD,
      page: () => const LupaPasswordView(),
      binding: LupaPasswordBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
    ),
  ];
}
