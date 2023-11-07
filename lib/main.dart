import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 모바일 광고 SDK 초기화
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashPage = true;

  @override
  void initState() {
    super.initState();

    // 앱이 시작하고 2초 후에 스플래시 화면을 숨김
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSplashPage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _showSplashPage ? SplashPage() : MainPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 2초 후에 MainPage로 이동
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      return false; // 뒤로가기를 처리하지 않도록 함
    },
    child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
        title: Text(''),
        backgroundColor: Color(0XFF151515),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff151515),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/PerpleSpace_Logo.png',width: 40,height: 40),
              SizedBox(height: 10),
              Text(
                'Perple Space',
                style: TextStyle(
                  color: Color(0xFF8163E0),
                  fontSize: 20,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class MainPage extends StatelessWidget {
  DateTime? currentBackPressTime;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = MediaQuery.of(context).size.width - 40;

    return WillPopScope(
      onWillPop: () async {
        return onWillPop(context); // Pass the context
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          toolbarHeight: 0.0,
          title: Text(''),
          backgroundColor: Color(0XFF151515),
          elevation: 0,
          actions: [],
        ),
        body: Container(
          color: Color(0xff151515),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                Image.asset('assets/PerpleSpace_Logo.png',height: 100, width: 100),
                SizedBox(height: 10),
                Text(
                  '환영합니다:)\n이곳은 Perple Space입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(right: 40,left: 40,top: 0,bottom: 0), // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  PiecePage(),
                              transitionsBuilder:
                                  (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0x19888888)),
                          minimumSize:
                          MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '고민 해결하기',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '고민 해결을 도와드릴게요.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_01.png', height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(right: 40,left: 40,top: 0,bottom: 0), // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  TodayPage(),
                              transitionsBuilder:
                                  (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0x19888888)),
                          minimumSize:
                          MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '오늘의 운세',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '오늘은 어떤 날 일까요?.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_02.png', height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(right: 40,left: 40,top: 0,bottom: 0), // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  KnowledgePage(),
                              transitionsBuilder:
                                  (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(const Color(0x19888888)),
                          minimumSize:
                          MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '알고 계셨나요?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '매일 새로운 지식을 드려요.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_03.png', height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop(BuildContext context) async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('뒤로가기 버튼을 한 번 더 누르면 앱이 종료됩니다.',style: TextStyle(color: Color(0xffffffff))),
          behavior: SnackBarBehavior.floating, // SnackBar를 화면 하단에 띄웁니다.
          margin: EdgeInsets.only(bottom: 10.0,left: 10,right: 10), // 하단 여백 조절
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      );
      return false;
    }
    return true;
  }
}

class PiecePage extends StatefulWidget {
  @override
  _PiecePageState createState() => _PiecePageState();
}

class _PiecePageState extends State<PiecePage> {
  int selectedImageIndex = -1; // 선택된 이미지의 인덱스를 추적

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text(''),
        backgroundColor: Color(0XFF151515),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로가기 아이콘
          onPressed: () {
            // 뒤로가기 버튼을 눌렀을 때 MainPage로 이동
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    '선택한 조각이\n고민을 해결해 줄 거예요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.46,
                    decoration: ShapeDecoration(
                      color: Color(0x19555555),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 4개의 열
                          childAspectRatio: 1, // 이미지 비율을 1로 유지
                          mainAxisSpacing: 26.0, // 주 축 간격 (세로 간격)
                          crossAxisSpacing: 10.0, // 교차 축 간격 (가로 간격)
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          String imagePath = 'assets/point/image_$index.png';

                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (selectedImageIndex == index) {
                                  // 이미 선택된 이미지를 다시 누를 경우 선택 취소
                                  selectedImageIndex = -1;
                                } else {
                                  selectedImageIndex = index; // 해당 버튼이 선택됨
                                }
                              });
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0), // 그림자 제거
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (selectedImageIndex == index) {
                                    // 선택된 버튼의 배경색
                                    return Color(0x338163E0);
                                  } else if (states
                                      .contains(MaterialState.disabled)) {
                                    // 선택되지 않은 버튼의 배경색 (투명)
                                    return Colors.transparent;
                                  }
                                  // 선택되지 않은 버튼의 배경색 (원래 배경색 유지)
                                  return Colors.transparent;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(26.0), // 테두리의 곡률 조절
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.86 / 4,
                                MediaQuery.of(context).size.height * 0.6 / 5,
                              )),
                            ),
                            child: Image.asset(imagePath),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20, // 화면 아래에서 20픽셀 띄움
              left: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.9) /
                  2, // 화면 가로 중앙 정렬
              width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
              child: ElevatedButton(
                onPressed: (selectedImageIndex != -1)
                    ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SolutionPage(
                              selectedImageIndex: selectedImageIndex,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                          ),
                        ); // 버튼이 클릭될 때 실행할 코드를 여기에 추가
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    (selectedImageIndex != -1)
                        ? Color(0xFF8163E0)
                        : Color(0x408163E0), // 필요한대로 색상 변경 가능
                  ),
                  minimumSize: MaterialStateProperty.all(Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  '선택 완료',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (selectedImageIndex != -1)
                        ? Colors.white
                        : Color(0x40ffffff),
                    // 선택되었을 때와 선택되지 않았을 때 색상 변경 fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.0,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class PiecePage2 extends StatefulWidget {
  @override
  _PiecePage2State createState() => _PiecePage2State();
}

