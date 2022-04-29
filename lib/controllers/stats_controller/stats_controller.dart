import 'package:fantasy_name_generator/modules/char_creation/selection_sections/stats_sections/stats_tabs/features/controllers/feature_controller.dart';
import 'package:fantasy_name_generator/shared/data/spell_data/spell_data.dart';

import '../../models/spell_models/spell_model.dart';
import '../stage_controller/imports.dart';

class StatsController with ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  var listOfWonderousItems = WonderousItemsData();
  var listOfEnchants = EnchantData();
  final _equip = EquipData();
  var listOfClasses = ClassData();
  var listOfRaces = RaceData();
  var skillData = SkillData();
  var languages = LanguageData();

  var appearanceCtrl = AppearanceController();
  var abilityCtrl = AttributeController();
  var magicGearCtrl = MagicGearController();
  var lootCtrl = LootController();
  var offenseCtrl = OffenseController();
  var defenseCtrl = DefenseController();
  var skillCtrl = SkillController();
  var featCtrl = FeatsController();
  List<WonderousItemsModel> tomesAndManuals = [];
  List<SkillModel> charSkills = [];
  List<LanguageModel> charLanguages = [];
  List<TraitModel> charFeats = [];
  List<SpellModel> charPotions = [];

  int armorPrice = 0;
  int shieldPrice = 0;
  int meleePrice = 0;
  int rangePrice = 0;
  int repeatedPotion = 0;
  String meleeName = '';
  String rangeName = '';
  String armorName = '';
  String shieldName = '';

  bool statsGenerated = false;

  showDescriptions(int index, dynamic list) {
    if (list[index].isSelected == true) {
      list[index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    notifyListeners();
  }

  resetEquipAndStats() {
    char.charEquip.armour = ArmorModel();
    char.charEquip.shield = char.charEquip.shield == null ? null : ArmorModel();
    char.charEquip.meleeWeapon = null;
    char.charEquip.rangeWeapon = null;
    char.charEquip.wonderousItems = null;
    char.baseAttributes = AttributeModel();
    char.modAttributes = AttributeModel();
    char.combatStats = CombatModel();
    char.resistances = ResistanceModel();
    char.charRace.speed = 0;
    char.charRace.age = 0;
    char.charRace.size = "-";
    char.charRace.senses = "-";
    char.charRace.height!.value = 0;
    char.charRace.height!.key = 0;
    char.charRace.weight = 0;
    char.hitPoints = 0;
    armorPrice = 0;
    shieldPrice = 0;
    meleePrice = 0;
    rangePrice = 0;
    traits = [];
    specials = [];
    charFeats = [];
    charPotions = [];
    charLoot = LootModel();
    tomesAndManuals = [];
    charSkills = [];
    statsGenerated = false;
    charLanguages = [];
    notifyListeners();
  }

  generateAll() {
    generateMagicItems();
    if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      char.charEquip.meleeWeapon = offenseCtrl
          .generateGearForNonPhysicalStyleChars(_equip.allWeapons, true);
      char.charEquip.rangeWeapon = offenseCtrl
          .generateGearForNonPhysicalStyleChars(_equip.allWeapons, false);
    } else {
      if (char.physicalStyle.name == "Bowman" ||
          char.physicalStyle.name == "Marksman" ||
          char.physicalStyle.name == "Thrower") {
        char.charEquip.rangeWeapon = offenseCtrl.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.meleeWeapon = offenseCtrl.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      } else {
        char.charEquip.meleeWeapon = offenseCtrl.gettingMainWeapon(
            listOfClasses.physicalStyles,
            char.physicalStyle.name,
            _equip.allWeapons,
            char.charClass.name);
        char.charEquip.rangeWeapon = offenseCtrl.generatingAlternativeWeapon(
            char.physicalStyle.name, _equip.allWeapons, char.charClass.name);
      }
      char.charEquip.shield = defenseCtrl.generateShield(
          char.physicalStyle.name, char.charClass.name, _equip.allShields);
      char.charEquip.armour = defenseCtrl.generateArmor(
          char.charClass.forbidenArmorType,
          char.charClass.mainAtrb,
          char.charClass.name,
          _equip.allArmors);
    }
    getCharPersonalAppearance();
    calculateBaseAttackBonus();
    makeWeaponMagic();
    makeArmorOrShieldMagic();
    getCombatEquipPrices();
    getEquipFullNames();
    gettingClassTraits();
    gettingClassSpecials();
    getFeats();
    getPotions();
    generateLoot();
    calculateSpeed();
    generateAllAttributes();
    getAtrbBoostFromWonderousItem();
    getTomesAndAMnuals();
    boostWithTomeOrManual();
    calculateAllModifiers();
    claculatingHitDefense();
    calculateResistances();
    generateHitPoints();
    gettingInitiative();
    calculateCombatManeuvers();
    calculatingPhysicalAttackAndDamage();
    calculateClassSkills();
    calculatingLanguages();
    statsGenerated = true;
    notifyListeners();
  }

  getCharPersonalAppearance() {
    char.charRace = appearanceCtrl.applyHeightAndWeight(
        listOfRaces.races,
        listOfClasses.allClasses,
        char.charRace.name,
        char.charClass.name,
        char.charLevel,
        char.charRace,
        char.charClass.mainAtrb);
    notifyListeners();
  }

  generateMagicItems() {
    char.charEquip.wonderousItems = [];
    if (char.charLevel < 5 && char.charLevel > 1) {
      var random = generateRandom(11);
      random < 5
          ? char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.protRings, char.charLevel))
          : char.charEquip.wonderousItems!.addAll(
              magicGearCtrl.addIndispensableItem(
                  listOfWonderousItems.resistCloaks, char.charLevel));
      return;
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.getWonderousItems(
        char.charLevel,
        char.charClass.combatStyle,
        char.charClass.mainAtrb,
        listOfWonderousItems.allItems,
        char.charClass.name,
        char.physicalStyle.name));

    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.protRings, char.charLevel));
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
        listOfWonderousItems.resistCloaks, char.charLevel));
    if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name == "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletMightyFists, char.charLevel));
    } else if (char.battleStyle.name == "Physical" &&
        char.physicalStyle.name != "Martial") {
      char.charEquip.wonderousItems!.addAll(magicGearCtrl.addIndispensableItem(
          listOfWonderousItems.amuletOfArmor, char.charLevel));
    } else if (char.battleStyle.name == "Spellcaster" ||
        char.battleStyle.name == "Diplomat") {
      List<WonderousItemsModel> posibleAmulets = listOfWonderousItems.allItems
          .where((element) => element.availability < char.charLevel)
          .toList();
      char.charEquip.wonderousItems!.addAll(
          magicGearCtrl.addIndispensableItem(posibleAmulets, char.charLevel));
    }
    char.charEquip.wonderousItems!.addAll(magicGearCtrl.addExtraIounStones(
        char.charLevel,
        listOfWonderousItems.basicIounStones,
        char.charClass.mainAtrb));
    char.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }
  // ===================================================================================
  // get Potions

  getPotions() {
    charPotions =
        magicGearCtrl.generatePotions(char.charLevel, char.physicalStyle.name);
    notifyListeners();
  }
  // ===================================================================================
  //Apply magic to weapon

  makeWeaponMagic() {
    if (char.charLevel < 5) {
      return;
    } else {
      char.charEquip.meleeWeapon = offenseCtrl.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          true);
      char.charEquip.rangeWeapon = offenseCtrl.applyMagicToWeapon(
          char.charLevel,
          listOfEnchants.magicEnchants,
          listOfEnchants.allWeaponEnchants,
          char.physicalStyle.name,
          char.charEquip.rangeWeapon!,
          char.charEquip.meleeWeapon!,
          false);
    }
  }

  getCombatEquipPrices() {
    meleePrice = offenseCtrl.claculateWeaponPrice(
        char.charEquip.meleeWeapon!, char.charLevel);
    rangePrice = offenseCtrl.claculateWeaponPrice(
        char.charEquip.rangeWeapon!, char.charLevel);
    armorPrice = char.charEquip.armour != null
        ? defenseCtrl.claculateMagicEquipPrice(
            char.charEquip.armour!, char.charLevel)
        : 0;
    shieldPrice = char.charEquip.shield != null
        ? defenseCtrl.claculateMagicEquipPrice(
            char.charEquip.shield!, char.charLevel)
        : 0;
    notifyListeners();
  }

  getEquipFullNames() {
    meleeName = getEquipFullName(char.charEquip.meleeWeapon, char.charLevel);
    rangeName = getEquipFullName(char.charEquip.rangeWeapon, char.charLevel);
    armorName = char.charEquip.armour != null
        ? getEquipFullName(char.charEquip.armour, char.charLevel)
        : "No armor";
    shieldName = char.charEquip.shield != null
        ? getEquipFullName(char.charEquip.shield, char.charLevel)
        : "No Shield";
    notifyListeners();
  }

  // ===================================================================================
  //Apply magic to Armor and shield

  makeArmorOrShieldMagic() {
    char.charEquip.armour = defenseCtrl.applyMagicToArmorAndShield(
        char.charLevel, listOfEnchants.magicEnchants, char.charEquip.armour!);
    char.charEquip.shield = char.charEquip.shield != null
        ? defenseCtrl.applyMagicToArmorAndShield(char.charLevel,
            listOfEnchants.magicEnchants, char.charEquip.shield!)
        : null;
    notifyListeners();
  }

  //====================================================================================
  //Base Attack Bonus

  calculateBaseAttackBonus() {
    char.combatStats.baseAttackBonus = offenseCtrl.calculateBaseAttackBonus(
        listOfClasses.allClasses, char.charClass.name, char.charLevel);
    notifyListeners();
  }

