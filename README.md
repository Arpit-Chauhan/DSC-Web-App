## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Note](#note)


## General info
This project is a simple DSC Quiz web app, a platform where users can give quiz.
Hosted at <a href="">https://dsc-quiz-app.web.app/</a>


## Version
Project is created with:
* Flutter 2.2.3 stable
* Dart 2.13.4


## Setup
To run this project, clone it and locate to your project:

```
$ flutter pub get
$ flutter run -d chrome
$ echo for web
$ flutter build web
$ firebase deploy --only hosting
```

## Note
 - coll/fieldName : test_time/starttime
 - make firebase update at exact start and end of the exam
 - for versioon control 
 ```    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('flutter-first-frame', function() {
                navigator.serviceWorker.register('flutter_service_worker.js?0.2');
            });
        }
    </script>
    <script src="main.dart.js?version=0.2" type="application/javascript"></script>
```
