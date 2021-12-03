# RestApi_Covid19_FlutterApp
<p align="center"> 
<img src="https://user-images.githubusercontent.com/32794378/142868177-cbde51fb-c5ae-49bd-ab92-3fe753c9d1ad.png" alt="Logo" width="120">
</p>
<h3 align="center">Covid Tracker<br><br>
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/ISL270/RestApi_Covid19_FlutterApp">
<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/ISL270/RestApi_Covid19_FlutterApp">
<img src="https://visitor-badge.glitch.me/badge?page_id=ISL270.RestApi_Covid19_FlutterApp&right_color=red&left_text=visitors" /></h3>

## About
I developed a fully functioning Coronavirus Tracker flutter application that is compatible with both iOS & Android. I used [**nCoV 2019 health API**](https://ncov2019-admin.firebaseapp.com/) to get the latest global data about the coronavirus outbreak. This app makes the requests using my authorization key & access token(updated automatically when expired), then parses the JSON response data into strongly-typed model classes and displays it to the user. It also caches the data using [**shared_preferences**](https://pub.dev/packages/shared_preferences), so that the data is saved on device for offline use.

**Note:** I didn't include my `api_keys.dart` file, so you have to make your own dart file that stores your keys, otherwise it won't work.

## Preview
<p align="center"> 
<img src="https://user-images.githubusercontent.com/32794378/142869213-cb1bd144-8063-4152-9bd1-aa14eb1ffce0.png" alt="Logo" width="300">
</p>
