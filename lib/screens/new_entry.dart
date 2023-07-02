import 'package:flutter/material.dart';
import 'package:feelzie/utils/emotion_spectrum.dart';
import 'package:select_form_field/select_form_field.dart';

class NewEntryScreen extends StatefulWidget {
  static String id = "Settings_screen";
  static const routeName = '/settings';
  const NewEntryScreen({Key? key}) : super(key: key);

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  void doNothing() {}

  EmotionSpectrum emotes = new EmotionSpectrum();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController baseEmotionController = TextEditingController();
  final TextEditingController fineEmotionController = TextEditingController();

  List<Map<String, dynamic>> dropdownBaseEmotions = [];
  List<Map<String, dynamic>> dropdownFineEmotions = [];
  void setBaseEmotions() {
    List emotions = emotes.getBaseEmotions();
    emotions.forEach(
      (emotion) => dropdownBaseEmotions.add(
        {'value': emotion, 'label': emotion, 'icon': Icon(Icons.chevron_right)},
      ),
    );
  }

  void setFineEmotions([String baseEmotion = '']) {
    dropdownFineEmotions = [];
    List fineEmotions = [];
    if (baseEmotion != '') {
      fineEmotions = emotes.getFineEmotions(baseEmotion);
    } else {
      fineEmotions = emotes.getFineEmotions();
    }
    fineEmotions.forEach(
      (emotion) => dropdownFineEmotions.add(
        {
          'value': emotion,
          'label': emotion,
          'icon': Icon(Icons.center_focus_weak_rounded)
        },
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    setBaseEmotions();
    setFineEmotions('');
  }

  Widget FeelingsForm() {
    EmotionSpectrum emotes = new EmotionSpectrum();
    debugPrint(emotes.getBaseEmotions()[5]);
    var size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * 0.85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.cyan[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: size.height * 0.08),
                        const Center(
                          child: Text(
                            "How do you feel right now?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.06),
                        SelectFormField(
                          controller: baseEmotionController,
                          type: SelectFormFieldType.dropdown,
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          labelText: "What is your general mood rn?",
                          items: dropdownBaseEmotions,
                          onChanged: (val) => {
                            debugPrint(baseEmotionController.text),
                            setFineEmotions(baseEmotionController.text)
                          },
                          onSaved: (val) =>
                              {debugPrint(baseEmotionController.text)},
                        ),
                        SizedBox(height: size.height * 0.06),
                        SelectFormField(
                          cursorColor: Colors.white,
                          controller: fineEmotionController,
                          type: SelectFormFieldType.dropdown,
                          icon: Icon(Icons.arrow_drop_down_circle_outlined),
                          labelText: "Wanna be more specific??",
                          items: dropdownFineEmotions,
                          onChanged: (val) =>
                              {debugPrint(fineEmotionController.text)},
                          onSaved: (val) =>
                              {debugPrint(fineEmotionController.text)},
                        ),
                        SizedBox(height: size.height * 0.06),
                        TextFormField(
                          autofocus: false,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            hintText: "Explain why you think you feel this way",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size.height),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: doNothing,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.cyan,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(size.height)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
                                child: const Text(
                                  "Save",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Entry')),
        body: Center(child: FeelingsForm()));
  }
}
