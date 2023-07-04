import 'package:split/apis/_base/dio_api_manager.dart';
import 'package:split/apis/api_keys.dart';
import 'package:split/preferences/preferences_manager.dart';
import 'package:split/utils/locale/locale_cubit.dart';

class LocaleRepository {
  final DioApiManager dioApiManager;
  final PreferencesManager preferenceManager;

  LocaleRepository(this.dioApiManager, this.preferenceManager);

  Future<void> changeLanguageLocal(LocaleApp localeApp) async {
    await preferenceManager.setLocale(localeApp.mapToPreferenceKey());
  }

  Future<String?> getLanguageLocal() async {
    return await preferenceManager.getLocale();
  }

  Future<void> changeLanguageApi(LocaleApp localeApp) async {
    await dioApiManager.dio
        .post(ApiKeys.updateLanguageUrl(localeApp.mapToApiKey()));
  }

  Future<void> updateLanguageInfo(LocaleApp localeApp) async {
    await changeLanguageLocal(localeApp);
    if (await preferenceManager.isLoggedIn()) {
      changeLanguageApi(localeApp);
    }
  }
}
