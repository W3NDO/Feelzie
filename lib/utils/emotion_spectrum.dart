class EmotionSpectrum {
  final Map emotions = {
    "JOY": [
      {"name": "Happy", "description": "", "color": 0xD9A0CF9B},
      {"name": "Euphoric", "description": "", "color": 0xD9B5CF9B},
      {"name": "Excited", "description": "", "color": 0xD9B5CF9B},
      {"name": "Optimistic", "description": "", "color": 0xD9B5CF9B},
      {"name": "Proud", "description": "", "color": 0xD9B5CF9B},
    ],
    "LOVE": [
      {"name": "Grateful", "description": "", "color": 0xD9F4ED94},
      {"name": "Sentimental", "description": "", "color": 0xD9F4C794},
      {"name": "Affectionate", "description": "", "color": 0xD9F4DA94},
      {"name": "Romantic", "description": "", "color": 0xD9F4ED94},
      {"name": "Enchanted", "description": "", "color": 0xD9E8F494},
    ],
    "FEAR": [
      {"name": "Scared", "description": "", "color": 0xD9F3B294},
      {"name": "Terrified", "description": "", "color": 0xD9F3949C},
      {"name": "Insecure", "description": "", "color": 0xD9F39F94},
      {"name": "Nervous", "description": "", "color": 0xD9F3B294},
      {"name": "Horrified", "description": "", "color": 0xD9F3C594},
    ],
    "ANGER": [
      {"name": "Enraged", "description": "", "color": 0xD9CA7FAC},
      {"name": "Exasperated", "description": "", "color": 0xD9CA7FCA},
      {"name": "Irritable", "description": "", "color": 0xD9CA7FBB},
      {"name": "Jealous", "description": "", "color": 0xD9CA7FAC},
      {"name": "Disgusted", "description": "", "color": 0xD9CA7F9D},
    ],
    "SADNESS": [
      {"name": "Hurt", "description": "", "color": 0xD98F9CC0},
      {"name": "Disappointed", "description": "", "color": 0xD98FB0C0},
      {"name": "Shameful", "description": "", "color": 0xD98FA6C0},
      {"name": "Lonely", "description": "", "color": 0xD98F9CC0},
      {"name": "Gloomy", "description": "", "color": 0xD98F92C0},
    ],
    "SURPRISE": [
      {"name": "Moved", "description": "", "color": 0xD98DC4C6},
      {"name": "Overcome", "description": "", "color": 0xD98DC6B1},
      {"name": "Amazed", "description": "", "color": 0xD98DC6BD},
      {"name": "Confused", "description": "", "color": 0xD98DC4C6},
      {"name": "Stunned", "description": "", "color": 0xD98DB9C6},
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

  int getFineEmotionColor(String baseEmotion, String fineEmotion) {
    int color = 0;
    emotions[baseEmotion].forEach((_fineEmotion) {
      if (_fineEmotion["name"] == fineEmotion) {
        color = _fineEmotion["color"];
      }
    });
    return color;
  }
}
