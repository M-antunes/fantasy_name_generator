enum LetterOrSyllabus {
  vowel,
  consonant,
  twoLetterSyllabus,
  threeLetterSyllabus,
  fourLetterSyllabus,
}

class LetterModel {
  final LetterOrSyllabus type;
  final String value;
  LetterModel({
    required this.type,
    required this.value,
  });
}
