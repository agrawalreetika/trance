import speech_recognition as sr

from processor.audio_processor import recognize_speech_from_mic, speak
from processor.text_processor import convert_text_to_query
from service.datadiscovery import query_discovery

if __name__ == "__main__":
    PROMPT_LIMIT = 2
    recognizer = sr.Recognizer()
    microphone = sr.Microphone()
    speak(speech_file='audio_files/greeting.mp3')
    # if a transcription is returned, break out of the loop and
    #     continue
    # if no transcription returned and API request failed, break
    #     loop and continue
    # if API request succeeded but no transcription was returned,
    #     re-prompt the user to say their guess again. Do this up
    #     to PROMPT_LIMIT times
    for j in range(PROMPT_LIMIT):
        guess = recognize_speech_from_mic(recognizer, microphone)
        if guess["transcription"]:
            break
        if not guess["success"]:
            break
        speak(speech_file='audio_files/speak_again.mp3')

    if not guess["transcription"]:
        speak(speech_file='audio_files/enter_manually.mp3')
        guess["transcription"] = raw_input('Please enter your speech: \n')
    else:
        speak(text='Did you mean {}?'.format(guess["transcription"]), delete_tmp_audio=True)
        print('Did you mean "{}"?'.format(guess["transcription"]))
        yes_or_no = recognize_speech_from_mic(recognizer, microphone)

        if yes_or_no["transcription"] is None or yes_or_no["transcription"] == 'no':
            speak(speech_file='audio_files/enter_manually.mp3')
            guess["transcription"] = raw_input('Please enter your speech: \n')

    speak(speech_file='audio_files/query_run_confirm.mp3')
    query = convert_text_to_query(guess["transcription"])
    query = query.replace(';', '')

    print "SQL Query: {}".format(query.lower())

    print query_discovery(query.lower())
    speak(speech_file='audio_files/query_result.mp3')
