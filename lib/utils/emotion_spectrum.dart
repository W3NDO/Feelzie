class EmotionSpectrum {
  final Map emotions = {
    "JOY": [
      {"name": "Happy", "description": ""},
      {"name": "Euphoric", "description": ""},
      {"name": "Excited", "description": ""},
      {"name": "Optimistic", "description": ""},
      {"name": "Proud", "description": ""},
    ],
    "LOVE": [
      {"name": "Grateful", "description": ""},
      {"name": "Sentimental", "description": ""},
      {"name": "Affectionate", "description": ""},
      {"name": "Romantic", "description": ""},
      {"name": "Enchanted", "description": ""},
    ],
    "FEAR": [
      {"name": "Scared", "description": ""},
      {"name": "Terrified", "description": ""},
      {"name": "Insecure", "description": ""},
      {"name": "Nervous", "description": ""},
      {"name": "Horrified", "description": ""},
    ],
    "ANGER": [
      {"name": "Enraged", "description": ""},
      {"name": "Exasperated", "description": ""},
      {"name": "Irritable", "description": ""},
      {"name": "Jealous", "description": ""},
      {"name": "Disgusted", "description": ""},
    ],
    "SADNESS": [
      {"name": "Hurt", "description": ""},
      {"name": "Disappointed", "description": ""},
      {"name": "Shameful", "description": ""},
      {"name": "Lonely", "description": ""},
      {"name": "Gloomy", "description": ""},
    ],
    "SURPRISE": [
      {"name": "Moved", "description": ""},
      {"name": "Overcome", "description": ""},
      {"name": "Amazed", "description": ""},
      {"name": "Confused", "description": ""},
      {"name": "Stunned", "description": ""},
    ],
  };

  Map<String, String> getEmotionBreakdown(emotion) {
    return emotions[emotion];
  }

  List<String> getFineEmotions([String emotion = '']) {
    List<String> fineEmotions = [];
    if (emotion != '') {
      emotions[emotion]
          .forEach((fineEmotion) => fineEmotions.add(fineEmotion['name']));
    } else {
      emotions.keys.forEach((k) => emotions[k]
          .forEach((fineEmotion) => fineEmotions.add(fineEmotion['name'])));
    }
    return fineEmotions;
  }

  List<String> getBaseEmotions() {
    return List.from(emotions.keys);
  }
}