import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchBarWithBadge extends StatefulWidget {
  const SearchBarWithBadge({super.key});

  @override
  State<SearchBarWithBadge> createState() => _SearchBarWithBadgeState();
}

class _SearchBarWithBadgeState extends State<SearchBarWithBadge> {
  final TextEditingController _controller = TextEditingController();
  List<String> _badgeText = ['Apple'];

  @override
  void initState() {
    super.initState();
  }

  void _clearSearch() {
    setState(() {
      _controller.clear();
      _badgeText = ['Apple'];
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 8.0),
            child: Icon(
              PhosphorIcons.magnifyingGlass(),
              size: 24.0,
            ),
          ),
          // Badge
          ..._badgeText.map(
            (badge) => Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _badgeText.remove(badge);
                      });
                    },
                    child: Icon(
                      PhosphorIcons.xCircle(),
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
              ),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          // Clear button
          if (_controller.text.isNotEmpty)
            GestureDetector(
              onTap: _clearSearch,
              child: Container(
                margin: const EdgeInsets.only(right: 12.0),
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
