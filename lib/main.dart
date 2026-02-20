import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CoffeeShopApp(),
    ),
  );
}

// Theme Provider
class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

// Light Theme
class AppLightTheme {
  static const Color primaryColor = Color(0xFF6F4E37);
  static const Color secondaryColor = Color(0xFFE6B89C);
  static const Color tertiaryColor = Color(0xFFA67B5B);
  static const Color backgroundColor = Color(0xFFFDF6E9);
  static const Color surfaceColor = Colors.white;
  static const Color textColor = Color(0xFF2C2C2C);
  static const Color subTextColor = Color(0xFF757575);
  static const Color cardColor = Colors.white;
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color dividerColor = Color(0xFFE0E0E0);
}

// Dark Theme
class AppDarkTheme {
  static const Color primaryColor = Color(0xFF8B6B4D);
  static const Color secondaryColor = Color(0xFFC59378);
  static const Color tertiaryColor = Color(0xFF8B5A2B);
  static const Color backgroundColor = Color(0xFF1A1A1A);
  static const Color surfaceColor = Color(0xFF2C2C2C);
  static const Color textColor = Color(0xFFF5F5F5);
  static const Color subTextColor = Color(0xFFB0B0B0);
  static const Color cardColor = Color(0xFF2C2C2C);
  static const Color errorColor = Color(0xFFEF5350);
  static const Color successColor = Color(0xFF66BB6A);
  static const Color dividerColor = Color(0xFF424242);
}

class CoffeeShopApp extends StatelessWidget {
  const CoffeeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Brew Haven',
          theme: _buildLightTheme(),
          darkTheme: _buildDarkTheme(),
          themeMode: themeProvider.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppLightTheme.primaryColor,
      colorScheme: const ColorScheme.light(
        primary: AppLightTheme.primaryColor,
        secondary: AppLightTheme.secondaryColor,
        tertiary: AppLightTheme.tertiaryColor,
        surface: AppLightTheme.surfaceColor,
        background: AppLightTheme.backgroundColor,
        error: AppLightTheme.errorColor,
      ),
      scaffoldBackgroundColor: AppLightTheme.backgroundColor,
      cardColor: AppLightTheme.cardColor,
      dividerColor: AppLightTheme.dividerColor,