// ======================================================================================
  ///calculate characters speed
  calculateSpeed() {
    char.charRace.speed = offenseCtrl.calculateSpeed(
        listOfRaces.races,
        char.charLevel,
        char.charRace.name,
        char.charClass.name,
        char.charRace.speed,
        char.charEquip.armour!);
    notifyListeners();
  }

  // ===================================================================================
  //Traits part
  List<TraitModel> traits = [];
  FeaturesController featuresCtrl = FeaturesController();

  gettingClassTraits() {
    traits = featuresCtrl.gettingClassTraits(
        char.charClass.name, char.charLevel, char.charEquip);
    notifyListeners();
  }

  //   List<TraitModel> newList = [];
  //   var valueList = [];
  //   List<TraitModel> replacementList = [];
  //   List<TraitModel> list = barbarian.barbarianTraits
  //       .where((element) => element.levelAcquired <= char.charLevel)
  //       .toList();
  //   var onlyVariableTraits =
  //       list.where((element) => element.multiplier != null).toList();
  //   list.removeWhere((element) => element.multiplier != null);
  //   for (var i in onlyVariableTraits) {
  //     var changableValue = char.charLevel - i.levelAcquired;
  //     if (i.levelAcquired == char.charLevel) {
  //       changableValue++;
  //     }
  //     changableValue = (changableValue / i.multiplier!).floor();
  //     valueList.add(changableValue);
  //   }
  //   var index = 1;
  //   for (var i in onlyVariableTraits) {
  //     var newString = "${i.traiName} ${valueList[index]}";
  //     var newTrait = TraitModel(
  //         traiName: newString,
  //         levelAcquired: i.levelAcquired,
  //         traiDescription: i.traiDescription,
  //         isSelected: i.isSelected);
  //     newList.add(newTrait);
  //     index++;
  //   }
  //   replacementList.addAll(list);
  //   replacementList.addAll(newList);
  //   replacementList.sort((a, b) => a.levelAcquired.compareTo(b.levelAcquired));
  //   traits = replacementList;
  //   notifyListeners();
  // }
  List<SpecialsModel> specials = [];

  gettingClassSpecials() {
    specials = featuresCtrl.gettingClassSpecials(
        char.charClass.name, char.charLevel, char.charRace.name);
    notifyListeners();
  }
  //   var numberOfSpecial = (char.charLevel / 2).floor();
  //   List<SpecialsModel> cloneList = barbarian.ragePowers
  //       .where((element) => element.levelAcquired <= char.charLevel)
  //       .toList();
  //   if (char.charRace.name == "Human" || char.charRace.name == "Hafling") {
  //     cloneList.removeWhere((element) =>
  //         element.name == "Night Vision" && element.name == "Low-light Vision");
  //   }
  //   if (char.charRace.name == "Orc" ||
  //       char.charRace.name != "Dwarf" ||
  //       char.charRace.name != "Half-orc") {
  //     cloneList.removeWhere((element) => element.name == "Night Vision");
  //   }
  //   List<SpecialsModel> specialList = [];
  //   for (var i = 0; i < numberOfSpecial; i++) {
  //     var random = generateRandom(cloneList.length);

  //     specialList.add(cloneList[random]);
  //     cloneList.remove(cloneList[random]);
  //   }
  //   specials = specialList;
  //   notifyListeners();
  // }

  // ====================================================================================
  // Feat part

  getFeats() {
    charFeats = featCtrl.getFeats(
        char.physicalStyle.name,
        char.charLevel,
        char.charClass.name,
        char.charRace.name,
        char.charEquip,
        char.physicalStyle.name);
    notifyListeners();
  }

  // ====================================================================================
  // Loot part
  LootModel charLoot = LootModel(items: [], jwels: [], potions: []);
  var listOfGems = JwelsData();

  generateLoot() {
    charLoot = lootCtrl.calculateLoot(
        char.charEquip.wonderousItems!,
        char.charLevel,
        meleePrice,
        rangePrice,
        armorPrice,
        shieldPrice,
        char.charEquip,
        char.physicalStyle.name,
        char.battleStyle.name,
        listOfGems.gems,
        charPotions,
        repeatedPotion);
    notifyListeners();
  }

