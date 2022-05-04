import '../../../../../models/class_models/specials_model.dart';
import '../../../../../models/class_models/traits_model.dart';

class SamuraiTraitsData {
  List<TraitModel> samuraiTraits = [
    TraitModel(
      traiName: "Challenge",
      levelAcquired: 1,
      multiplier: 3,
      traiDescription:
          "Once per day, a samurai can challenge a foe to combat. As a swift action, the samurai chooses one target within sight to challenge. The samurai's melee attacks deal extra damage when made against the target of his challenge. This extra damage is equal to the samurai's level. The samurai can use this ability once per day at 1st level, plus one additional time per day for every three levels beyond 1st, to a maximum of seven times per day at 19th level. Challenging a foe requires much of the samurai's concentration. The samurai takes a –2 penalty to his Armor Class, except against attacks made by the target of his challenge. The challenge remains in effect until the target is dead or unconscious, or until the combat ends. Each samurai's challenge also includes another effect, which is listed in the section describing the samurai's order.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mount",
      levelAcquired: 1,
      traiDescription:
          "A samurai gains the service of a loyal and trusty steed to carry him into battle. This mount functions as a druid's animal companion, using the samurai's level as his effective druid level. The creature must be one that he is capable of riding and that is suitable as a mount. A samurai does not take an armor check penalty on Ride checks while riding his mount. The mount is always considered combat trained and begins play with Light Armor Proficiency as a bonus feat. A samurai's mount does not gain the share spells special ability. A samurai's bond with his mount is strong, with the pair learning to anticipate each other's moods and moves. Should a samurai's mount die, the samurai may find another mount to serve him after 1 week of mourning. The new mount does not gain the link, evasion, devotion, or improved evasion special abilities until the next time the samurai gains a level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Order",
      levelAcquired: 1,
      traiDescription:
          "At 1st level, a samurai must pledge himself to a specific order, typically the order of the warrior. The order grants the samurai a number of bonuses, class skills, and special abilities. In addition, each order includes a number of edicts the samurai must follow. If he violates these edicts, he loses the benefits of his order's challenge ability for 24 hours. The violation of an edict is subject to GM interpretation. Most samurai belong to the order of the warrior and are dedicated to their lord. Those without a lord, or who chose to abandon their lord, are ronin. A samurai may instead elect to dedicate himself to one of the orders listed under the Samurai description, but such samurai are rare. A samurai who wishes to change his order must undertake a lengthy process to dedicate himself to a new cause. When this choice is made, he immediately loses all of the benefits from his old order. He must then follow the edicts of his new order for one entire level without gaining any benefits from that order. Once he has accomplished this, he gains all the bonuses from his new order. The only exception to this is when a samurai decides to become a ronin. A samurai can elect to become a ronin immediately, losing all the benefits from his old order and replacing them with the new benefits from the ronin order. Once a ronin, however, the only way for the samurai to change to another order is through the method described above. Note that the names of these orders might vary depending upon the campaign setting or GM's preference.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Resolve",
      levelAcquired: 1,
      multiplier: 2,
      traiDescription:
          "Starting at 1st level, the samurai gains resolve that he can call upon to endure even the most devastating wounds and afflictions. He can use this ability once per day at 1st level, plus one additional time per day for every two samurai levels beyond 1st. Whenever the samurai defeats the target of his challenge, he regains one daily use of his resolve, up to his maximum number of uses per day. Defeating the target of his challenge usually involves reducing the target to 0 hit points or fewer, but the GM might rule that an enemy who surrenders or flees the battle is also defeated. He can use this resolve in a number of ways:\n• Determined: As a standard action, the samurai can spend one use of his resolve to remove the fatigued, shaken, or sickened condition. If the samurai is at least 8th level, he can alternatively remove the exhausted, frightened, nauseated, or staggered condition. If the condition has a duration longer than 1 hour or is permanent, this ability removes the condition for 1 hour, at which time the condition returns.\n• Resolute: Whenever the samurai is required to make a Fortitude or Will save, he can spend one use of his resolve as an immediate action to roll twice and take the better result. He must decide to use this ability before he rolls the saving throw.\n• Unstoppable: When the samurai is reduced to fewer than 0 hit points but not slain, he can spend one use of his resolve as an immediate action to instantly stabilize and remain conscious. He is staggered, but he does not fall unconscious and begin dying if he takes a standard action. He does fall unconscious if he takes additional damage from any source.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Expertise",
      levelAcquired: 3,
      traiDescription:
          " At 3rd level, a samurai gains an unparalleled expertise with his chosen weapons. At 3rd level, the samurai selects either the katana, longbow, naginata, or wakizashi. The samurai can draw the selected weapon as a free action as if he had the Quick Draw feat. In addition, whenever he threatens a critical hit with the selected weapon, he gains a +2 bonus on the confirmation roll. Finally, his samurai levels count as fighter levels and stack with any fighter levels he possesses for the purposes of meeting the prerequisites for feats that specifically select his chosen weapon, such as Weapon Specialization.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mounted Archer",
      levelAcquired: 4,
      traiDescription:
          "At 4th level, the samurai becomes skilled at firing ranged weapons while mounted. A samurai only takes a –2 penalty on attack rolls with ranged weapons while his mount takes a double move. This penalty increases to –4 while his mount is running.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Banner",
      levelAcquired: 1,
      multiplier: 5,
      traiDescription:
          "At 5th level, a samurai's banner becomes a symbol of inspiration to his allies and companions. As long as the samurai's banner is clearly visible, all allies within 60 feet receive a +2 morale bonus on saving throws against fear and a +1 morale bonus on attack rolls made as part of a charge. At 10th level, and every five levels thereafter, these bonuses increase by +1. The banner must be at least Small or larger and must be carried or displayed by the samurai or his mount to function.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Bonus Feat",
      levelAcquired: 6,
      multiplier: 6,
      traiDescription:
          "At 6th level, and every six levels thereafter, a samurai gains a bonus feat in addition to those gained from normal advancement. These bonus feats must be selected from those listed as combat feats. The samurai must meet the requirements of these bonus feats.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Resolve",
      levelAcquired: 9,
      traiDescription:
          "At 9th level, a samurai can spend his resolve to negate some of his most grievous wounds. After a critical hit is confirmed against him, the samurai can spend one use of his resolve as an immediate action to treat that critical hit as a normal hit. Effects that only trigger on a critical hit do not trigger when the samurai uses this ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Honorable Stand",
      levelAcquired: 11,
      multiplier: 6,
      traiDescription:
          "At 11th level, a samurai can make an honorable stand, deciding to fight the target of his challenge to the bitter end, no matter the cost. He can make an honorable stand once per day at 11th level, plus one additional time per day at 16th level. Declaring an honorable stand is a swift action. While making an honorable stand, the samurai is immune to the shaken, frightened, and panicked conditions. He does not fall unconscious while his hit point total is below 0. Finally, whenever a samurai making an honorable stand must make a saving throw, he can spend one daily use of his resolve to reroll the saving throw after the first roll is made. He must take the result of the second roll, even if it is worse. If a samurai making an honorable stand ever retreats from battle against his challenged foe, he loses the ability to make a challenge for 24 hours.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Demanding Challenge",
      levelAcquired: 12,
      traiDescription:
          "At 12th level, whenever a samurai declares a challenge, his target must pay attention to the threat he poses. As long as the target is within the threatened area of the samurai, it takes a –2 penalty to its AC on attacks made by anyone other than the samurai.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Banner",
      levelAcquired: 14,
      traiDescription:
          "At 14th level, a samurai's banner becomes a rallying call to his allies. All allies within 60 feet receive a +2 morale bonus on saving throws against charm and compulsion spells and effects. In addition, while his banner is displayed, the samurai can spend a standard action to wave the banner through the air, granting all allies within 60 feet an additional saving throw against any one spell or effect that is targeting them. This save is made at the original DC. Spells and effects that do not allow saving throws are unaffected by this ability. An ally cannot benefit from this ability more than once per day.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "True Resolve",
      levelAcquired: 17,
      traiDescription:
          "At 17th level, a samurai can spend uses of his resolve to avoid death. If he has at least two uses of his resolve remaining, he can spend all of the daily uses of his resolve that he has available to him to avoid death. Regardless of the source of the attack that would have killed him, he is left alive, at –1 hit points (or lower if he was already below –1), unconscious, and stable.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Last Stand",
      levelAcquired: 20,
      traiDescription:
          "At 20th level, a samurai can make a last stand once per day whenever he makes a challenge. While this challenge is in effect, all melee and ranged weapons deal the minimum amount of damage to the samurai, unless the attack scored is a critical hit. In addition, the samurai remains conscious and is not staggered while he is below 0 hit points. While using this ability, the samurai cannot be killed by melee or ranged weapons unless they are wielded by the target of his challenge. Attacks made by opponents that are not the target of his challenge deal no damage when samurai has 0 or fewer hit points. This ability has no effect on spells, environmental effects, supernatural abilities, or any other source of damage other than melee and ranged weapons. Such sources of damage affect him normally and can kill him (although they do not cause him to fall unconscious or to become staggered if they reduce his hit points below 0). This effect lasts until the challenge ends or the samurai takes an offensive action against a target other than the target of his challenge.",
      isSelected: false,
    ),
  ];

