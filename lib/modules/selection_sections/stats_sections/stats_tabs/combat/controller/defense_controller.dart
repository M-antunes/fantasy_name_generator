import '../../../../../../models/equip_models/armor_model.dart';
import '../../../../../../models/equip_models/enchant_model.dart';
import '../../../../../../shared/utils/utils.dart';

class DefenseController {
  ArmorModel? generateShield(
      String physicalChar, String className, List<ArmorModel> shieldList) {
    if (physicalChar != "Soldier") {
      return null;
    } else {
      ArmorModel shield;
      List<ArmorModel> shields;
      if (className == "Druid") {
        shields =
            shieldList.where((element) => element.fitForDruid == true).toList();
      } else {
        shields = shieldList;
      }
      var random = generateRandom(shields.length);
      shield = shields[random];
      return shield;
    }
  }

  ArmorModel generateArmor(List<String> fobiddenTypes, String mainAtrb,
      String className, List<ArmorModel> shieldList) {
    ArmorModel armor;
    List<ArmorModel> armors;
    if (className == "Druid") {
      armors =
          shieldList.where((element) => element.fitForDruid == true).toList();
    } else if (mainAtrb == "dexterity") {
      armors =
          shieldList.where((element) => element.type!.name == "Light").toList();
    } else {
      armors = shieldList
          .where((element) => !fobiddenTypes.contains(element.type!.name))
          .toList();
    }
    armors.sort(((a, b) => a.defenseBonus.compareTo(b.defenseBonus)));
    var random = generateRandom(armors.length);
    random > (armors.length / 3).floor()
        ? armor = ArmorModel(
            name: armors[random].name,
            defenseBonus: armors[random].defenseBonus,
            checkPenalty: armors[random].checkPenalty,
            maxDexAllowed: armors[random].maxDexAllowed,
            speedPenalty: armors[random].speedPenalty,
            price: armors[random].price,
            type: armors[random].type,
          )
        : armor = ArmorModel(
            name: armors.last.name,
            defenseBonus: armors.last.defenseBonus,
            checkPenalty: armors.last.checkPenalty,
            maxDexAllowed: armors.last.maxDexAllowed,
            speedPenalty: armors.last.speedPenalty,
            price: armors.last.price,
            type: armors.last.type,
          );
    return armor;
  }

  ArmorModel applyMagicToArmorAndShield(
      int level, List<EnchantModel> list, ArmorModel equip) {
    var minAvail = discoverMinAvailability(level);
    var enchantPowerLvs = list
        .where((element) =>
            element.availability <= level && element.availability >= minAvail)
        .toList();
    equip = changeDefenseEquipToMagic(equip, enchantPowerLvs);
    return equip;
  }

  ArmorModel changeDefenseEquipToMagic(
      ArmorModel equip, List<EnchantModel> list) {
    equip.enchantment = [list.last];
    equip.defenseBonus = equip.defenseBonus + equip.enchantment![0].power;
    equip.maxDexAllowed = equip.maxDexAllowed + equip.enchantment![0].power;
    equip.checkPenalty = equip.checkPenalty > equip.enchantment![0].power
        ? equip.checkPenalty - equip.enchantment![0].power
        : 0;
    return equip;
  }
}
