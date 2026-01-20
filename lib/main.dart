import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CoffeeShopApp());
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFFC67C4E),
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFC67C4E),
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Coffee Model
class Coffee {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final List<String> sizes;
  final List<String> addOns;
  bool isFavorite;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.sizes = const ['S', 'M', 'L'],
    this.addOns = const ['Sugar', 'Cream', 'Caramel'],
    this.isFavorite = false,
  });
}

// Mock Data
List<Coffee> coffeeList = [
  Coffee(
    id: '1',
    name: 'Cappuccino',
    description: 'With steamed milk and foam',
    price: 4.20,
    rating: 4.5,
    imageUrl: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400&h=300&fit=crop',
  ),
  Coffee(
    id: '2',
    name: 'Café Latte',
    description: 'With Chocolate',
    price: 3.50,
    rating: 4.2,
    imageUrl: 'https://images.unsplash.com/photo-1561047029-3000c68339ca?w=400&h=300&fit=crop',
  ),
  Coffee(
    id: '3',
    name: 'Macchiato',
    description: 'With Cream',
    price: 4.80,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1511537190424-bbbab87ac5eb?w=400&h=300&fit=crop',
  ),
  Coffee(
    id: '4',
    name: 'Espresso',
    description: 'Strong black coffee',
    price: 2.50,
    rating: 4.3,
    imageUrl: 'https://images.unsplash.com/photo-1498804103079-a6351b050096?w=400&h=300&fit=crop',
  ),
  Coffee(
    id: '5',
    name: 'Mocha',
    description: 'With chocolate syrup',
    price: 5.00,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop',
  ),
  Coffee(
    id: '6',
    name: 'Americano',
    description: 'Hot water with espresso',
    price: 3.00,
    rating: 4.0,
    imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=300&fit=crop',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  int _cartCount = 2;
  int _selectedTab = 0;
  int _currentBanner = 0;
  bool _isDarkMode = false;

  final List<String> categories = [
    'All',
    'Cappuccino',
    'Espresso',
    'Latte',
    'Americano',
    'Mocha'
  ];

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      coffeeList[index].isFavorite = !coffeeList[index].isFavorite;
    });
  }

  void _addToCart() {
    setState(() {
      _cartCount++;
    });
  }

  void _showCoffeeDetails(BuildContext context, Coffee coffee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoffeeDetailScreen(
          coffee: coffee,
          onAddToCart: _addToCart,
        ),
      ),
    );
  }

  Widget _buildBadge({required Widget child, required int count}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            top: -8,
            right: -8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildPageIndicator(int currentPage, int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Container(
          width: currentPage == index ? 20 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredCoffees = _selectedCategory == 0
        ? coffeeList
        : coffeeList.where((coffee) => coffee.name.contains(categories[_selectedCategory])).toList();

    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.location_on, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    'New York, USA',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: _buildBadge(
                child: const Icon(Icons.shopping_cart_outlined),
                count: _cartCount,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Coffee Lover! ☕',
                      style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Find your coffee...',
                      hintStyle: GoogleFonts.poppins(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ),

              // Promo Banners
              Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          _currentBanner = index;
                        });
                      },
                      children: [
                        _buildPromoCard(
                          'Buy 1 Get 1 Free',
                          'On all espresso drinks',
                          'Valid until Oct 30',
                          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=800&h=400&fit=crop',
                        ),
                        _buildPromoCard(
                          '50% OFF',
                          'Weekend special offer',
                          'Only Saturday & Sunday',
                          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800&h=400&fit=crop',
                        ),
                        _buildPromoCard(
                          'Free Delivery',
                          'On orders above \$20',
                          'All day today',
                          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=800&h=400&fit=crop',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildPageIndicator(_currentBanner, 3),
                ],
              ),

              const SizedBox(height: 20),

              // Categories
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedCategory == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: _selectedCategory == index
                                ? Colors.transparent
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          categories[index],
                          style: GoogleFonts.poppins(
                            color: _selectedCategory == index
                                ? Colors.white
                                : Theme.of(context).textTheme.bodyLarge?.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Coffee Grid
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredCoffees.length,
                  itemBuilder: (context, index) {
                    final coffee = filteredCoffees[index];
                    return GestureDetector(
                      onTap: () => _showCoffeeDetails(context, coffee),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Coffee Image
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    coffee.imageUrl,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                // Coffee Details
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        coffee.name,
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        coffee.description,
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${coffee.price.toStringAsFixed(2)}',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.star, color: Colors.amber, size: 16),
                                              const SizedBox(width: 4),
                                              Text(
                                                coffee.rating.toString(),
                                                style: GoogleFonts.poppins(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Favorite Button
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () => _toggleFavorite(index),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    coffee.isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: coffee.isFavorite ? Colors.red : Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -5),
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home', 0),
                  _buildNavItem(Icons.local_cafe, 'Menu', 1),
                  const SizedBox(width: 40),
                  _buildNavItem(Icons.favorite, 'Favorites', 2),
                  _buildNavItem(Icons.person, 'Profile', 3),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          child: const Icon(Icons.shopping_bag, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildPromoCard(String title, String subtitle, String valid, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                valid,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedTab == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 10,
              color: _selectedTab == index
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

// Coffee Detail Screen
class CoffeeDetailScreen extends StatefulWidget {
  final Coffee coffee;
  final VoidCallback onAddToCart;

  const CoffeeDetailScreen({
    super.key,
    required this.coffee,
    required this.onAddToCart,
  });

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> {
  String _selectedSize = 'M';
  int _quantity = 1;
  final List<bool> _selectedAddOns = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.coffee.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: Icon(
                      widget.coffee.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.coffee.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: () {
                      // Toggle favorite
                    },
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.coffee.name,
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              widget.coffee.rating.toString(),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    widget.coffee.description,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Size Selection
                  Text(
                    'Size',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: widget.coffee.sizes.map((size) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(size),
                            selected: _selectedSize == size,
                            onSelected: (selected) {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            backgroundColor: Colors.grey.shade100,
                            selectedColor: Theme.of(context).primaryColor,
                            labelStyle: GoogleFonts.poppins(
                              color: _selectedSize == size ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Add-ons
                  Text(
                    'Add-ons',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(widget.coffee.addOns.length, (index) {
                      return FilterChip(
                        label: Text(widget.coffee.addOns[index]),
                        selected: _selectedAddOns[index],
                        onSelected: (selected) {
                          setState(() {
                            _selectedAddOns[index] = selected;
                          });
                        },
                        checkmarkColor: Colors.white,
                        selectedColor: Theme.of(context).primaryColor,
                        labelStyle: GoogleFonts.poppins(
                          color: _selectedAddOns[index] ? Colors.white : Colors.black,
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // Quantity Selector
                  Row(
                    children: [
                      Text(
                        'Quantity',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (_quantity > 1) _quantity--;
                                });
                              },
                            ),
                            Text(
                              '$_quantity',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Price and Add to Cart Button
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: GoogleFonts.poppins(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              '\$${(widget.coffee.price * _quantity).toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            widget.onAddToCart();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${widget.coffee.name} added to cart!'),
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 18,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.shopping_cart, color: Colors.white),
                              const SizedBox(width: 8),
                              Text(
                                'Add to Cart',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}