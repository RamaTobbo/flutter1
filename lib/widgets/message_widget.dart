import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool fromAi;

  const MessageWidget({super.key, required this.text, this.fromAi = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: fromAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .8),
            decoration: BoxDecoration(
                color: fromAi ? Colors.grey : Colors.amber,
                borderRadius: BorderRadius.circular(8).copyWith(
                    bottomLeft: fromAi ? const Radius.circular(0) : null,
                    bottomRight: !fromAi ? const Radius.circular(0) : null)),
            padding: const EdgeInsets.all(12),
            child: Text(text),
          ),
          if (fromAi) ...[
            SizedBox(height: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                children: [
                  const Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 22,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.thumb_down_alt_outlined,
                    size: 22,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.copy_outlined,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'copy',
                    style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  )
                ],
              ),
            )
          ]
        ],
      ),
    );
  }
}
