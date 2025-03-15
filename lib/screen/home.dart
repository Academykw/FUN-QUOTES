
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_quote/quotes/quote_class.dart';
import 'package:fun_quote/quotes/quote_list.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentQuoteIndex = 0;
  Quote _currentQuote = quotes[0];
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentDate = DateTime.now();
    _updateQuote();
  }

  void _updateQuote({bool nextDay = false}){
    setState(() {
      if(nextDay){
        _currentDate = _currentDate.add(Duration(days: 1));
      }
        _currentQuoteIndex = _currentDate.day % quotes.length;

      _currentQuote = quotes[_currentQuoteIndex];
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ddf.jpeg'),
          fit: BoxFit.cover,),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(_currentQuote.text,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ), textAlign: TextAlign.center,),
            ),

            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Share.share('${_currentQuote.text}n- ${_currentQuote.author}');
                },
                    icon: Icon(Icons.share, size: 48.0,)
                ),

                SizedBox(width: 30,),
                IconButton(
                  onPressed: (){
                    Clipboard.setData(ClipboardData(text:
                    '${_currentQuote.text}n- ${_currentQuote.author}'));
                  },
                  icon: Icon(Icons.copy, size: 48.0,),
                ),

                IconButton(onPressed: (){

                    _updateQuote(nextDay:true);


                },
                    icon: Icon(Icons.navigate_next,size: 48.0,)),
              ],
            ),


          ],
        ),
      ),

    );
  }
}
