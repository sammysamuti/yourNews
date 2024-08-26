import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_news/screens/auth/login_page.dart';
import 'package:get_storage/get_storage.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;

  const DrawerWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: CustomDrawer(
        profileImagePath: 'assets/images/mark.png',
        onSignOut: () => handleSignOut(context),
      ),
    );
  }

  void handleSignOut(BuildContext context) {
    final GetStorage storage = GetStorage();
    try {
      storage.remove('loggedIn');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully signed out')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }
}

class CustomDrawer extends StatefulWidget {
  final String profileImagePath;
  final VoidCallback onSignOut;

  CustomDrawer({
    this.profileImagePath = 'assets/images/mark.png',
    required this.onSignOut,
  });

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _currentIndex = 0;
  String username = '';
  String email = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() {
    final GetStorage storage = GetStorage();
    email = storage.read('email') ?? '';
    final parts = email.split('@');
    if (parts.isNotEmpty) {
      setState(() {
        username = parts[0];
      });
    }
  }

  Future<ImageProvider> _loadImage(String path) async {
    try {
      final ByteData data = await rootBundle.load(path);
      return MemoryImage(data.buffer.asUint8List());
    } catch (e) {
      return AssetImage('assets/icons/user.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: mediaQuery.size.width * 0.05),
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder<ImageProvider>(
                  future: _loadImage(widget.profileImagePath),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        !snapshot.hasData) {
                      return CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/icons/user.png'),
                      );
                    } else {
                      return CircleAvatar(
                        radius: 25,
                        backgroundImage: snapshot.data!,
                      );
                    }
                  },
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/home.png',
                      width: 25, height: 25),
                  text: 'Home',
                  onTap: () {},
                ),
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/search.png',
                      width: 25, height: 25),
                  text: 'Search',
                  onTap: () {},
                ),
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/notification.png',
                      width: 25, height: 25),
                  text: 'Notifications',
                  onTap: () {},
                ),
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/settings.png',
                      width: 25, height: 25),
                  text: 'Settings',
                  onTap: () {},
                ),
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/service.png',
                      width: 25, height: 25),
                  text: 'Support',
                  onTap: () {},
                ),
                CustomDrawerItem(
                  icon: Image.asset('assets/icons/info-sign.png',
                      width: 25, height: 25),
                  text: 'About us',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomDrawerItem(
              icon:
                  Image.asset('assets/icons/logout.png', width: 25, height: 25),
              text: 'Sign out',
              onTap: widget.onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerItem extends StatelessWidget {
  final Image icon;
  final String text;
  final GestureTapCallback onTap;

  CustomDrawerItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
