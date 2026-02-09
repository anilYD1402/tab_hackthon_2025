import 'package:flutter/material.dart';

class Order {
  final int orderId;
  final String restaurant;
  final String date;
  final double amount;
  final String status; // 'Delivered', 'In Progress', 'Cancelled'
  final List<String> items;

  Order({
    required this.orderId,
    required this.restaurant,
    required this.date,
    required this.amount,
    required this.status,
    required this.items,
  });
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Order> orders;
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    orders = [
      Order(
        orderId: 1001,
        restaurant: 'Pizza Palace',
        date: '2 days ago',
        amount: 34.97,
        status: 'Delivered',
        items: ['Margherita Pizza x2', 'Garlic Bread'],
      ),
      Order(
        orderId: 1002,
        restaurant: 'Burger Haven',
        date: '1 week ago',
        amount: 19.98,
        status: 'Delivered',
        items: ['Cheese Burger x2'],
      ),
      Order(
        orderId: 1003,
        restaurant: 'Sushi Supreme',
        date: '2 weeks ago',
        amount: 44.97,
        status: 'Delivered',
        items: ['California Rolls', 'Spicy Tuna Roll', 'Sake'],
      ),
      Order(
        orderId: 1004,
        restaurant: 'Curry House',
        date: '3 weeks ago',
        amount: 28.50,
        status: 'Delivered',
        items: ['Butter Chicken', 'Naan', 'Mango Lassi'],
      ),
      Order(
        orderId: 1005,
        restaurant: 'Taco Fiesta',
        date: '1 month ago',
        amount: 24.99,
        status: 'Delivered',
        items: ['Tacos x3', 'Guacamole', 'Salsa'],
      ),
    ];
  }

  List<Order> getFilteredOrders() {
    if (selectedFilter == 'All') {
      return orders;
    }
    return orders.where((order) => order.status == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Filter Chips
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 10,
                children:
                    ['All', 'Delivered', 'In Progress', 'Cancelled'].map((
                      filter,
                    ) {
                      return FilterChip(
                        label: Text(filter),
                        selected: selectedFilter == filter,
                        onSelected: (selected) {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                      );
                    }).toList(),
              ),
            ),

            // Orders List
            if (getFilteredOrders().isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No orders found',
                      style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                    ),
                  ],
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: getFilteredOrders().length,
                itemBuilder: (context, index) {
                  return _buildOrderCard(getFilteredOrders()[index]);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurant,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Order #${order.orderId}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                _buildStatusBadge(order.status),
              ],
            ),
            const SizedBox(height: 15),

            // Date and Amount
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(
                  '\$${order.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Items
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Items:',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...order.items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        '• $item',
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(height: 15),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Order details for #${order.orderId}'),
                      ),
                    );
                  },
                  child: const Text('View Details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reorder from ${order.restaurant}'),
                      ),
                    );
                  },
                  child: const Text('Reorder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case 'Delivered':
        backgroundColor = Colors.green[100]!;
        textColor = Colors.green[700]!;
        break;
      case 'In Progress':
        backgroundColor = Colors.blue[100]!;
        textColor = Colors.blue[700]!;
        break;
      case 'Cancelled':
        backgroundColor = Colors.red[100]!;
        textColor = Colors.red[700]!;
        break;
      default:
        backgroundColor = Colors.grey[100]!;
        textColor = Colors.grey[700]!;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
