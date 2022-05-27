#this file is created by me - Gaurav
from django.shortcuts import render
from django.http import HttpResponse
from httpx import request

from textblob import TextBlob  # nlp library used for translatioin
import speech_recognition as sr
from playsound import playsound
from gtts import gTTS
import os


r = sr.Recognizer()
spokenText=""
speech_to_text_called = False


def pages(request):
    return HttpResponse("hello world")


def speech_to_text():
    
    try:

        # use the microphone as source for input.
        with sr.Microphone() as source2:

            # wait for a second to let the recognizer
            # adjust the energy threshold based on
            # the surrounding noise level
            r.adjust_for_ambient_noise(source2, duration=0.2)

            # listens for the user's input
            audio2 = r.listen(source2)

            # Using google to recognize audio
            MyText = r.recognize_google(audio2)
            MyText = MyText.lower()
            spokenText=MyText
            # print(MyText)
            
            
    except sr.RequestError as e:
        print("Could not request results; {0}".format(e))

    except sr.UnknownValueError:
        print("sorry your voice is not clear please speak again but this function is being called")

def aboutpage(request):
    return render(request, 'aboutINtra.html')


def index(request):
    
    print(request.GET.get('texts', 'default'))
    djtext = request.GET.get('texts', '')
    print(djtext +' ok')
    
    
    print(request.GET.get('selectlanguage', 'en'))
    lang1 = request.GET.get('selectlanguage', 'en')
    lang2 = request.GET.get('selectlanguage2', 'hi')
    print(lang2)
    print(djtext)
    txt = ''
    try:
        tb = TextBlob(djtext)

        txt = tb.translate(from_lang=lang1,to=lang2)
        print(txt)
    except Exception as e:
        words=e
        
    if(txt==''):
        txt=djtext

    print(txt)
    

    params = {'translated_text': txt, 'given_text': djtext}
    return render(request, "index.html", params)


