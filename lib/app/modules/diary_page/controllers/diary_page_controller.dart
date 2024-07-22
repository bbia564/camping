import 'package:camping_ground/app/tools/dc_database.dart';
import 'package:camping_ground/app/tools/models.dart';
import 'package:get/get.dart';

class DiaryPageController extends GetxController {
  final selectedIndex = 0.obs;

  final allDiary = <CGDiaryModel>[].obs;
  final allMeModel = <CGMaterialsModel>[].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllDatas();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllDatas() async {
    allDiary.value = await CGDatabaseTool().getAllDiary();
    allMeModel.value = await CGDatabaseTool().getAllMaterialsModel();

  }
}