//=======================================================================================
// Section for generation of basic attributes

  generateAllAttributes() {
    char.baseAttributes = abilityCtrl.addUpAttributeValues(
        char.charLevel,
        char.charClass.name,
        char.charRace.name,
        char.charClass.mainAtrb,
        char.charClass.combatStyle);
    notifyListeners();
  }

  //====================================================================================
  // Calculate boost to attributes by magic items

  getAtrbBoostFromWonderousItem() {
    char.baseAttributes = magicGearCtrl.getAtrbBoostFromWonderousItem(
        char.charEquip.wonderousItems!,
        char.charLevel,
        char.charClass.mainAtrb,
        char.baseAttributes,
        char.physicalStyle.name);
    notifyListeners();
  }

  getTomesAndAMnuals() {
    tomesAndManuals = magicGearCtrl.getTomesOrManuals(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        char.battleStyle.name);
    notifyListeners();
  }

  boostWithTomeOrManual() {
    char.baseAttributes = magicGearCtrl.boostWithTomeOrManual(
        char.charLevel,
        char.charClass.mainAtrb,
        listOfWonderousItems.manualsAndTomes,
        tomesAndManuals,
        char.battleStyle.name,
        char.baseAttributes);
    notifyListeners();
  }

  //=====================================================================================
  // Modifier part
  calculateAllModifiers() {
    char.modAttributes = abilityCtrl.calculateAllModifiers(char.baseAttributes);
    notifyListeners();
  }

  //=====================================================================================
  // section for hit points generation

  generateHitPoints() {
    char.hitPoints = defenseCtrl.generateHitPoints(char.charLevel,
        char.modAttributes.constitution, charFeats, char.charClass.hitDice!);
    notifyListeners();
  }

