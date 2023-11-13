import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'TodayFortunePage.dart';
import 'main.dart';




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
                  SizedBox(height: 10),
                  Text(
                    '원하는 숫자를 적고,\n오늘의 운세를 확인해봐요.',
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
                  SizedBox(height: 140),
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
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