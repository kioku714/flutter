import 'package:flutter/material.dart';

class VehicleDetailPage extends StatefulWidget {
  VehicleDetailPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehicleDetailPage createState() => _VehicleDetailPage();
}

class _VehicleDetailPage extends State<VehicleDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'W 모터스 라이칸 하이퍼스포트',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '한화 약 38억 4천만 원',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        '라이칸 하이퍼스포트는 두바이에 거점하고 있는 W 모터스에서 탄생한 첫 번째 완성 차량입니다. '
        '전 세계 단 7대밖에 존재하지 않는 슈퍼카인데요. '
        '포르쉐 튜닝 스페셜리스트 RUF가 개발한 3.7리터 수평대향 6기통 트윈터보 엔진에서 최고출력 791마력, 최대토크 97.9kg.m을 발휘하고, 제로백은 2.8초를 기록합니다. '
        '라이칸 하이퍼스포트는 두바이에 거점하고 있는 W 모터스에서 탄생한 첫 번째 완성 차량입니다. '
        '전 세계 단 7대밖에 존재하지 않는 슈퍼카인데요. '
        '포르쉐 튜닝 스페셜리스트 RUF가 개발한 3.7리터 수평대향 6기통 트윈터보 엔진에서 최고출력 791마력, 최대토크 97.9kg.m을 발휘하고, 제로백은 2.8초를 기록합니다. '
        '라이칸 하이퍼스포트는 두바이에 거점하고 있는 W 모터스에서 탄생한 첫 번째 완성 차량입니다. '
        '전 세계 단 7대밖에 존재하지 않는 슈퍼카인데요. '
        '포르쉐 튜닝 스페셜리스트 RUF가 개발한 3.7리터 수평대향 6기통 트윈터보 엔진에서 최고출력 791마력, 최대토크 97.9kg.m을 발휘하고, 제로백은 2.8초를 기록합니다. '
        '라이칸 하이퍼스포트는 두바이에 거점하고 있는 W 모터스에서 탄생한 첫 번째 완성 차량입니다. '
        '전 세계 단 7대밖에 존재하지 않는 슈퍼카인데요. '
        '포르쉐 튜닝 스페셜리스트 RUF가 개발한 3.7리터 수평대향 6기통 트윈터보 엔진에서 최고출력 791마력, 최대토크 97.9kg.m을 발휘하고, 제로백은 2.8초를 기록합니다. ',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://img1.daumcdn.net/thumb/R720x0/?fname=https%3A%2F%2Ft1.daumcdn.net%2Fliveboard%2FKCCAUTO%2F30f49582ea6d4a598561c1986efcf2ec.JPG',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