class _PiecePage2State extends State<PiecePage2> {
  int selectedImageIndex = -1; // 선택된 이미지의 인덱스를 추적

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text(''),
        backgroundColor: Color(0XFF151515),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // 뒤로가기 아이콘
          onPressed: () {
            // 뒤로가기 버튼을 눌렀을 때 MainPage로 이동
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    '첫 번째는 잊고,\n더 신중하게 골라보세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.46,
                    decoration: ShapeDecoration(
                      color: Color(0x19555555),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 4개의 열
                          childAspectRatio: 1, // 이미지 비율을 1로 유지
                          mainAxisSpacing: 26.0, // 주 축 간격 (세로 간격)
                          crossAxisSpacing: 10.0, // 교차 축 간격 (가로 간격)
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          String imagePath = 'assets/point/image_$index.png';

                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (selectedImageIndex == index) {
                                  // 이미 선택된 이미지를 다시 누를 경우 선택 취소
                                  selectedImageIndex = -1;
                                } else {
                                  selectedImageIndex = index; // 해당 버튼이 선택됨
                                }
                              });
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0), // 그림자 제거
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (selectedImageIndex == index) {
                                    // 선택된 버튼의 배경색
                                    return Color(0x338163E0);
                                  } else if (states
                                      .contains(MaterialState.disabled)) {
                                    // 선택되지 않은 버튼의 배경색 (투명)
                                    return Colors.transparent;
                                  }
                                  // 선택되지 않은 버튼의 배경색 (원래 배경색 유지)
                                  return Colors.transparent;
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(26.0), // 테두리의 곡률 조절
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(Size(
                                MediaQuery.of(context).size.width * 0.86 / 4,
                                MediaQuery.of(context).size.height * 0.6 / 5,
                              )),
                            ),
                            child: Image.asset(imagePath),
                          );
                        },
                        itemCount: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20, // 화면 아래에서 20픽셀 띄움
              left: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.9) /
                  2, // 화면 가로 중앙 정렬
              width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
              child: ElevatedButton(
                onPressed: (selectedImageIndex != -1)
                    ? () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    SolutionPage2(
                              selectedImageIndex: selectedImageIndex,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                          ),
                        ); // 버튼이 클릭될 때 실행할 코드를 여기에 추가
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    (selectedImageIndex != -1)
                        ? Color(0xFF8163E0)
                        : Color(0x408163E0), // 필요한대로 색상 변경 가능
                  ),
                  minimumSize: MaterialStateProperty.all(Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  '선택 완료',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: (selectedImageIndex != -1)
                        ? Colors.white
                        : Color(0x40ffffff),
                    // 선택되었을 때와 선택되지 않았을 때 색상 변경 fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0.0,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class SolutionPage extends StatelessWidget {
  final int selectedImageIndex;
  final List<String> adviceTexts = [
    "첫 번째 조언 텍스트",
    "두 번째 조언 텍스트",
    "세 번째 조언 텍스트",
    // 필요한 만큼 조언 텍스트를 추가할 수 있습니다.
  ];
  late final int randomIndex;
  late final String randomAdviceText;

  SolutionPage({
    required this.selectedImageIndex,
  }) {
    randomIndex = Random().nextInt(adviceTexts.length);
    randomAdviceText = adviceTexts[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // 상단의 appBar 제거
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/Rectangle 41.png', // 배경 이미지 파일 경로
                        width: 88, // 배경 이미지의 폭 설정
                        height: 88, // 배경 이미지의 높이 설정
                        fit: BoxFit.fill, // 배경 이미지 크기 조절 옵션
                      ),
                      Image.asset(
                        'assets/point/image_$selectedImageIndex.png',
                        width: 55, // 이미지의 폭 설정
                        height: 55, // 이미지의 높이 설정
                        fit: BoxFit.contain, // 이미지 크기 조절 옵션
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '첫 번째 답',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '답이 마음에 안 들면\n한 번 더 선택할 수 있어요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 60),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: ShapeDecoration(
                          color: Color(0x19555555),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            randomAdviceText,
                            // randomAdviceText를 사용하여 텍스트 동적으로 변경
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 84, // 화면 아래에서 20픽셀 띄움
            left: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.9) /
                2, // 화면 가로 중앙 정렬
            width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        PiecePage2(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
                // 버튼 클릭 시 수행할 동작 추가
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0x19555555)),
                // 색상 변경
                minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 0.86,
                  54,
                )),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.white, width: 0.3),
                  ),
                ),
              ),
              child: Text(
                '한 번 더 선택',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8163E0),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20, // 화면 아래에서 40픽셀 띄움
            left: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.9) /
                2, // 화면 가로 중앙 정렬
            width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF8163E0)),
                // 색상 변경
                minimumSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Text(
                '결정 완료',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SolutionPage2 extends StatelessWidget {
  final int selectedImageIndex;

  final List<String> adviceTexts = [
    "첫 번째 조언 텍스트",
    "두 번째 조언 텍스트",
    "세 번째 조언 텍스트",
    // 필요한 만큼 조언 텍스트를 추가할 수 있습니다.
  ];
  late final int randomIndex;
  late final String randomAdviceText;

  SolutionPage2({
    required this.selectedImageIndex,
  }) {
    randomIndex = Random().nextInt(adviceTexts.length);
    randomAdviceText = adviceTexts[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // 상단의 appBar 제거
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/Rectangle 41.png', // 배경 이미지 파일 경로
                        width: 88, // 배경 이미지의 폭 설정
                        height: 88, // 배경 이미지의 높이 설정
                        fit: BoxFit.fill, // 배경 이미지 크기 조절 옵션
                      ),
                      Image.asset(
                        'assets/point/image_$selectedImageIndex.png',
                        width: 55, // 이미지의 폭 설정
                        height: 55, // 이미지의 높이 설정
                        fit: BoxFit.contain, // 이미지 크기 조절 옵션
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '두 번째 답',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '같은 답이 나왔다면..\n운명의 답입니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 60),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: ShapeDecoration(
                          color: Color(0x19555555),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Text(
                            randomAdviceText,
                            // randomAdviceText를 사용하여 텍스트 동적으로 변경
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20, // 화면 아래에서 40픽셀 띄움
            left: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.9) /
                2, // 화면 가로 중앙 정렬
            width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF8163E0)),
                // 색상 변경
                minimumSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Text(
                '결정 완료',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  _TodayPageState createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  TextEditingController textController = TextEditingController();
  bool isButtonEnabled = false; // 버튼의 초기 상태는 비활성화
  late BannerAd myBanner;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadBannerAd(); // 광고를 로드하는 함수 호출
  }

  void loadBannerAd() {
    // 배너 광고
    myBanner = GoogleAdMob.loadBannerAd(); // 여기에 광고 ID를 설정
    myBanner.load();
  }


  // 사용자의 입력을 감지하고 버튼 상태를 업데이트
  void updateButtonState(String input) {
    if (input.isNotEmpty && int.tryParse(input) != null) {
      // 입력이 비어있지 않고 유효한 숫자인 경우 버튼 활성화
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      // 그렇지 않은 경우 버튼 비활성화
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text(''),
        backgroundColor: Color(0XFF151515),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Color(0xff151515),
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '원하는 숫자를 적고,\n오늘의 운세를 확인해봐요:)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 20,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '하루 1회 이용을 권장해요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 100),
                  Container(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent, // 컨테이너의 배경색을 투명하게 설정
                    ),
                    height: 50.0,
                    // 상자의 높이 설정
                    width: 200.0,
                    // 상자의 폭 설정
                    child: TextField(
                      controller: textController,
                      keyboardType: TextInputType.number,
                      onChanged: (input) {
                        updateButtonState(input);
                      },
                      decoration: InputDecoration(
                        hintText: '숫자를 입력해주세요.',
                        hintStyle: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF8163E0), // 커서가 위치한 경우의 밑줄 색상
                            width: 1.0, // 밑줄의 두께
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF555555), // 입력 전 밑줄 색상
                            width: 1.0, // 밑줄의 두께
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                      textAlign: TextAlign.center,
                      maxLength: 4,
                      buildCounter: (BuildContext context,
                          {required int currentLength,
                          required bool isFocused,
                          required int? maxLength}) {
                        return Container(
                          child: Text(
                            '$currentLength/$maxLength', // 현재 길이 및 최대 길이 표시
                            style: TextStyle(
                              color: Color(0xFF555555), // 텍스트 색상
                              fontSize: 14, // 텍스트 크기
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20, // 화면 아래에서 40픽셀 띄움
              left: (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.9) /
                  2, // 화면 가로 중앙 정렬
              width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
              child: ElevatedButton(
                onPressed: isButtonEnabled // 버튼이 활성화되는 경우에만 onPressed 콜백 실행
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TodayFortunePage(),
                          ),
                        );
                      }
                    : null, // 버튼이 비활성화되면 null로 설정
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(isButtonEnabled
                      ? Color(0xFF8163E0)
                      : Color(0x408163E0)), // 비활성화 상태일 때 배경색 변경
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width * 0.86,
                      54,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                child: Text(
                  '입력 완료',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fortune {
  final String description;

  Fortune(this.description);
}

List<Fortune> generateRandomFortunes() {
  List<Fortune> fortunes = [
    Fortune("오늘은 행운이 가득한 날입니다."),
    Fortune("주위의 사람들과 훌륭한 시간을 보낼 것입니다."),
    Fortune("건강과 행운이 함께할 것입니다."),
    Fortune("긍정적인 에너지를 가지고 있습니다."),
  ];

  return fortunes;
}

class TodayFortunePage extends StatelessWidget {
  final List<Fortune> fortunes = generateRandomFortunes();
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    final int randomIndex = random.nextInt(fortunes.length);
    final Fortune randomFortune = fortunes[randomIndex];

    return Scaffold(
      appBar: null, // 상단의 appBar 제거
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Stack(
                    alignment: Alignment.center,
                    children: [],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '오늘의 운세',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '언제나 좋은 하루를 응원합니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: ShapeDecoration(
                      color: Color(0x19555555),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 0),
                          Text(
                            randomFortune.description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20, // 화면 아래에서 40픽셀 띄움
            left: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).size.width * 0.9) /
                2, // 화면 가로 중앙 정렬
            width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF8163E0)),
                // 색상 변경
                minimumSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Text(
                '홈',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KnowledgeItem {
  final String title;
  final String content;

  KnowledgeItem({required this.title, required this.content});
}

class KnowledgePage extends StatefulWidget {
  @override
  _KnowledgePageState createState() => _KnowledgePageState();
}

class _KnowledgePageState extends State<KnowledgePage> {
  final List<KnowledgeItem> knowledgeItems = [
    KnowledgeItem(title: '11월 1일', content: 'Knowledge for day 1'),
    KnowledgeItem(
        title: '사람의 비밀',
        content:
            'Knowledge for day 1Knowledge for day 1Knowledge for day 1Knowledge for day 1'),
    KnowledgeItem(title: '11월 3일', content: 'Knowledge for day 1'),
    KnowledgeItem(title: '11월 4일', content: 'Knowledge for day 1'),
    KnowledgeItem(title: '11월 5일', content: 'Knowledge for day 1'),
    KnowledgeItem(title: '11월 7일', content: 'Knowledge for day 1'),
    // 나머지 29일 동안의 지식 항목 추가
  ];

  int currentDay = DateTime.now().day;
  KnowledgeItem? currentKnowledge;

  @override
  void initState() {
    super.initState();
    // 현재 날짜에 해당하는 지식 항목 가져오기
    if (currentDay <= knowledgeItems.length) {
      currentKnowledge = knowledgeItems[currentDay - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151515),
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text(''),
        backgroundColor: Color(0XFF151515),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (currentKnowledge != null)
              Column(
                children: [
                  SizedBox(height: 60),
                  Image.asset(
                    'assets/PerpleSpace_Logo.png',
                    width: 42,
                    height: 46,
                  ),
                  SizedBox(height: 40),
                  Text(
                    currentKnowledge!.title,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.0), // 좌우 여백 설정
                    child: Text(
                      currentKnowledge!.content,
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              )
            else
              Text('오늘은 준비된 지식이 없네요:('),
            Spacer(), // 버튼 위에 공간 추가
            Align(
              alignment: Alignment.bottomCenter, // 하단 중앙 정렬
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0), // 하단 간격 설정
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF8163E0)),
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width * 0.86,
                        54,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: Text(
                    '습득 완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleAdMob {
  // 배너 광고 인스턴스를 생성하고 로딩하기 위한 함수
  static BannerAd loadBannerAd() {
    // 배너 광고
    BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
// 내 리워드 광고 통합 APP ID
      /*
      크기(폭x높이)        설명               AdSize 상수
      -----------------------------------------------------------------------
      320x50	            표준 배너	          banner
      320x100	            대형 배너	          largeBanner
      320x250	            중간 직사각형	      mediumRectangle
      468x60	            전체 크기 배너	    fullBanner
      728x90	            리더보드	          leaderboard
      화면 폭x32|50|90	  스마트 배너	        getSmartBanner(Orientation) 사용
      */
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        // 광고가 성공적으로 수신된 경우
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // 광고 요청이 실패한 경우
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // 광고 요청 오류 시 광고를 삭제하여 리소스 확보
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // 광고가 화면을 덮는 오버레이를 열었을 때 호출
        // 사용자가 광고를 클릭하거나 특정 조건이 충족되어 광고가 표시 될 때 발생
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // 광고가 화면을 덮는 오버레이를 닫았을 때 호출
        // 사용자가 광고를 닫거나 자동으로 닫힐 때 발생
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // 광고가 노출 될 때 호출
        // 광고가 사용자에게 보여질 때 발생
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );
    return myBanner;
  }

  // 배너 광고를 화면에 보여주기 위한 함수, 파라미터로 로드된 배너 인스턴스 필요
  static Container showBannerAd(BannerAd myBanner) {
    // 광고 디스플레이
    // 배너 광고를 위젯으로 표시하기 위해 지원되는 광고를 사용하여 AdWidget 인스턴스화
    final Container adContainer = Container(
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: AdWidget(ad: myBanner),
    );

    return adContainer;
  }}