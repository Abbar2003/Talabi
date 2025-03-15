import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_app_colors_constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  Widget _buildDrawerHeader() {
    return Column(
      children: [
        Container(
          padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[100],
          ),
          child: Image.asset(
            "assets/images/IMG-20221025-WA0039.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Text(
          "Mohammed Alabbar",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "0997219854 ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDrawerListItem(
      {required IconData leadingIcon,
      required String title,
      Widget? trailing,
      Color? color,
      Function()? onTap}) {
    return ListTile(
        leading: Icon(
          leadingIcon,
          color: color ?? MyAppColors.blue,
        ),
        title: Text(title),
        trailing: trailing ??
            Icon(
              Icons.arrow_right,
              color: MyAppColors.blue,
            ),
        onTap: onTap);
  }

  Widget _divider() {
    return Divider(
      height: 0,
      thickness: 1,
      color: Colors.grey,
      endIndent: 24,
      indent: 18,
    );
  }

  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  Widget _buildIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        color: MyAppColors.blue,
        size: 35,
      ),
    );
  }

  Widget _buildSocialMediaIcon() {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16,
      ),
      child: Row(
        children: [
          _buildIcon(FontAwesomeIcons.facebook,
              "https://www.facebook.com/share/14WkzN9GhW/"),
          SizedBox(
            width: 15,
          ),
          _buildIcon(FontAwesomeIcons.telegram, "https://t.me/Mh_abbar"),
          SizedBox(
            width: 20,
          ),
          _buildIcon(
              FontAwesomeIcons.whatsapp, "https://wa.me/qr/GA6KD5OIPPTYL1"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 300,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[100],),
              child: _buildDrawerHeader()),
          ),
          _buildDrawerListItem(leadingIcon: Icons.person, title: "My Profile"),
          _divider(),
          _buildDrawerListItem(
              leadingIcon: Icons.history, title: "Place history", onTap: () {}),
          _divider(),
          _buildDrawerListItem(leadingIcon: Icons.settings, title: "Settings"),
          _divider(),
          _buildDrawerListItem(leadingIcon: Icons.help, title: "help"),
          _divider(),
          _buildDrawerListItem(
            leadingIcon: Icons.logout,
            title: "logout",
            color: Colors.red,
            trailing: SizedBox(),
          ),
          _divider(),
          SizedBox(height: 180,),
          ListTile(
            leading: Text(
              "Follow us",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          _buildSocialMediaIcon(),
        ],
      ),
    );
  }
}
