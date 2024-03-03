import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import '../../../model/api/chung_khoan/chung_khoan_info.dart';

Widget danhMucSelectedListView(BuildContext context) {
  return Selector<AppChungKhoanProvider, List<Data>>(
    selector: (_, p) => p.chungKhoanDataSort,
    shouldRebuild: (p, n) => true,
    builder: (context, danhMucs, child) {
      if (danhMucs.isEmpty) {
        return Container();
      } else {
        return Expanded(
            child: ListView.builder(
                itemCount: danhMucs.length,
                itemBuilder: (context, index) {
                  final data = danhMucs[index];
                  return Container(
                    margin: const EdgeInsets.only(top: 0,left: 15,right: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data.symbol?.toUpperCase() ?? '',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,height: 1.5),
                                      ),
                                      Text(
                                        ' | ${data.exchange?.toUpperCase() ?? ''}',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    data.fullname!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                  children: [
                                    Text(
                                      data.closePrice!.toStringAsFixed(2),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,height: 1.5),
                                    ),
                                    Text(
                                      data.totalTrading.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,color: Colors.grey),
                                    ),
                                  ]),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                  children: [
                                    Text(
                                      data.change! < 0
                                          ? data.change.toString()
                                          : '+${data.change.toString()}',
                                      style: TextStyle(
                                          color: data.change! < 0
                                              ? Colors.red
                                              : const Color.fromRGBO(
                                              35, 134, 25, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${data.changePercent!.toStringAsFixed(3)}%',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 0.3,
                          height: 20,
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      ],
                    ),
                  );
                }));
      }
    },
  );
}