      // Text Theme
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          displayLarge: TextStyle(color: AppLightTheme.textColor),
          displayMedium: TextStyle(color: AppLightTheme.textColor),
          displaySmall: TextStyle(color: AppLightTheme.textColor),
          headlineLarge: TextStyle(color: AppLightTheme.textColor),
          headlineMedium: TextStyle(color: AppLightTheme.textColor),
          headlineSmall: TextStyle(color: AppLightTheme.textColor),
          titleLarge: TextStyle(color: AppLightTheme.textColor),
          titleMedium: TextStyle(color: AppLightTheme.textColor),
          titleSmall: TextStyle(color: AppLightTheme.textColor),
          bodyLarge: TextStyle(color: AppLightTheme.textColor),
          bodyMedium: TextStyle(color: AppLightTheme.textColor),
          bodySmall: TextStyle(color: AppLightTheme.subTextColor),
          labelLarge: TextStyle(color: AppLightTheme.textColor),
          labelMedium: TextStyle(color: AppLightTheme.textColor),
          labelSmall: TextStyle(color: AppLightTheme.subTextColor),
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppLightTheme.surfaceColor,
        foregroundColor: AppLightTheme.textColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppLightTheme.textColor,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppLightTheme.surfaceColor,
        selectedItemColor: AppLightTheme.primaryColor,
        unselectedItemColor: AppLightTheme.subTextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppLightTheme.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppLightTheme.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppLightTheme.primaryColor,
          side: const BorderSide(color: AppLightTheme.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppLightTheme.primaryColor,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppLightTheme.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppLightTheme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppLightTheme.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppLightTheme.errorColor),
        ),
        labelStyle: const TextStyle(color: AppLightTheme.subTextColor),
        hintStyle: const TextStyle(color: AppLightTheme.subTextColor),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppLightTheme.primaryColor;
          }
          return AppLightTheme.subTextColor;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppLightTheme.primaryColor;
          }
          return AppLightTheme.subTextColor;
        }),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppLightTheme.primaryColor;
          }
          return AppLightTheme.subTextColor;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppLightTheme.primaryColor.withOpacity(0.5);
          }
          return AppLightTheme.subTextColor.withOpacity(0.5);
        }),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppLightTheme.primaryColor,
        inactiveTrackColor: AppLightTheme.subTextColor.withOpacity(0.3),
        thumbColor: AppLightTheme.primaryColor,
        overlayColor: AppLightTheme.primaryColor.withOpacity(0.2),
        valueIndicatorColor: AppLightTheme.primaryColor,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppLightTheme.primaryColor,
        unselectedLabelColor: AppLightTheme.subTextColor,
        indicatorColor: AppLightTheme.primaryColor,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppLightTheme.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppLightTheme.textColor,
        ),
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: AppLightTheme.subTextColor,
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppLightTheme.surfaceColor,
        contentTextStyle: GoogleFonts.poppins(
          color: AppLightTheme.textColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        textStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
        ),
        decoration: BoxDecoration(
          color: AppLightTheme.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppDarkTheme.primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: AppDarkTheme.primaryColor,
        secondary: AppDarkTheme.secondaryColor,
        tertiary: AppDarkTheme.tertiaryColor,
        surface: AppDarkTheme.surfaceColor,
        background: AppDarkTheme.backgroundColor,
        error: AppDarkTheme.errorColor,
      ),
      scaffoldBackgroundColor: AppDarkTheme.backgroundColor,
      cardColor: AppDarkTheme.cardColor,
      dividerColor: AppDarkTheme.dividerColor,

      // Text Theme
      textTheme: GoogleFonts.poppinsTextTheme(
        const TextTheme(
          displayLarge: TextStyle(color: AppDarkTheme.textColor),
          displayMedium: TextStyle(color: AppDarkTheme.textColor),
          displaySmall: TextStyle(color: AppDarkTheme.textColor),
          headlineLarge: TextStyle(color: AppDarkTheme.textColor),
          headlineMedium: TextStyle(color: AppDarkTheme.textColor),
          headlineSmall: TextStyle(color: AppDarkTheme.textColor),
          titleLarge: TextStyle(color: AppDarkTheme.textColor),
          titleMedium: TextStyle(color: AppDarkTheme.textColor),
          titleSmall: TextStyle(color: AppDarkTheme.textColor),
          bodyLarge: TextStyle(color: AppDarkTheme.textColor),
          bodyMedium: TextStyle(color: AppDarkTheme.textColor),
          bodySmall: TextStyle(color: AppDarkTheme.subTextColor),
          labelLarge: TextStyle(color: AppDarkTheme.textColor),
          labelMedium: TextStyle(color: AppDarkTheme.textColor),
          labelSmall: TextStyle(color: AppDarkTheme.subTextColor),
        ),
      ),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppDarkTheme.surfaceColor,
        foregroundColor: AppDarkTheme.textColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppDarkTheme.textColor,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppDarkTheme.surfaceColor,
        selectedItemColor: AppDarkTheme.primaryColor,
        unselectedItemColor: AppDarkTheme.subTextColor,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppDarkTheme.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppDarkTheme.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppDarkTheme.primaryColor,
          side: const BorderSide(color: AppDarkTheme.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppDarkTheme.primaryColor,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppDarkTheme.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppDarkTheme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppDarkTheme.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppDarkTheme.errorColor),
        ),
        labelStyle: const TextStyle(color: AppDarkTheme.subTextColor),
        hintStyle: const TextStyle(color: AppDarkTheme.subTextColor),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppDarkTheme.primaryColor;
          }
          return AppDarkTheme.subTextColor;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppDarkTheme.primaryColor;
          }
          return AppDarkTheme.subTextColor;
        }),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppDarkTheme.primaryColor;
          }
          return AppDarkTheme.subTextColor;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppDarkTheme.primaryColor.withOpacity(0.5);
          }
          return AppDarkTheme.subTextColor.withOpacity(0.5);
        }),
      ),

      // Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: AppDarkTheme.primaryColor,
        inactiveTrackColor: AppDarkTheme.subTextColor.withOpacity(0.3),
        thumbColor: AppDarkTheme.primaryColor,
        overlayColor: AppDarkTheme.primaryColor.withOpacity(0.2),
        valueIndicatorColor: AppDarkTheme.primaryColor,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: AppDarkTheme.primaryColor,
        unselectedLabelColor: AppDarkTheme.subTextColor,
        indicatorColor: AppDarkTheme.primaryColor,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 14,
        ),
      ),

      // Dialog Theme
      dialogTheme: DialogThemeData(
        backgroundColor: AppDarkTheme.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppDarkTheme.textColor,
        ),
        contentTextStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: AppDarkTheme.subTextColor,
        ),
      ),

      // Snackbar Theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppDarkTheme.surfaceColor,
        contentTextStyle: GoogleFonts.poppins(
          color: AppDarkTheme.textColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Tooltip Theme
      tooltipTheme: TooltipThemeData(
        textStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 12,
        ),
        decoration: BoxDecoration(
          color: AppDarkTheme.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

// Enhanced Coffee Model
class Coffee {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imageUrl;
  final String category;
  final List<String> sizes;
  final Map<String, double> addOns;
  final int preparationTime;
  final bool isPopular;
  bool isFavorite;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.category,
    this.sizes = const ['Small', 'Medium', 'Large'],
    this.addOns = const {
      'Extra Shot': 0.50,
      'Vanilla Syrup': 0.75,
      'Caramel': 0.75,
      'Whipped Cream': 0.50,
      'Almond Milk': 1.00,
    },
    this.preparationTime = 5,
    this.isPopular = false,
    this.isFavorite = false,
  });

  Coffee copyWith({
    bool? isFavorite,
  }) {
    return Coffee(
      id: id,
      name: name,
      description: description,
      price: price,
      rating: rating,
      imageUrl: imageUrl,
      category: category,
      sizes: sizes,
      addOns: addOns,
      preparationTime: preparationTime,
      isPopular: isPopular,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

// Enhanced Coffee Data
List<Coffee> coffeeList = [
  Coffee(
    id: '1',
    name: 'Caramel Macchiato',
    description: 'Espresso with vanilla syrup, steamed milk, and caramel drizzle',
    price: 5.50,
    rating: 4.8,
    imageUrl: 'https://images.unsplash.com/photo-1485808191679-5f86510681a2?w=400&h=300&fit=crop',
    category: 'Specialty',
    isPopular: true,
  ),
  Coffee(
    id: '2',
    name: 'Hazelnut Latte',
    description: 'Smooth espresso with hazelnut syrup and creamy milk',
    price: 4.75,
    rating: 4.6,
    imageUrl: 'https://images.unsplash.com/photo-1570968915860-54d5c301fa9f?w=400&h=300&fit=crop',
    category: 'Latte',
    isPopular: true,
  ),
  Coffee(
    id: '3',
    name: 'Mint Mocha',
    description: 'Rich chocolate with refreshing mint and espresso',
    price: 5.25,
    rating: 4.7,
    imageUrl: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop',
    category: 'Specialty',
  ),
  Coffee(
    id: '4',
    name: 'Cinnamon Dolce',
    description: 'Sweet cinnamon syrup with espresso and frothy milk',
    price: 4.95,
    rating: 4.5,
    imageUrl: 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=400&h=300&fit=crop',
    category: 'Specialty',
    isPopular: true,
  ),
  Coffee(
    id: '5',
    name: 'Cold Brew',
    description: 'Smooth, cold-steeped coffee served over ice',
    price: 4.25,
    rating: 4.4,
    imageUrl: 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=400&h=300&fit=crop',
    category: 'Cold Brew',
  ),
  Coffee(
    id: '6',
    name: 'Pumpkin Spice',
    description: 'Seasonal favorite with pumpkin and warm spices',
    price: 5.75,
    rating: 4.9,
    imageUrl: 'https://images.unsplash.com/photo-1572442388796-11668a67e53d?w=400&h=300&fit=crop',
    category: 'Seasonal',
    isPopular: true,
  ),
];

// Cart Item Model
class CartItem {
  final Coffee coffee;
  final String size;
  final Map<String, double> selectedAddOns;
  final int quantity;

  CartItem({
    required this.coffee,
    required this.size,
    required this.selectedAddOns,
    required this.quantity,
  });

  double get totalPrice {
    double addOnsPrice = selectedAddOns.values.fold(0, (sum, price) => sum + price);
    return (coffee.price + addOnsPrice) * quantity;
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _controller.forward();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF6F4E37),
              const Color(0xFFA67B5B),
              const Color(0xFFE6B89C),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.local_cafe,
                    size: 60,
                    color: Color(0xFF6F4E37),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Brew Haven',
                style: GoogleFonts.pacifico(
                  fontSize: 40,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Perfect Brew Awaits',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final List<CartItem> _cartItems = [];
  late TabController _tabController;

  final List<String> _categories = [
    'All',
    'Specialty',
    'Latte',
    'Cold Brew',
    'Seasonal',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addToCart(CartItem item) {
    setState(() {
      _cartItems.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${item.coffee.name} added to cart!',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF6F4E37),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _toggleFavorite(String coffeeId) {
    setState(() {
      final index = coffeeList.indexWhere((c) => c.id == coffeeId);
      if (index != -1) {
        coffeeList[index] = coffeeList[index].copyWith(
          isFavorite: !coffeeList[index].isFavorite,
        );
      }
    });
  }

  int get _cartItemCount => _cartItems.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildHomeTab(),
          _buildMenuTab(),
          _buildOrdersTab(),
          _buildProfileTab(context),
        ],
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
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
            backgroundColor: Theme.of(context).cardColor,
            selectedItemColor: const Color(0xFF6F4E37),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                activeIcon: Icon(Icons.menu_book),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag_outlined),
                    if (_cartItemCount > 0)
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
                            _cartItemCount.toString(),
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
                ),
                activeIcon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_bag),
                    if (_cartItemCount > 0)
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
                            _cartItemCount.toString(),
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
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          floating: true,
          pinned: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF6F4E37),
                    const Color(0xFFA67B5B).withOpacity(0.8),
                  ],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/avatar.jpg'),
                            radius: 30,
                             ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back,',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Coffee Lover!',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  '4.8',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(color: theme.textTheme.bodyLarge?.color),
                    decoration: InputDecoration(
                      hintText: 'Find your perfect coffee...',
                      hintStyle: GoogleFonts.poppins(color: theme.textTheme.bodySmall?.color),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF6F4E37)),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6F4E37),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 20),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Promo Banner
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6F4E37), Color(0xFFE6B89C)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        top: -20,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Happy Hour!',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '50% OFF on all Cold Brews',
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Use Code: COLD50',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFF6F4E37),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => _selectedIndex = 1);
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF6F4E37),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryCard('All', Icons.coffee),
                      _buildCategoryCard('Specialty', Icons.emoji_events),
                      _buildCategoryCard('Latte', Icons.local_cafe),
                      _buildCategoryCard('Cold Brew', Icons.ac_unit),
                      _buildCategoryCard('Seasonal', Icons.calendar_today),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Popular Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Now 🔥',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF6F4E37),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeList.where((c) => c.isPopular).length,
                    itemBuilder: (context, index) {
                      final coffee = coffeeList.where((c) => c.isPopular).toList()[index];
                      return _buildPopularCard(coffee);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    final theme = Theme.of(context);

    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF6F4E37).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF6F4E37)),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCard(Coffee coffee) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(
              coffee: coffee,
              onAddToCart: (item) => _addToCart(item),
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
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
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => _toggleFavorite(coffee.id),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        coffee.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: coffee.isFavorite ? Colors.red : Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffee.name,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        coffee.rating.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.timer, color: theme.textTheme.bodySmall?.color, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${coffee.preparationTime} min',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${coffee.price.toStringAsFixed(2)}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6F4E37),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6F4E37),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTab() {
    return DefaultTabController(
      length: _categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Our Menu',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).cardColor,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: const Color(0xFF6F4E37),
            unselectedLabelColor: Theme.of(context).textTheme.bodySmall?.color,
            indicatorColor: const Color(0xFF6F4E37),
            tabs: _categories.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: _categories.map((category) {
            final filteredCoffees = category == 'All'
                ? coffeeList
                : coffeeList.where((c) => c.category == category).toList();

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredCoffees.length,
              itemBuilder: (context, index) {
                final coffee = filteredCoffees[index];
                return _buildMenuItem(coffee);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMenuItem(Coffee coffee) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CoffeeDetailScreen(
              coffee: coffee,
              onAddToCart: (item) => _addToCart(item),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                coffee.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          coffee.name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: theme.textTheme.bodyLarge?.color,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _toggleFavorite(coffee.id),
                        child: Icon(
                          coffee.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: coffee.isFavorite ? Colors.red : theme.textTheme.bodySmall?.color,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    coffee.description,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: theme.textTheme.bodySmall?.color,
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
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6F4E37),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6F4E37).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 10),
                            const SizedBox(width: 2),
                            Text(
                              coffee.rating.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: theme.textTheme.bodyLarge?.color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersTab() {
    final theme = Theme.of(context);

    if (_cartItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6F4E37).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 60,
                color: Color(0xFF6F4E37),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your cart is empty',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Add some delicious coffee to get started!',
              style: GoogleFonts.poppins(
                color: theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() => _selectedIndex = 1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6F4E37),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Browse Menu',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _cartItems.length,
      itemBuilder: (context, index) {
        final item = _cartItems[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.coffee.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.coffee.name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item.size} • Qty: ${item.quantity}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      if (item.selectedAddOns.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            item.selectedAddOns.keys.join(', '),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: const Color(0xFF6F4E37),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${item.totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF6F4E37),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Preparing',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileTab(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.primaryColor, width: 2),
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpg') as ImageProvider,
                  radius: 30,
                )
              ),
              const SizedBox(height: 10),
              Text(
                'Nahida',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Coffee Enthusiast',
                style: GoogleFonts.poppins(
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        _buildProfileTile(
          context,
          Icons.card_giftcard,
          'Rewards',
          '80 points',
        ),
        _buildProfileTile(
          context,
          Icons.favorite,
          'Favorites',
          '${coffeeList.where((c) => c.isFavorite).length} items',
        ),
        _buildProfileTile(
          context,
          Icons.history,
          'Order History',
          '8 orders',
        ),
        _buildProfileTile(
          context,
          Icons.payment,
          'Payment Methods',
          '2 cards',
        ),
        _buildProfileTile(
          context,
          Icons.location_on,
          'Addresses',
          '3 addresses',
        ),

        // Theme Settings Tile
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThemeSettingsScreen(),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: theme.primaryColor,
                  size: 20,
                ),
              ),
              title: const Text('Theme'),
              subtitle: Text(themeProvider.isDarkMode ? 'Dark Mode' : 'Light Mode'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        _buildProfileTile(
          context,
          Icons.settings,
          'Settings',
          '',
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout'),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileTile(BuildContext context, IconData icon, String title, String subtitle) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: theme.primaryColor, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(color: theme.textTheme.bodyLarge?.color),
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
          subtitle,
          style: TextStyle(color: theme.textTheme.bodySmall?.color),
        )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.textTheme.bodySmall?.color,
        ),
        onTap: () {},
      ),
    );
  }
}

// Theme Settings Screen
class ThemeSettingsScreen extends StatelessWidget {
  const ThemeSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Preview Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Theme Preview
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildThemePreview(
                      context,
                      'Light',
                      Icons.light_mode,
                      !isDarkMode,
                          () => themeProvider.setThemeMode(ThemeMode.light),
                    ),
                    _buildThemePreview(
                      context,
                      'Dark',
                      Icons.dark_mode,
                      isDarkMode,
                          () => themeProvider.setThemeMode(ThemeMode.dark),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // System Default Option
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.settings_suggest,
                      color: theme.primaryColor,
                    ),
                  ),
                  title: const Text('Follow System Settings'),
                  subtitle: const Text('Auto-switch based on device theme'),
                  trailing: Radio<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: themeProvider.themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Theme Features
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Theme Preview',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 20),

                // Color Preview
                Row(
                  children: [
                    _buildColorChip(theme.primaryColor, 'Primary'),
                    const SizedBox(width: 8),
                    _buildColorChip(theme.colorScheme.secondary, 'Secondary'),
                    const SizedBox(width: 8),
                    _buildColorChip(theme.colorScheme.tertiary, 'Tertiary'),
                    const SizedBox(width: 8),
                    _buildColorChip(theme.scaffoldBackgroundColor, 'Background'),
                  ],
                ),
                const SizedBox(height: 20),

                // Text Preview
                Text(
                  'Sample Text',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'This is how text will appear in the selected theme',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Secondary text example',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                const SizedBox(height: 20),

                // Button Preview
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: null,
                        child: const Text('Elevated'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: null,
                        child: const Text('Outlined'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: null,
                        child: const Text('Text Button'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Input Preview
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Sample input field',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 20),

                // Checkbox and Switch Preview
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const SizedBox(width: 8),
                    Switch(value: true, onChanged: (value) {}),
                    const SizedBox(width: 8),
                    Radio(value: true, groupValue: true, onChanged: (value) {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemePreview(
      BuildContext context,
      String label,
      IconData icon,
      bool isSelected,
      VoidCallback onTap,
      ) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? theme.primaryColor : theme.dividerColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? theme.primaryColor : theme.dividerColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? Colors.white : theme.textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.poppins(
                color: isSelected ? theme.primaryColor : theme.textTheme.bodySmall?.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorChip(Color color, String label) {
    return Tooltip(
      message: label,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}

// Enhanced Coffee Detail Screen
class CoffeeDetailScreen extends StatefulWidget {
  final Coffee coffee;
  final Function(CartItem) onAddToCart;

  const CoffeeDetailScreen({
    super.key,
    required this.coffee,
    required this.onAddToCart,
  });

  @override
  State<CoffeeDetailScreen> createState() => _CoffeeDetailScreenState();
}

class _CoffeeDetailScreenState extends State<CoffeeDetailScreen> with TickerProviderStateMixin {
  String _selectedSize = 'Medium';
  int _quantity = 1;
  final Map<String, bool> _selectedAddOns = {};
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    for (var addOn in widget.coffee.addOns.keys) {
      _selectedAddOns[addOn] = false;
    }

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double get totalPrice {
    double addOnsPrice = 0;
    _selectedAddOns.forEach((addOn, selected) {
      if (selected) {
        addOnsPrice += widget.coffee.addOns[addOn] ?? 0;
      }
    });
    return (widget.coffee.price + addOnsPrice) * _quantity;
  }

  Map<String, double> get selectedAddOnsWithPrices {
    return Map.fromEntries(
        _selectedAddOns.entries
            .where((entry) => entry.value)
            .map((entry) => MapEntry(entry.key, widget.coffee.addOns[entry.key] ?? 0))
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  Hero(
                    tag: 'coffee_${widget.coffee.id}',
                    child: Image.network(
                      widget.coffee.imageUrl,
                      fit: BoxFit.cover,
                    ),
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
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
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
            ],
          ),
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _animation,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.coffee.name,
                            style: GoogleFonts.poppins(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                widget.coffee.rating.toString(),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Category and Time
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: theme.textTheme.bodySmall?.color?.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            widget.coffee.category,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 16, color: theme.textTheme.bodySmall?.color),
                            const SizedBox(width: 4),
                            Text(
                              '${widget.coffee.preparationTime} mins',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Description
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.coffee.description,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: theme.textTheme.bodySmall?.color,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Size Selection
                    Text(
                      'Select Size',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: widget.coffee.sizes.map((size) {
                        bool isSelected = _selectedSize == size;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? theme.primaryColor : theme.cardColor,
                                borderRadius: BorderRadius.circular(15),
                                border: isSelected ? null : Border.all(color: theme.dividerColor),
                              ),
                              child: Text(
                                size,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
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
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...widget.coffee.addOns.keys.map((addOn) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          color: theme.textTheme.bodySmall?.color?.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CheckboxListTile(
                          title: Text(
                            addOn,
                            style: GoogleFonts.poppins(
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                          subtitle: Text(
                            '+\$${widget.coffee.addOns[addOn]?.toStringAsFixed(2)}',
                            style: GoogleFonts.poppins(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: _selectedAddOns[addOn],
                          onChanged: (value) {
                            setState(() {
                              _selectedAddOns[addOn] = value ?? false;
                            });
                          },
                          activeColor: theme.primaryColor,
                          checkColor: Colors.white,
                        ),
                      );
                    }).toList(),

                    const SizedBox(height: 24),

                    // Quantity Selector
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: theme.textTheme.bodySmall?.color?.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quantity',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyLarge?.color,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.remove, size: 20),
                                  onPressed: () {
                                    setState(() {
                                      if (_quantity > 1) _quantity--;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 40,
                                child: Text(
                                  '$_quantity',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: theme.textTheme.bodyLarge?.color,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: theme.cardColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add, size: 20),
                                  onPressed: () {
                                    setState(() {
                                      _quantity++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Add to Cart Button
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final cartItem = CartItem(
                            coffee: widget.coffee,
                            size: _selectedSize,
                            selectedAddOns: selectedAddOnsWithPrices,
                            quantity: _quantity,
                          );
                          widget.onAddToCart(cartItem);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.shopping_cart, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(
                              'Add to Cart • \$${totalPrice.toStringAsFixed(2)}',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}