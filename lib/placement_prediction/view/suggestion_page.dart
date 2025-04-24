import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  final List<String> suggestions;

  const SuggestionPage({
    super.key,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestions'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: suggestions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(suggestions[index]),
          );
        },
      ),
    );
  }
}
