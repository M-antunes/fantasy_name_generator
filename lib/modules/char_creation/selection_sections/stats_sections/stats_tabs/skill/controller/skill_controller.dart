import '../../../../../../../models/class_models/skill_model.dart';
import '../../../../../../../models/combat_models/base_atribute_model.dart';
import '../../../../../../../models/equip_models/equip_model.dart';
import '../../../../../../../models/equip_models/magic_equip_models/wonderous_items_model.dart';
import '../../../../../../../shared/data/class_data/class_general_info_data/skill_data.dart';
import '../../../../../../../shared/utils/utils.dart';

class SkillController {
  List<SkillModel> calculateClassSkills(String className, int rankLevel,
      AttributeModel charAtrb, int level, EquipModel equip) {
    List<SkillModel> charSkillList = SkillData().skills;
    for (var i in charSkillList) {
      i.finalValue = 0;
      i.atrbValue = 0;
      i.checkPenalty = 0;
      i.pointsAdded = 0;
    }
    List<SkillModel> classSkills = charSkillList
        .where((element) => element.skillOfClasses.contains(className))
        .toList();
    for (var i in classSkills) {
      i.initialClassSkill = true;
    }
    int skillRankPerLevel = rankLevel + charAtrb.intelligence;
    int maxSkills = skillRankPerLevel * level;
    int unUsedRankPoints = 0;
    for (var i = 0; i < maxSkills; i++) {
      var random = generateRandom(classSkills.length);
      classSkills[random].pointsAdded++;
    }
    for (var i = 0; i < classSkills.length; i++) {
      if (classSkills[i].pointsAdded > level) {
        unUsedRankPoints += classSkills[i].pointsAdded - level;
        classSkills[i].pointsAdded = level;
      }
    }

    charSkillList
        .removeWhere((element) => element.skillOfClasses.contains(className));
    if (unUsedRankPoints > 0) {
      List<SkillModel> classSkillMaxed =
          classSkills.where((element) => element.pointsAdded == level).toList();
      List<SkillModel> classSkillPossibility =
          classSkills.where((element) => element.pointsAdded < level).toList();

      for (var j = 0; j < unUsedRankPoints; j++) {
        var random = generateRandom(classSkillPossibility.length);
        classSkillPossibility[random].pointsAdded++;
      }
      classSkills = classSkillMaxed + classSkillPossibility;
    }
    for (var j = 0; j < classSkills.length; j++) {
      classSkills[j].pointsAdded + 3;
    }
    charSkillList.addAll(classSkills);
    charSkillList.sort((a, b) => a.name.compareTo(b.name));

    for (var i in charSkillList) {
      switch (i.attributeUsed) {
        case "strength":
          i.finalValue += i.pointsAdded + charAtrb.strength;
          i.atrbValue = charAtrb.strength;
          break;
        case "dexterity":
          i.finalValue += i.pointsAdded + charAtrb.dexterity;
          i.atrbValue = charAtrb.dexterity;
          break;
        case "intelligence":
          i.finalValue += i.pointsAdded + charAtrb.intelligence;
          i.atrbValue = charAtrb.intelligence;
          break;
        case "wisdom":
          i.finalValue += i.pointsAdded + charAtrb.wisdom;
          i.atrbValue = charAtrb.wisdom;
          break;
        default:
          i.finalValue += i.pointsAdded + charAtrb.charisma;
          i.atrbValue = charAtrb.charisma;
      }
    }
    int penalty = equip.armour != null ? equip.armour!.checkPenalty : 0;
    penalty += equip.shield != null ? equip.shield!.checkPenalty : 0;

    for (var i
        in charSkillList.where((element) => element.hasPenalty == true)) {
      i.checkPenalty = penalty;
      i.finalValue -= penalty;
    }
    for (var i = 0; i < charSkillList.length; i++) {
      if (charSkillList[i].boostedByItems.isNotEmpty) {
        for (var j = 0; j < charSkillList[i].boostedByItems.length; j++) {
          if (equip.wonderousItems!.any((element) =>
              element.name == charSkillList[i].boostedByItems[j].key)) {
            charSkillList[i].boostValue =
                charSkillList[i].boostedByItems[j].value;
            charSkillList[i].finalValue += charSkillList[i].boostValue;
          }
        }
      }
      charSkillList[i] = charSkillList[i].copyWith(skillOfClasses: []);
    }
    return charSkillList;
  }
}
