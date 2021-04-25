import 'package:flutter/material.dart';

class worldWidepannel extends StatelessWidget {
  final Map worlddata;

  const worldWidepannel({Key key, this.worlddata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 2, crossAxisCount: 2),
        children: [
          statuspannel(
            title: 'COMFORM',
            pannelcolor: Colors.red[100],
            textcolor: Colors.red,
            count:worlddata['cases'].toString(),
          ),
          statuspannel(
            title: 'ACTIVE',
            pannelcolor: Colors.blue[100],
            textcolor: Colors.blue,
            count:worlddata['active'].toString(),
          ),
          statuspannel(
            title: 'RECOVER',
            pannelcolor: Colors.green[100],
            textcolor: Colors.green,
            count:worlddata['recovered'].toString(),
          ),
          statuspannel(
            title: 'DEATH',
            pannelcolor: Colors.grey[100],
            textcolor: Colors.grey,
            count:worlddata['deaths'].toString(),
          ),
        ],
        
        ),
    );
  }
}
class statuspannel extends StatelessWidget {
  final Color pannelcolor;
  final Color textcolor;
  final String title;
  final String count;

  const statuspannel({Key key, this.pannelcolor, this.textcolor, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80,
      width: width/2,
      color: pannelcolor,
     // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
    //  decoration: BoxDecoration(shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(this.title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: this.textcolor),), Text(this.count),
        ],
      ),
    );
  }
}