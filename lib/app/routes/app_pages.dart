import 'package:get/get.dart';

import '../modules/AddKereta/bindings/add_kereta_binding.dart';
import '../modules/AddKereta/views/add_kereta_view.dart';
import '../modules/DetailBooking/bindings/detail_booking_binding.dart';
import '../modules/DetailBooking/views/detail_booking_view.dart';
import '../modules/EditKereta/bindings/edit_kereta_binding.dart';
import '../modules/EditKereta/views/edit_kereta_view.dart';
import '../modules/LupaPassword/bindings/lupa_password_binding.dart';
import '../modules/LupaPassword/views/lupa_password_view.dart';
import '../modules/addDiskon/bindings/add_diskon_binding.dart';
import '../modules/addDiskon/views/add_diskon_view.dart';
import '../modules/addJadwal/bindings/add_jadwal_binding.dart';
import '../modules/addJadwal/views/add_jadwal_view.dart';
import '../modules/add_payment/bindings/add_payment_binding.dart';
import '../modules/add_payment/views/add_payment_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/diskon/bindings/diskon_binding.dart';
import '../modules/diskon/views/diskon_view.dart';
import '../modules/editDiskon/bindings/edit_diskon_binding.dart';
import '../modules/editDiskon/views/edit_diskon_view.dart';
import '../modules/editJadwal/bindings/edit_jadwal_binding.dart';
import '../modules/editJadwal/views/edit_jadwal_view.dart';
import '../modules/edit_payment/bindings/edit_payment_binding.dart';
import '../modules/edit_payment/views/edit_payment_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/kereta/bindings/kereta_binding.dart';
import '../modules/kereta/views/kereta_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/myticket/bindings/myticket_binding.dart';
import '../modules/myticket/views/myticket_view.dart';
import '../modules/payment_method/bindings/payment_method_binding.dart';
import '../modules/payment_method/views/payment_method_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/scanqr/bindings/scanqr_binding.dart';
import '../modules/scanqr/views/scanqr_view.dart';

// ignore_for_file: constant_identifier_names

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
    GetPage(
      name: _Paths.ADD_JADWAL,
      page: () => const AddJadwalView(),
      binding: AddJadwalBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_JADWAL,
      page: () => const EditJadwalView(),
      binding: EditJadwalBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_METHOD,
      page: () => const PaymentMethodView(),
      binding: PaymentMethodBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PAYMENT,
      page: () => const AddPaymentView(),
      binding: AddPaymentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PAYMENT,
      page: () => const EditPaymentView(),
      binding: EditPaymentBinding(),
    ),
    GetPage(
      name: _Paths.DISKON,
      page: () => const DiskonView(),
      binding: DiskonBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DISKON,
      page: () => const AddDiskonView(),
      binding: AddDiskonBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DISKON,
      page: () => const EditDiskonView(),
      binding: EditDiskonBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BOOKING,
      page: () => const DetailBookingView(),
      binding: DetailBookingBinding(),
    ),
    GetPage(
      name: _Paths.MYTICKET,
      page: () => const MyticketView(),
      binding: MyticketBinding(),
    ),
    GetPage(
      name: _Paths.SCANQR,
      page: () => const ScanqrView(),
      binding: ScanqrBinding(),
    ),
  ];
}
