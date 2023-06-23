import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:base_module/app/modules/station/controllers/station_controller.dart';
import '../../../../imageLoader/image_loader.dart';

class StationPage extends GetView<StationController> {
  const StationPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          children: [
            _buildBanner(),
            _buildStationContent(),
            _buildGridViewContent()
          ],
        ),
      )),
    );
  }

  // 顶部Banner
  Widget _buildBanner() {
    return Container(
        margin: const EdgeInsets.only(top: 15),
        height: 196,
        child: Swiper(
          itemCount: controller.entity?.value?.pictures!.length ?? 0,
          autoplay: true,
          pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: RectSwiperPaginationBuilder(
                  size: Size(20, 10),
                  color: Colors.red,
                  activeColor: Colors.black)),
          itemBuilder: (context, index) {
            return ImageLoader(
                imageUrl:
                    controller.entity?.value!.pictures![index].fileUrl ?? '',
                localImageUrl:
                    'assets/images/placeholder/station_banner_parking_default@3x.png');
          },
        ));
  }

  // 中间网点信息
  Widget _buildStationContent() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 244, 244, 244),
            width: 12.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/station/station_detail_icon_parking@2x.png',
                    width: 16,
                    height: 16,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'lhy_test_top',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 11),
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                    color: Colors.blue,
                    child: const Text(
                      '地面',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: const [
                  SizedBox(width: 20),
                  Text('辽宁省沈阳市浑南区五三街道沈阳市不干胶长'),
                ],
              )
            ],
          ),
          Column(
            children: const [Icon(Icons.home), Text('0.2km')],
          ),
        ],
      ),
    );
  }

  // 底部九宫格
  Widget _buildGridViewContent() {
    final List<String> gridViewLabels = [
      '待处理工单',
      '捷工单',
      '紧急工单',
      '收费时长',
      '可用车位',
      '超停车位',
      '取车费用',
      '还车费用',
      '超停费用',
      '支持超停',
      '超停收费',
      '预警时长'
    ];
    return Container(
      height: 340,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 每行显示的网格数量
            // mainAxisSpacing: 10.0, // 主轴方向的间距
            // crossAxisSpacing: 10.0, // 横轴方向的间距
            childAspectRatio: 1.7, // 子项的宽高比例
          ),
          itemCount: gridViewLabels.length, // 网格项的总数
          itemBuilder: (BuildContext context, int index) {
            // 构建每个网格项的内容
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, 238, 238, 238),
                          width: 0.5))),
              child: Column(
                children: <Widget>[
                  Text(
                    gridViewLabels[index],
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 179, 179, 179)),
                  ),
                  const SizedBox(height: 12),
                  const Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: '100',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      TextSpan(text: '/100', style: TextStyle(fontSize: 12))
                    ]),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
