import 'uobject_interface.dart';

class UObject implements UObjectInterface {
  final Map _properties = {};

  @override
  getProperty(String key) {
    // return _properties.containsKey(key) ? _properties[key] : null;
    return _properties[key];
  }

  @override
  void setProperty(String key, Object newValue) {
    _properties[key] = newValue;
  }
}
