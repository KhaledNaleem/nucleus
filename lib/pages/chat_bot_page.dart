import 'package:flutter/material.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<_Msg> _messages = [
    _Msg('bot', "Hi! I'm your AI assistant. I can help you find the best products for your client's needs. What can I help you with today?"),
  ];
  final TextEditingController _ctrl = TextEditingController();
  bool _typing = false;

  void _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Msg('user', text));
      _ctrl.clear();
      _typing = true;
    });
    await Future<void>.delayed(const Duration(milliseconds: 600));
    setState(() {
      _messages.add(_Msg('bot', "Here's a sample response… (we'll connect the real backend next)."));
      _typing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final m = _messages[index];
                final isUser = m.role == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 480),
                    decoration: BoxDecoration(
                      color: isUser ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      m.text,
                      style: TextStyle(color: isUser ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_typing) const Align(alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.only(bottom: 8), child: Text('Assistant is typing…'))),
          Row(
            children: [
              Expanded(child: TextField(controller: _ctrl, decoration: const InputDecoration(hintText: 'Ask about products, SKUs, suppliers…'))),
              const SizedBox(width: 8),
              FilledButton(onPressed: _send, child: const Text('Send')),
            ],
          ),
        ],
      ),
    );
  }
}

class _Msg {
  final String role;
  final String text;
  _Msg(this.role, this.text);
}
