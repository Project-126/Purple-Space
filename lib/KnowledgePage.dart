import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main.dart';


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
    KnowledgeItem(title: '클레오파트라', content: '클레오파트라는 피라미드보다 현대에 더 가깝습니다. 처음 피라미드가 지어진 것은 고대 이집트인 클레오파트라보다 더 먼 시기에 해당합니다.'),
    KnowledgeItem(title: '달', content: '달은 지구에 가까이 다가가고 있습니다. 달은 천연 위성으로 지구에 점점 가까워지고 있으며 약 50억 년 후에는 더 이상 지구 주위를 돌지 않게 될 것입니다.'),
    KnowledgeItem(title: '진공상태', content: '진공에서는 소리가 들리지 않습니다. 소리는 공기나 다른 매체가 필요한데, 진공에서는 이러한 매체가 없기 때문에 아무런 소리도 들리지 않습니다.'),
    KnowledgeItem(title: '오징어', content: '오징어는 세포 배양을 통해 무한히 자기 재생할 수 있습니다. 만약 오징어의 팔을 잘라내면, 이들은 새로운 팔을 다시 자라낼 수 있습니다.'),
    KnowledgeItem(title: '꿀벌', content: '꿀벌은 세상 지도를 가지고 있습니다. 꿀벌은 집에서 꽃밭으로 가는 길을 다른 꿀벌들에게 전달하기 위해 춤을 사용하여 지도 정보를 공유합니다.'),
    KnowledgeItem(title: '남극의 ATM', content: '남극에는 ATM이 없습니다. 남극에는 금융 서비스가 거의 없어서 현금이 필요한 사람들은 미리 준비해야 합니다.'),
    KnowledgeItem(title: '지구의 대기', content: '지구의 대기는 실제로 투명합니다. 대기 중의 기체들로 인해 푸른 하늘이 보이지만, 공기 자체는 무색과 투명합니다.'),
    KnowledgeItem(title: '곰팡이', content: '곰팡이는 식물이 아닙니다. 곰팡이는 동물과 식물 중 어디에도 속하지 않는 별도의 생물 군집입니다.'),
    KnowledgeItem(title: '얼음', content: '얼음은 물보다 가볍습니다. 얼음은 물에 비해 조밀성이 낮기 때문에 얼음이 물 위에 뜨게 됩니다.'),
    KnowledgeItem(title: '펭귄', content: '펭귄은 날 수 있습니다. 많은 종류의 펭귄은 바다에서 날 수 있으며, 비행 능력을 갖춘 새 중에서 가장 먼 거리를 날아다닙니다.'),
    KnowledgeItem(title: '카메라', content: '카메라 렌즈는 뒤집어져 있습니다. 카메라 렌즈는 모든 것을 거꾸로 찍고, 카메라의 내부에서 이미지를 다시 뒤집습니다.'),
    KnowledgeItem(title: '토끼섬', content: '일본에서는 토끼섬이 있습니다. 일본의 "오가 위 섬"은 수천 마리의 토끼로 가득 차 있어, 사람들이 토끼와 교류하러 찾아갑니다.'),
    KnowledgeItem(title: '검은 구름', content: '검은 구름의 내부에 번개가 있습니다. 검은 구름의 가장 어두운 부분에서 번개가 발생합니다.'),
    KnowledgeItem(title: '치킨', content: '치킨은 한국에서 가장 인기 있는 음식 중 하나입니다. 한국은 1인당 연간 치킨 소비량이 약 14kg으로, 세계 1위입니다. 치킨은 한국인의 일상에서 빠질 수 없는 음식이며, 한국의 대표적인 음식으로 자리 잡았습니다.'),
    KnowledgeItem(title: '바나나', content: '바나나 나무는 나무가 아닙니다. 실제로는 대규모인 여러 식물의 집합체로, 몸통이 나무와 같은 구조를 가지고 있지 않습니다.'),
    KnowledgeItem(title: '플라밍고', content: '플라밍고는 회색으로 태어나지만 붉게 변합니다. 플라밍고는 연어 빛깔의 작은 새로 태어나며, 다이어트가 바뀌면서 붉게 변합니다.'),
    KnowledgeItem(title: '산호', content: '산호는 동물입니다. 산호는 바다의 모습과 생태계를 형성하는데 참여하는 해양 동물입니다. 거의 동식물로 생각되지만 실제로 동물 계열에 속합니다.'),
    KnowledgeItem(title: '초콜릿', content: '초콜릿은 소매치기를 통해 만들어진 것입니다. 초콜릿은 처음에는 음료수로 사용되었으며, 이를 상업적으로 생산한 것은 소매치기들이었습니다.'),
    KnowledgeItem(title: '매운 맛', content: '매운 맛은 어떻게 감지될까요? 매운 맛은 "캡사이신"이라는 화학물질로 인해 인간의 미각 세포에 영향을 미칩니다.'),
    KnowledgeItem(title: '라면', content: '우리가 잠은 자는 동안 일정량의 수분이 몸에서 배출되는데 '),
    KnowledgeItem(title: '뇌', content: '우리의 뇌는 약 1000억 개의 신경세포로 구성되어 있습니다. 이 신경세포들은 서로 연결되어 정보를 전달하고, 우리의 생각, 감정, 기억을 담당합니다.'),
    KnowledgeItem(title: '코', content: '우리의 코는 약 1만 가지의 냄새를 구별할 수 있습니다. 이 냄새들은 우리의 기억과 감정에 영향을 미칩니다.'),
    KnowledgeItem(title: '눈', content: '우리의 눈은 초당 약 3만 개의 이미지를 처리합니다. 이 이미지들은 우리의 뇌에 전달되어, 우리가 사물을 볼 수 있게 합니다.'),
    KnowledgeItem(title: '음식', content: '음식을 먹을 때 한 번에 씹는 횟수를 늘리면, 음식이 입에서 더 잘 부서지고, 소화에 필요한 효소가 더 많이 분비됩니다. 또한, 음식을 오래 씹으면 포만감이 더 빨리 느껴져, 과식을 예방할 수 있습니다.'),
    KnowledgeItem(title: '머리카락', content: '사람의 머리카락은 하루에 약 50~100개 정도 빠집니다. 이는 정상적인 현상으로, 새로운 머리카락이 자라기 때문입니다.'),
    KnowledgeItem(title: '딸꾹질', content: '딸꾹질은 횡격막과 늑간근의 반복적인 수축과 이완으로 인해 발생하는 발작적인 호흡 중단을 말합니다. 딸꾹질은 흔히 1분에서 2분 정도 지속되며, 심한 경우 몇 시간 이상 지속되기도 합니다.'),
    KnowledgeItem(title: '라면', content: '라면은 한국에서 발명된 음식입니다. 1953년, 일본의 한 라면 회사가 한국에 진출하면서 라면을 처음 선보였습니다. 이후 한국인들은 라면을 널리 즐기게 되었고, 한국은 라면 소비량 세계 1위 국가가 되었습니다.'),
    KnowledgeItem(title: '물', content: '물을 자주 마시면 피부가 좋아집니다. 하루에 8잔 정도 마시는 것이 좋습니다.'),
    KnowledgeItem(title: '손톱', content: '사람의 손톱은 약 6개월마다 자랍니다. 손톱은 우리 몸의 손상을 방지하고, 감각을 느끼는 데 도움을 줍니다. '),
    KnowledgeItem(title: '펭귄', content: '펭귄의 DNA는 우리의 DNA와 유사합니다. 서식 환경과 진화로 인해 약간의 변이가 있지만, 펭귄의 DNA는 우리와 상당히 유사합니다.'),

    // 나머지 29일 동안의 지식 항목 추가
  ];
  TextEditingController textController = TextEditingController();


  int currentDay = DateTime.now().day;
  KnowledgeItem? currentKnowledge;

  late BannerAd myBanner;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // 현재 날짜에 해당하는 지식 항목 가져오기
    if (currentDay <= knowledgeItems.length) {
      currentKnowledge = knowledgeItems[currentDay - 1];

    }
    loadBannerAd(); // 광고를 로드하는 함수 호출

  }

  void loadBannerAd() {
    // 배너 광고
    myBanner = GoogleAdMob.loadBannerAd(); // 여기에 광고 ID를 설정
    myBanner.load();
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
                  SizedBox(height: 20),
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
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
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
                  SizedBox(height: 140),
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
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
                    Navigator.pushReplacement(
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
            ),
          ],
        ),
      ),
    );
  }
}