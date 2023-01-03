class ConfigConsts {
  static const String regUsersColl = 'reg_users';
  static const String regUsersField = 'mail';

  static const String userdataColl = 'userdata';
  static const String emailField = 'email';
  static const String testStatusField = 'f4e76';
  static const String quizDataField = 'quizData';
  static const String scoreField = 'score';

  static const String testWaiting = 'test_waiting';
  static const String testEnded = 'test_ended';
  static const String testStarted = 'test_started';

  static const String testTimeColl = 'test_time';
  static const String startTimeField = 'starttime';
  static const String prefsKeyApti = 'apti_data';

  static const int testDurationUnit = 60;
  static const Duration testDuration = Duration(minutes: 60);
  static const int testDurationLastmins = 5;
  static const int endTestButtonVisiblefromEndMins = 30;
}
