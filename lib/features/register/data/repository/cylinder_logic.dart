import 'package:amaga/models/cylinder.dart';
import 'package:amaga/shared/mockdata/cylinder_data.dart';

class CylinderLogic {
  String? validateInputs(
      String serialId, String volumeText, String color, String type) {
    if (serialId.isEmpty) {
      return 'Serial ID cannot be empty';
    } else if (volumeText.isEmpty) {
      return 'Volume cannot be empty';
    } else if (int.tryParse(volumeText) == null) {
      return 'Volume must be a valid integer';
    } else if (color.isEmpty) {
      return 'Color cannot be empty';
    } else if (type.isEmpty) {
      return 'Gas type cannot be empty';
    }
    return null;
  }

  bool addCylinder(Cylinder cylinder) {
    try {
      cylinder_data.add(
        Cylinder(
          serialId: cylinder.serialId,
          volume: cylinder.volume,
          color: cylinder.color,
          type: cylinder.type,
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