//======================================================================================
// section to generate Ac defense

  claculatingHitDefense() {
    var defenses = defenseCtrl.claculatingHitDefense(
      char.charEquip,
      char.charLevel,
      char.modAttributes.dexterity,
      char.charRace,
      char.charClass.name,
      char.modAttributes.wisdom,
      char.charEquip.wonderousItems!,
      charFeats,
    );
    char.combatStats.armourClass = defenses[0];
    char.combatStats.armourSurprise = defenses[1];
    char.combatStats.armourTouch = defenses[2];
    notifyListeners();
  }

//======================================================================================
// section to generate resistances

  calculateResistances() {
    ResistanceModel resists = defenseCtrl.calculateResistances(
        listOfClasses.goodOrBad,
        char.charLevel,
        char.charClass.resistUpgrade!,
        char.charRace.name,
        char.charClass.name,
        charFeats,
        char.modAttributes,
        char.charEquip.wonderousItems!);
    char.resistances = resists;
    notifyListeners();
  }

// ====================================================================================

// section to generate combat manouver modifiers

  calculateCombatManeuvers() {
    char.combatStats.combatManeuverBonus = offenseCtrl.calculateCombatManeuvers(
        char.combatStats.baseAttackBonus!,
        char.modAttributes,
        char.charRace.name,
        charFeats,
        char.charLevel,
        true);
    char.combatStats.combatManeuverDefense =
        offenseCtrl.calculateCombatManeuvers(
            char.combatStats.baseAttackBonus!,
            char.modAttributes,
            char.charRace.name,
            charFeats,
            char.charLevel,
            false);
    notifyListeners();
  }

