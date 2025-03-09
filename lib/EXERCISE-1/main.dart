abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}

class RidePreference {
  final String message;

  RidePreference(this.message);
}

class RidePreferencesService {
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void notifyListeners(RidePreference selectedPreference) {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(selectedPreference);
    }
  }

  void selectPreference(RidePreference preference) {
    notifyListeners(preference);
  }
}

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print('Preference selected: ${selectedPreference.message}');
  }
}

void main() {
  var service = RidePreferencesService();
  var logger = ConsoleLogger();

  service.addListener(logger);
  var preference = RidePreference('Fastest Route');
  service.selectPreference(preference);

  var anotherPreference = RidePreference('Luxury Car');
  service.selectPreference(anotherPreference);
}
