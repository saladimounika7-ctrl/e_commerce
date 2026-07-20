import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final VoidCallback? onSearchTap;
  final VoidCallback? onLensTap;
  final VoidCallback? onMicTap;
  final VoidCallback? onQrTap;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    this.onSearchTap,
    this.onLensTap,
    this.onMicTap,
    this.onQrTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onSearchTap,
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xff9FD8E5),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),

              const Icon(
                Icons.search,
                size: 24,
                color: Colors.black87,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  hintText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: hintText == "Search or ask a question" ||
                            hintText == "Listening..."
                        ? Colors.grey
                        : Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(
                width: 36,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    size: 23,
                    color: Colors.black87,
                  ),
                  onPressed: onLensTap,
                ),
              ),

              SizedBox(
                width: 36,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.mic_none,
                    size: 23,
                    color: Colors.black87,
                  ),
                  onPressed: onMicTap,
                ),
              ),

              SizedBox(
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.qr_code_scanner,
                    size: 23,
                    color: Colors.black87,
                  ),
                  onPressed: onQrTap,
                ),
              ),

              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}