  List<SpecialsModel> orders = [
    SpecialsModel(
      name: "Order of the Asp",
      levelAcquired: 1,
      description:
          "Samurais belonging to the order of the asp belong to a cutthroat group where ruthless pragmatism and underhanded dealing are the keys to moving up the chain of command. They tend to be brutal, self-centered leaders who reap confidence from their subordinates’ misery.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Beast",
      levelAcquired: 1,
      description:
          "A Samurai who belongs to this order serves nature in all its forms. These Samurais believe that animals make the most loyal companions, and keep close to woodland creatures.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Blossom",
      levelAcquired: 1,
      description:
          "Samurais of the order of the blossom dedicate their lives to protecting fey, especially those visiting the Material Plane from the First World. These Samurais might be fey themselves, but even if they aren’t, they exhibit the same whimsy and occasionally cruel sense of humor typical of most denizens of the First World.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Blue Rose",
      levelAcquired: 1,
      description:
          "The Samurais of the order of the blue rose dedicate themselves to promoting peace in the lands they roam. Skilled warriors and adept diplomats, these Samurais counsel wisdom, patience, and understanding, but are ever mindful of the need to take up arms to strike down aggressors, tyrants, or evil usurpers. Although they believe wholeheartedly in peace as an aim and a final goal, Samurais of the blue rose are warriors first, and embrace their role as guardians of those who cannot or will not take up arms to defend themselves.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Cockatrice",
      levelAcquired: 1,
      description:
          "A Samurai who belongs to this order serves only himself, working to further his own aims and increase his own prestige. Samurais of this order tend to be selfish and concerned only with personal goals and objectives.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Dragon",
      levelAcquired: 1,
      description:
          "Samurais belonging to the order of the dragon dedicate themselves to a group of like-minded individuals, be it a mercenary company or a small band of adventurers. These Samurais believe in loyalty and friendship, and are willing to lay down their lives to protect their allies.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Eastern Star",
      levelAcquired: 1,
      description:
          "This Samurai order exists to keep dangerous secrets hidden from the world and secretly protect the world against unimaginable threats from beyond the mortal realms. These Samurais scout and observe, concerning themselves not with the trivial pursuit of morality, but rather with ensuring the survival of society itself.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Eel",
      levelAcquired: 1,
      description:
          "Samurais who join the order of the eel believe communication and negotiation are the true paths to greatness and success for all. They seek out new individuals to befriend, offer their services as guides or mercenaries, and negotiate the terms of mutually beneficial arrangements. Locathah eel riders were the founders of the order of the eel, but other aquatic races have since joined. Even a few land-dwelling Samurais along the coastline have pledged themselves to this order of diplomats and negotiators.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the First Law",
      levelAcquired: 1,
      description:
          "Samurais belonging to the order of the First Law are dedicated to hunting down anyone practicing, preaching, or otherwise facilitating religion in Rahadoum.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Flame",
      levelAcquired: 1,
      description:
          "A Samurai of the order of the flame devotes his life to the pursuit of personal glory. Even if such pursuit puts his own life on the line, the Samurai pursues legendary status and the fame and glory associated with such renown.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Guard",
      levelAcquired: 1,
      description:
          "Samurais who join the order of the guard dedicate themselves to the staunch and unyielding protection of a specific person or object—generally one they have been hired to protect. Members of the order of the guard are often mercenaries, offering their valuable services for a fee to those who wish to protect their investments; this is especially in Druma, where many Samurais belong to the illustrious and steadfast Blackjackets of the Mercenary League. An order of the guard Samurai can offer his services to a cause in which he believes without accepting a monetary payment, though the Samurai’s protection must come at some price, be it a favor, the release of knowledge, or other intangible trade. A tenet of the order is that the high level of protection the order strives for is only obtainable if the protector invests something of himself in the task and stands to lose something valuable should he fail.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Hammer",
      levelAcquired: 1,
      description:
          "Samurais of the order of the hammer respect might over all, and believe that those who prove their strength have earned the right to make decisions for the weak. When the Samurai’s own goals conflict with those of a mighty ruler, the Samurai must prove that her own strength and ideals are superior.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Lion",
      levelAcquired: 1,
      description:
          "A Samurai who belongs to this order has pledged himself to a sovereign; be it a king, queen, or even the local warlord. Samurais of this order are stalwart and dedicated to their cause, willing to go any length to ensure the safety of their lord and his domain.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Reins",
      levelAcquired: 1,
      description:
          "The Samurais of the order of the reins hold a strong rapport not just with their mounts, but with all tamed and domesticated animals on Golarion. From camels and horses to teams of sled dogs, these Samurais hold themselves honor-bound to protect these creatures for their labor and loyalty. Samurais of the order of the reins often serve as the commanders of caravans or other expeditions, using their unique skills to ensure that the caravan and its wares safely reach their intended markets.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Paw",
      levelAcquired: 1,
      description:
          "Only dog- or wolf-riding halflings are eligible to join this order of Samurais. When they do, they pledge to defend halflings, halfling settlements, and other innocent folks by patrolling the wilderness and seeking out possible threats to both individuals and whole communities. These Samurais hunt down potential danger with a ruthless efficiency and determination that non-halflings find surprising and even somewhat alarming.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "Order of the Penitent",
      levelAcquired: 1,
      description:
          "Not all knights begin their careers as nobles’ children or as squires. Some start out as thieves, murderers, or cheats, and only after they see the suffering caused by their crimes do they dedicate themselves to honorable service. Samurais who follow this order seek to make up for the crimes they’ve committed in the past, and do whatever they can to restore their tainted honor.",
      isSelected: false,
    ),
    SpecialsModel(
      name: "",
      levelAcquired: 1,
      description: "",
      isSelected: false,
    ),
  ];
}