// ====================================================================================

// section to generate Initiative

  gettingInitiative() {
    char.combatStats.initiative =
        offenseCtrl.gettingInitiative(charFeats, char.modAttributes.dexterity);
    notifyListeners();
  }

  //=====================================================================================
  // Section for calculating Attack and Damage

  calculatingPhysicalAttackAndDamage() {
    int meleeEnchant = char.charEquip.meleeWeapon!.enchantment == null
        ? 0
        : char.charEquip.meleeWeapon!.enchantment!.isNotEmpty
            ? char.charEquip.meleeWeapon!.enchantment![0].power
            : 0;
    int rangeEnchant = char.charEquip.rangeWeapon!.enchantment == null
        ? 0
        : char.charEquip.rangeWeapon!.enchantment!.isNotEmpty
            ? char.charEquip.rangeWeapon!.enchantment![0].power
            : 0;
    List<String> attackValues = offenseCtrl.calculatingPhysicalAttack(
      char.charClass.mainAtrb,
      char.modAttributes,
      char.combatStats.baseAttackBonus!,
      charFeats,
      char.charClass.name,
      char.physicalStyle.name,
      char.charLevel,
      meleeEnchant,
      rangeEnchant,
    );
    char.combatStats.meleeAttack = attackValues[0];
    char.combatStats.rangeAttack = attackValues[1];
    char.combatStats.dualWieldAttack = attackValues[2];

    String? meleeExtraDamage = char.charEquip.meleeWeapon!.enchantment == null
        ? ""
        : char.charEquip.meleeWeapon!.enchantment!.length > 1
            ? char.charEquip.meleeWeapon!.enchantment![1].additionalDiceDamage
            : "";
    String? rangeExtraDamage = char.charEquip.rangeWeapon!.enchantment == null
        ? ""
        : char.charEquip.rangeWeapon!.enchantment!.length > 1
            ? char.charEquip.rangeWeapon!.enchantment![1].additionalDiceDamage
            : "";
    List<int> damages = offenseCtrl.calculatingPhysicalDamage(
      char.charClass.name,
      char.charClass.mainAtrb,
      char.modAttributes,
      charFeats,
      char.physicalStyle.name,
      char.charLevel,
      meleeEnchant,
      rangeEnchant,
    );
    char.combatStats.meleeDamage =
        "${char.charEquip.meleeWeapon!.damage!} +${damages[0].toString()} $meleeExtraDamage";
    char.combatStats.rangeDamage =
        "${char.charEquip.rangeWeapon!.damage!} +${damages[1].toString()} $rangeExtraDamage";
    char.combatStats.dualWieldDamage =
        "${char.charEquip.meleeWeapon!.damage!} +${damages[2].toString()} $meleeExtraDamage";
    notifyListeners();
  }

  // =========================================================================================
  // Calculate Skilss

  calculateClassSkills() {
    charSkills = skillCtrl.calculateClassSkills(
        char.charClass.name,
        char.charClass.skillRankPerLevel,
        char.modAttributes,
        char.charLevel,
        char.charEquip);
    notifyListeners();
  }

  //======================================================================================
  // Langugages

  calculatingLanguages() {
    charLanguages = abilityCtrl.calculatingLanguages(charSkills,
        char.modAttributes.intelligence, char.charRace.initialIdiom);
    notifyListeners();
  }
  //======================================================================================

  updateCharModel() {
    char.charClass = char.charClass.copyWith(
        description: '', permittedAligments: [], forbidenArmorType: []);
    char.physicalStyle =
        char.physicalStyle.copyWith(description: '', forbiddenClasses: []);
    char.alignment = char.alignment.copyWith(
      description: '',
    );
    char.battleStyle = char.battleStyle.copyWith(description: '');
    char.loot = charLoot;
    char.charClass.traits = traits;
    char.charClass.speacials = specials;
    char.feats = charFeats;
    char.skills = charSkills;
    char.charEquip.tomesAndManuals = tomesAndManuals;
    char.languages = charLanguages;
    char.charEquip.potions = charPotions;
    notifyListeners();
  }
}
