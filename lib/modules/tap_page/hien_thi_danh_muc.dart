import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/provider/app_provider.dart';

class HienThiDanhMuc extends StatefulWidget {
  const HienThiDanhMuc({super.key});

  @override
  State<HienThiDanhMuc> createState() => _HienThiDanhMucState();
}

class _HienThiDanhMucState extends State<HienThiDanhMuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Hien thi danh muc"),
          Selector<AppChungKhoanProvider, List>(
            selector: (_, p) => p.getDanhMucBox(),
            shouldRebuild: (p, n) => true,
            builder: (context, danhMucs, child) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: danhMucs.length,
                      itemBuilder: (context, index) {
                        final data = danhMucs[index].cophieus;
                        return Container(
                          margin: const EdgeInsets.only(left: 16, right: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Text(
                                                data.symbol?.toUpperCase() ??
                                                    '',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                              const VerticalDivider(
                                                indent: 6,
                                                endIndent: 6,
                                                color: Color.fromRGBO(
                                                    230, 230, 230, 1),
                                                width: 8,
                                              ),
                                              Text(
                                                data.exchange?.toUpperCase() ??
                                                    '',
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          data.fullname!.length > 35
                                              ? data.fullname!.substring(0, 35)
                                              : data.fullname ?? '',
                                          style: const TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.4),
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 80,
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            data.closePrice!.toStringAsFixed(2),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            data.totalTrading.toString(),
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ]),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: 80,
                                    child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
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
                                                fontWeight: FontWeight.w500),
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
            },
          )
        ],
      ),
    );
  }
}
