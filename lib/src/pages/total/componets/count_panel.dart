import 'package:flutter/material.dart';

class CountPanel extends StatelessWidget {
  const CountPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "일일 발생 현황",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [CountCard(), CountCard(), CountCard()],
          ),
        ],
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  const CountCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Text(
            "확진자",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Row(
            children: const [
              Icon(
                Icons.arrow_drop_up,
                color: Colors.redAccent,
                size: 40,
              ),
              Text(
                "24,000",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
