# Internationalized-Covid19-FlutterApp
<p align="center"> 
<img src="https://user-images.githubusercontent.com/32794378/142868177-cbde51fb-c5ae-49bd-ab92-3fe753c9d1ad.png" alt="Logo" width="120">
</p>
<h3 align="center">Covid19 Tracker<br><br>
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/ISL270/Internationalized-Covid19-FlutterApp">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/ISL270/Internationalized-Covid19-FlutterApp">
<img src="https://visitor-badge.glitch.me/badge?page_id=ISL270.Internationalized-Covid19-FlutterApp&right_color=red&left_text=visitors" /></h3>

## About
I developed an [**internationalized**](https://docs.flutter.dev/development/accessibility-and-localization/internationalization) Coronavirus Tracker flutter application that is available in 6 languages (English, Arabic, Chinese, Hindi, Spanish, Deutch) and I'm planning on adding more languages in the fututre. I used [**nCoV 2019 health API**](https://ncov2019-admin.firebaseapp.com/) to get the latest global data about the coronavirus outbreak.

This app makes the requests using my authorization key & access token(updated automatically when expired), then parses the JSON response data into strongly-typed model classes and displays it to the user. It also caches the data using [**shared_preferences**](https://pub.dev/packages/shared_preferences), so that the data is saved on device for offline use.

The app automatically matches the language with the device's locale, but users are also able to change the language manually from the settings screen. Users also have the ability to switch between the light and dark themes.

**Note:** I didn't include my `api_keys.dart` file, so you have to make your own dart file that stores your keys, otherwise it won't work.

## Preview
<p align="center"> 
<img src="/previewGIF.gif" alt="Logo" width="60%">
</p>
