import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String initialStatus;
  final VoidCallback onCancel;

  const CartItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.initialStatus,
    required this.onCancel,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late String status;

  @override
  void initState() {
    super.initState();
    status = widget.initialStatus;
  }

  void updateStatus(String newStatus) {
    setState(() {
      status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'pending':
        statusColor = const Color(0xFFE4BA70);
        break;
      case 'accepted':
        statusColor = Colors.green;
        break;
      case 'rejected':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.black;
    }
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                width: 80,
                height: 80,
                child: Image.network(widget.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),

            // Second Section: Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Third Section: Cancel Button
            IconButton(
              icon: const Icon(Icons.cancel),
              color: Colors.red,
              onPressed: widget.onCancel,
            ),

            // Fourth Section: Status Container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const AplJobStatus());
}

class AplJobStatus extends StatelessWidget {
  const AplJobStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Job Applied',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          toolbarHeight: 70,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 5,
          centerTitle: true,
          backgroundColor: Color(0xFFE4BA70),
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ),
        body: ListView(
          children: [
            CartItem(
              imageUrl:
                  'https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              title: 'Pak Atong',
              description: 'RM9 per hour',
              initialStatus: 'pending',
              onCancel: () {
                // Handle cancel action
              },
            ),
            CartItem(
              imageUrl:
                  'https://images.unsplash.com/photo-1624555130581-1d9cca783bc0?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              title: 'Cengal cashier',
              description: 'RM7 per hour',
              initialStatus: 'accepted',
              onCancel: () {
                // Handle cancel action
              },
            ),
          ],
        ),
      ),
    );
  }
}
