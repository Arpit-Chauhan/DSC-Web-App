import 'package:dsc_web/models/question.model.dart';

class QuestionBank {
  static List<QuestionModel> list = [
    // -----
    // ap1
    QuestionModel(
      'Aptitude',
      true,
      'If you write down all the numbers from 1 to 100 then how many times do you write 3.',
      '',
      ['20', '18', '21', '11'],
      '20',
      '',
    ),
    // ap2
    QuestionModel(
      'Aptitude',
      true,
      'if a+b>c+d and b+c>a+d then it is definite that',
      '',
      ['d>b', 'c>d', 'a>d', 'b>d'],
      'b>d',
      '',
    ),
    // ap3
    QuestionModel(
      'Aptitude',
      true,
      'What will be the output of the following pseudocode?',
      'char ch\n   set ch=d\nprint(“%d”, ch)',
      ['Error', '68', '100', 'd'],
      '100',
      '',
    ),
    // ap4
    QuestionModel(
      'Aptitude',
      true,
      ' a is greater than b by 2 and b is greater than c by 10. If a + b + c = 130 then (b + c) = a =?',
      '',
      ['34', '33', '20', '21'],
      '34',
      '',
    ),
    // ap5
    QuestionModel(
      'Aptitude',
      true,
      'Find the number which when added to itself 13 times gives 112',
      '',
      ['7', '8', '9', '11'],
      '8',
      '',
    ),
    // ap6
    QuestionModel(
      'Aptitude',
      true,
      'A total of 324 coins of 20 paise and 25 paise makes a sum of 71 rs. The number of 25 paise coins ',
      '',
      ['120', '124', '144', '200'],
      '124',
      '',
    ),
    // ap7
    QuestionModel(
      'Aptitude',
      true,
      'What will be the output of the following pseudocode for a=2?',
      ' int func (int a)\n    if(a == 5)\n  return (a+2)\n else\n return 2 * func(a+1)',
      ['5', '54', '10', '56'],
      '56',
      '',
    ),
    // ap8
    QuestionModel(
      'Aptitude',
      true,
      'A man has one-rupee, 5-rupee and 10-rupee currency notes of worth 480. If the number of notes of each denomination be same, then the total number of notes will be?',
      '',
      ['90', '80', '98', '85'],
      '90',
      '',
    ),
    // ap9
    QuestionModel(
      'Aptitude',
      true,
      'Consider the following statement and choose the correct option\n  1. In dynamic allocation of 2D array we can allocate different number of columns for each row.\n 2. Correct syntax dynamic allocation  of 2D array is int*p = new int*[10] \n 3. Syntax for deletion of dynamic array is.   delete p []',
      '',
      ['Only 1 is correct', 'All the statements are correct', '2,3 are correct', '1,2 are correct'],
      'Only 1 is correct',
      '',
    ),
    // ap10
    QuestionModel(
      'Aptitude',
      true,
      'Find the output',
      'void func(int a[]){\n printf("%d", sizeof(a));\n }\n int main(){\n int a[10];\n Func(a);\n }',
      ['8', '40', '4', 'Error'],
      '8',
      '',
    ),

    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'If 100 cats kills 100 mice in 100 days then 4 cats will kill 4 mice in how many days',
    //   '',
    //   ['1', '4', '40', '100'],
    //   '100',
    //   '',
    // ),
    // ap11
    QuestionModel(
      'Aptitude',
      true,
      'which will be the next term in the series: 4,9,17,29,_',
      '',
      ['51', '43', '37', '47'],
      '43',
      '',
    ),
    // ap12
    QuestionModel(
      'Aptitude',
      true,
      'Distance between two stations A and B is 778 km. A train covers the journey from A to B at 84 km per hour and returns back to A with a uniform speed of 56 km per hour. Find the average speed of the train during the whole journey.',
      '',
      ['54.8 km/hr', '57.2 km/hr', '63.9 km/hr', '67.2 km/hr'],
      '67.2 km/hr',
      '',
    ),
    // 13
    QuestionModel(
      'Aptitude',
      true,
      'A dishonest dealer professes to sell his goods at cost price but uses a weight of 960 gms for a kg. weight. Find his gain percent.',
      '',
      ['21/7%', '25/6%', '24/8%', '19/6%'],
      '25/6%',
      '',
    ),
    // 14
    QuestionModel(
      'Aptitude',
      true,
      'What is output of below program? ',
      'int main()\n{\nint i,j,count;\ncount=0;\nfor(i=0; i<7; i++);\n{\nfor(j=0;j<5;j++);\n{\n    count++\n}\n}\nprintf("%d",count);\nreturn 0;\n}',
      ['55', '35', '0', '1'],
      '1',
      '',
    ),
    // 15
    QuestionModel(
      'Aptitude',
      true,
      'What is output of below program? ',
      '#define MULTIPLY (a, b) a*b\nint main(){\ncout<<MULTIPLY (2+3,3+5);\nreturn 0;\n}',
      ['16', '40', 'Error', '32'],
      '16',
      '',
    ),
    // 16
    QuestionModel(
      'Aptitude',
      true,
      'What will be the output for the following code snippet',
      'void fun(int i, int &j, int p){\ni++;j++;p++;\n}\nint main(){\nint i =10;\nint j=6;\nint &p = i;\nfun(i,j,p);\nprintf("%d", i);\nprintf("%d", j);\nprintf("%d", p);\n}',
      ['10 7 10', '11 7 11', '10 7 11', '10 7 10'],
      '10 7 10',
      '',
    ),

    // 17
    QuestionModel(
      'Aptitude',
      true,
      'Which header file is required to run this program in C++ 14?',
      '#include<___>\nmain(){\n   cout<<"hello";\n}',
      ['stdio.h', 'conio', 'iostream.h', 'iostream'],
      'iostream',
      '',
    ),

    // 18
    QuestionModel(
      'Aptitude',
      true,
      'Correct code line - ',
      '',
      ['cout << "Age: %d",age;', 'cout << "Age: %d" << age;', 'cout << "Age: " + age;', 'cout << "Age: " << age;'],
      'cout << "Age: " << age;',
      '',
    ),

    // 19
    QuestionModel(
      'Aptitude',
      true,
      'Assuming all the headers included, What will be the output of following program',
      'int a=10;\nmain(){\n    int a=20;\n    cout<<::a;\n}',
      ['10', '20', '::10', '::20'],
      '20',
      '',
    ),

    // 20
    QuestionModel(
      'Aptitude',
      true,
      'setw() needs header file?',
      '',
      ['conio', 'iomanip', 'stdio', 'bits/stdc++'],
      'iomanip',
      '',
    ),

    // A1
    QuestionModel(
      'App Dev',
      true,
      'Which Benefits of Mobile Applications is defined by this?.\nA mobile app user can access and share information anytime or anywhere. Internet connection is not required for most apps - ',
      '',
      ['Convenience', 'Interactivity', 'Personalization', 'Productivity'],
      'Productivity',
      '',
    ),
    // A2
    QuestionModel(
      'App Dev',
      true,
      'It is the official IDE for Android application development, based on IntelliJ IDEA (a Java IDE).',
      '',
      ['Visual Studio', 'NetBeans', 'Eclipse', 'Android Studio'],
      'Android Studio',
      '',
    ),
    // A3
    QuestionModel(
      'App Dev',
      true,
      'Which of the following factors to consider in designing a Mobile Application?',
      '',
      ['Platforms and Device Compatibility', 'Screen Size', 'User Interaction', 'All of the choices'],
      'All of the choices',
      '',
    ),
    // A4
    QuestionModel(
      'App Dev',
      true,
      'Once installed on a device, each Android application lives in _______',
      '',
      ['device memory', 'external memory', 'security sandbox', 'none of the above'],
      'security sandbox',
      '',
    ),
    // A5
    QuestionModel(
      'App Dev',
      true,
      'What is the database used for the Android platform?',
      '',
      ['SQLite', 'Realm', 'MongoDB', 'PostgreSQL'],
      'SQLite',
      '',
    ),
    // A6
    QuestionModel(
      'App Dev',
      true,
      'What does AndroidManifest.xml file contains ?',
      '',
      [
        'This contains the .java source files for your project.',
        'contains the Android package files .apk built by the ADT',
        'includes critical information about the app, including the Java package name for the application',
        'It describes the fundamental characteristics of the app and defines each of its components.'
      ],
      'includes critical information about the app, including the Java package name for the application',
      '',
    ),
    // A7
    QuestionModel(
      'App Dev',
      true,
      'What is APK in android',
      '',
      ['Android packages', 'Android pack', 'Android package kit', 'None of the above.'],
      'Android package kit',
      '',
    ),
    // A8
    QuestionModel(
      'App Dev',
      true,
      'A programming environment that has been packaged as an application program',
      '',
      ['Programming Language', 'Android SDK', 'Visual Studio', 'Integrated Development Environment'],
      'Integrated Development Environment',
      '',
    ),
    // A9
    QuestionModel(
      'App Dev',
      true,
      'What best describes a push notification?',
      '',
      [
        'It is an SMS message',
        'Where data is sent to a client by a software application or computing device, without a specific request from the client.',
        'Where data is sent to a client by a software application or computing device, after the client has made a request',
        'A form of long-polling'
      ],
      'Where data is sent to a client by a software application or computing device, without a specific request from the client.',
      '',
    ),
    // A10
    QuestionModel(
      'App Dev',
      true,
      'The mobile front-end obtains the data from the back-end via a variety of service calls like',
      '',
      ['Chat options', 'Phone calls', 'API’s', 'Customer Care'],
      'API’s',
      '',
    ),

    // ---------------------------------

    // ML1
    QuestionModel(
      'ML',
      true,
      'A MNC utilises a rule based system to classify all monetary transactions as fraud or not fraud. What kind of solution is this?',
      '',
      [
        'Unsupervised Machine Learning Solution',
        'Supervised Machine Learning Solution',
        'Reinforcement Learning',
        'Not a Machine Learning Solution'
      ],
      'Not a Machine Learning Solution',
      '',
    ),
    // ML2
    QuestionModel(
      'ML',
      true,
      ' Mark the correct relationship between the following :',
      '',
      ['AI>ML>DL', 'DL>AI>ML', 'ML>AI>DL', 'No relationship between three entities'],
      'AI>ML>DL',
      '',
    ),
    // ML3
    QuestionModel(
      'ML',
      true,
      'How can you handle missing or corrupted data in a dataset?',
      '',
      [
        'Drop missing rows or columns',
        'Assign a unique category to missing values',
        'Replace missing values with mean/median/mode',
        'All'
      ],
      'All',
      '',
    ),
    // ML4
    QuestionModel(
      'ML',
      true,
      'Which of the following is an application of NLP?',
      '',
      ['Object recognition', 'COVID-19 Diagnosis', 'Language Translation', 'Cell Classification'],
      'Language Translation',
      '',
    ),
    // ml5
    QuestionModel(
      'ML',
      true,
      ' Which technique initially clusters unlabelled data and then utilises existing labelled data to categorize the unlabelled data?',
      '',
      [
        'Time series analysis',
        'Semi supervised machine learning',
        'Inverse Reinforcement learning',
        'Reinforcement learning'
      ],
      'Semi supervised machine learning',
      '',
    ),
    // ml6
    QuestionModel(
      'ML',
      true,
      'A dataset with 50 rows has a column on seasons which has 10 entries of summer, 15 entries of spring, 7 entries for winter and 11 entries for autumn. Which of the following method should be used to fill the missing values in 7 rows?',
      '',
      ['Median', 'Mean', 'Mode', 'Fill the missing values with zero.'],
      'Mode',
      '',
    ),
    // ml7
    QuestionModel(
      'ML',
      true,
      'Which process is used in creating new features from existing features with usage of mathematical operations?',
      '',
      ['Feature selection', 'Feature construction', 'Feature Extraction', 'Feature Transformation'],
      'Feature Transformation',
      '',
    ),
    // ml8
    QuestionModel(
      'ML',
      true,
      'Which scaling technique scales data in range between zero to one?',
      '',
      ['Standard Scaler', 'Min-Max Scaler', 'Absolute Maximum Scaling.', 'Robust Scaling.'],
      'Min-Max Scaler',
      '',
    ),
    // ml9
    QuestionModel(
      'ML',
      true,
      'Which algorithm among the following can be used for both classification and regression tasks?',
      '',
      ['Linear regression', 'Logistic regression', 'Support vector machine', 'Naive Bayes'],
      'Support vector machine',
      '',
    ),
    // ml10
    QuestionModel(
      'ML',
      true,
      'How is a dummy variable trap resolved in one hot encoding ?',
      '',
      [
        'By keeping n+1 columns for n categories.',
        'By using Label encoding as an alternative.',
        'By keeping n-1 columns for n categories.',
        'By establishing a relationship between all variables.'
      ],
      'By keeping n-1 columns for n categories.',
      '',
    ),

    // ---------------------

    // w1
    QuestionModel(
      'Web Dev',
      true,
      'Which of the following position shifts element relative to its parent.',
      '',
      ['relative', 'static', 'absolute', 'fixed'],
      'absolute',
      '',
    ),
    // w2
    QuestionModel(
      'Web Dev',
      true,
      'Which of the following can be used to make a website responsive.',
      '',
      ['Media query', 'Using rem /vh /vw units over pixels', 'Setting up the viewport', 'All of the above'],
      'All of the above',
      '',
    ),
    // w3
    QuestionModel(
      'Web Dev',
      true,
      'Which two defined string methods does Regular Expression in Javascript uses',
      '',
      ['search()', 'toString()', 'replace()', 'Both a and c'],
      'Both a and c',
      '',
    ),
    // w4
    QuestionModel(
      'Web Dev',
      true,
      'Number() method when applied over dates returns',
      '',
      ['No of days', 'No of hours', 'No of milliseconds', 'Error'],
      'No of milliseconds',
      '',
    ),
    // w5
    QuestionModel(
      'Web Dev',
      true,
      'Which of the following position shifts element relative to its parent.',
      '',
      ['relative', 'static', 'absolute', 'fixed'],
      'absolute',
      '',
    ),
    // w6
    QuestionModel(
      'Web Dev',
      true,
      '1 Can a <section> contain <article> elements?\n2 Can an <article> contain <section> elements?',
      '',
      ['Both True', '1-True , 2-False', '1-False, 2-True', 'Both False'],
      'Both True',
      '',
    ),
    // w7
    QuestionModel(
      'Web Dev',
      true,
      'Which of the following sets the element at the centre of the page',
      '',
      ['justify-content : mid', 'margin:auto', 'align-item: center', 'Both b and c'],
      'Both b and c',
      '',
    ),
    // w8
    QuestionModel(
      'Web Dev',
      true,
      'Which of the following are pseudo selectors',
      '',
      [
        'Before,hover,after, selection',
        'Firstline, active,hover,selector',
        'Selection,hover,focus, down',
        'All of the above'
      ],
      'Before,hover,after, selection',
      '',
    ),
    // w9
    QuestionModel(
      'Web Dev',
      true,
      'What is the output of the following Javascript code?',
      'var a=3.99;\nvar b=2.7;\nvar ans = Math.floor(a)*Math.ceil(b);\nconsole.log(ans);\n',
      ['9', '6', '8', '10.77'],
      '9',
      '',
    ),
    // w10
    QuestionModel(
      'Web Dev',
      true,
      'Using which selector you can select the 3rd <p> tag using the class given “dscAkgec”.',
      '<div class = “dscAkgec”>\n    <p>Paragraph 1 in the div.</p>\n    <p>Paragraph 2 in the div.</p>\n</div>\n<p>Paragraph 3. After a div.</p>\n<p>Paragraph 4. After a div.</p>',
      ['(`)', '>', '+', 'None'],
      '(`)',
      '',
    ),
    // QuestionModel(
    //   'Web Dev',
    //   true,
    //   'Which tag is used for linking many different web pages using a single image?',
    //   '',
    //   ['<Embed>', '<lframe>', '<map>', '<object>'],
    //   '<map>',
    //   '',
    // ),

    // vb15
    QuestionModel('Vision Based', false,
        'What are some of your weaknesses, what are you doing to turn it over as a strength?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'What is  your experience of managing an event or task?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'What attracts you to join DSC?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'Give some ideas for an online DSC event', '', [], '', ''),
    QuestionModel('Vision Based', false, 'What are the qualities of a manager that you possess?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'Why do you want to be a part of DSC?', '', [], '', ''),
    QuestionModel(
        'Vision Based',
        false,
        'How will you manage to complete a work on deadline which is given to two non-cooperating members of the team.',
        '',
        [],
        '',
        ''),
    QuestionModel('Vision Based', false, 'How do you handle failure?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'How do you rate an event as a success?', '', [], '', ''),
    QuestionModel(
        'Vision Based',
        false,
        'How will you handle the pressure of submitting a task within 1 hour, which has to be corresponded with the whole team.',
        '',
        [],
        '',
        ''),
    QuestionModel(
        'Vision Based', false, 'What do you foresee for yourself during the next five years?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'What is your vision in life?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'How has your work in the past five years made a difference?', '', [], '', ''),
    QuestionModel('Vision Based', false, 'What can you provide to the club?', '', [], '', ''),
    QuestionModel('Vision Based', false,
        'What technology would you like to work upon and why? (Be creative with your answer)', '', [], '', ''),

    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'A person on tour has 360 for his daily expenses. If he extends his tour for 4 days, he has to cut his daily expenses by 3. Find the original duration ofthe tour.',
    //   '',
    //   ['18 days', '19 days', '20 days', '21 days'],
    //   '20 days',
    //   '',
    // ),

    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'What is the average of first five multiples of 12?',
    //   '',
    //   ['36', '38', '40', '42'],
    //   '36',
    //   '',
    // ),

    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'A 60 liter mixture of milk and water contains 10% water. How much water must be added to make water 20% in the mixture?',
    //   '',
    //   ['8 Lt.', '7.5 Lt.', '7 Lt.', '6.5 Lt.'],
    //   '7.5 Lt.',
    //   '',
    // ),
    // QuestionModel('Aptitude', true, 'What is the HCF of 1095 and 1168?', '',
    //     ['37', '73', '43', '83'], '73', ''),
    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'What is the output of the code?',
    //   'def func():\n    print(65536)\n\nfunc()',
    //   ['256', '32768', '65536', 'Code raises an exception'],
    //   '65536',
    // //   '',
    // ),
    // QuestionModel(
    //   'Aptitude',
    //   true,
    //   'A shopkeeper sold an article for Rs. 2500. If the cost price of the article is 2000, find the profit percent.',
    //   '',
    //   ['23%', '25%', '27%', '29%'],
    //   '25%',
    //   '',
    // ),
    //
    // QuestionModel(
    //   'App Dev',
    //   true,
    //   'On change, notifyChange Listener __',
    //   '',
    //   [
    //     'Notifies all the consumers',
    //     'Notifies the user',
    //     'Render desired alert',
    //     'nothing such thing exists'
    //   ],
    //   'Notifies all the consumers',
    //   '',
    // ),
    // QuestionModel(
    //   'App Dev',
    //   true,
    //   'It is the way of creating only one instance throughtout the code irrespective of number of times its variables/objects are used.',
    //   '',
    //   ['Single Mounting', 'Singleton', 'Factory Method', 'Abstract Class'],
    //   'Singleton',
    //   '',
    // ),
    // //
    // QuestionModel(
    //   'Web Dev',
    //   true,
    //   'Which class centers tabs/pills',
    //   '',
    //   ['.nav Nav pills', '.nav-element', '.nav-nav', '.nav-justified'],
    //   '.nav-justified',
    //   '',
    // ),
    // QuestionModel(
    //   'Web dev',
    //   true,
    //   'Which tag is used for bold, apart from <b>',
    //   '',
    //   ['<dark>', '<bold>', '<strong>', '<highlight>'],
    //   '<strong>',
    //   '',
    // ),
    //
    // QuestionModel(
    //   'ML',
    //   true,
    //   'ML full Form',
    //   '',
    //   ['Machine Learning', 'Markup Learning', 'Machine Logic', 'Markup Logic'],
    //   'Machine Learning',
    //   '',
    // ),
    // QuestionModel(
    //   'ML',
    //   true,
    //   'KNN is a _ algorithm',
    //   '',
    //   ['Unsupervised', 'Supervised', 'Parentive', 'Hybrid'],
    //   'Supervised',
    //   '',
    // ),
    //
    // QuestionModel(
    //     'Vision Based', false, 'What is your vision?', '', [], '', ''),
    // QuestionModel('Vision Based', false, 'What change will you bring GDSC?', '', [], '', ''),
    // QuestionModel('Vision Based', false, 'Tell us about yourself in 2-3 Lines',
    //     '', [], '', ''),
  ];
}
