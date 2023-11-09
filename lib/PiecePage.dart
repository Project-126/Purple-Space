import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SolutionPage.dart';



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
