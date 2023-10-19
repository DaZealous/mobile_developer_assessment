import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildTransactionLoader(count) {
  return Shimmer.fromColors(
    baseColor: Colors.blue.withOpacity(0.3),
    highlightColor: Colors.grey.withOpacity(0.9),
    enabled: true,
    child: ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (context, index) {
        return _buildLoadingContainer();
      },
    ),
  );
}

Widget _buildLoadingContainer() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.blue.withOpacity(0.3),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 15, 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.3),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Loading',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}