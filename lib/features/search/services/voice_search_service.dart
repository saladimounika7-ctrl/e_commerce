import 'package:speech_to_text/speech_to_text.dart';

class VoiceSearchService {
  final SpeechToText speech = SpeechToText();

  Future<bool> initialize() async {
    return await speech.initialize();
  }

  Future<void> startListening({
    required Function(String) onResult,
  }) async {
    await speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
  }

  Future<void> stopListening() async {
    await speech.stop();
  }

  bool get isListening => speech.isListening;
}