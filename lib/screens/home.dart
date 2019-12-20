import 'package:provider/provider.dart';
import 'package:storeapp/provider/user_provider.dart';
import 'package:storeapp/screens/product_details.dart';
import 'package:storeapp/widgets/custom_app_bar.dart';
import 'package:storeapp/widgets/featured_products.dart';
import 'package:storeapp/widgets/product_card.dart';
import 'package:storeapp/widgets/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
//           Custom App bar
            CustomAppBar(),

//          Search Text field
            Search(),

//            featured products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Featured products')),
                ),
              ],
            ),
            FeaturedProducts(),

//          recent products
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),
                ),
              ],
            ),
            ProductCard(
              brand: 'ZaraBrand',
              name: 'Gamal Blazer',
              price: 56.00,
              onSale: true,
              picture: '',
            ),
            ProductCard(
              brand: 'GamalBrand',
              name: 'Sendal Blazer',
              price: 24.00,
              onSale: true,
              picture: '',
            ),
            ProductCard(
              brand: 'MohamedBrand',
              name: 'Blazer elSendo',
              price: 43.00,
              onSale: true,
              picture: '',
            ),
          ],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            Header
            new UserAccountsDrawerHeader(
              accountName: Text('Mohamed Khaled'),
              accountEmail: Text('mohamedkkhaledfcih589@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red,
              ),
            ),
//            Body

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => new ProductDetails()));},
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.red,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                user.signOut();
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit,color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
