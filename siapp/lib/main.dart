import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    new MaterialApp(
      title: "SI app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        brightness: Brightness.dark,
        accentColor: Colors.indigoAccent,
      ),
      // color: Colors.purple,
      home: Homepage(),
    )
  );
}
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _formkey = GlobalKey<FormState>();
  var _curr = ['Rupees','Doller','Pound',];
  TextEditingController _principle = TextEditingController();
  TextEditingController _rate = TextEditingController();
  TextEditingController _term = TextEditingController();
 var _currentItemSelected;
   String sum = "";
  //TextStyle textStyle =Theme.of(context).textTheme.title;
  @override
  void initState(){
    super.initState();
    _currentItemSelected = _curr[0];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Calculate Simple Interest"),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: Form(
        key: _formkey,
       child: Center(
         child: new ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageAssets(),
            TextFormField(
               keyboardType: TextInputType.number,
               controller: _principle,
              //  validator:(String value){
              //    if (value.isEmpty){
              //      return "Enter valid Principle";
              //    }
                validator: (value) {
                if (value == null || value.isEmpty) {
                   return 'Please enter some  Principle';
                 }
                 return null;
                   },
               decoration: InputDecoration(
                icon: Icon(Icons.money),
                labelText: 'Principle',
                hintText: "Enter Principle Amount",
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15.0)
               )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                   return 'Please enter Rate!';
                 }
                return null;
              },
              controller: _rate,
               keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money,),
                labelText: 'Rate of interest',
                hintText: "In Percentage",
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(15.0)
               )
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 4.0, bottom: 4.0)),
            new Row(
              children: [
                Expanded( 
                  child:TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                   return 'Please enter Time!';
                    }
                   return null;
                  },
                    controller: _term,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      icon: Icon(Icons.timelapse),
                      labelText: "Term",
                      hintText: "Time in year",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                    ),
                  )

                  ),
                  Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0,top:10.0)),
                  Expanded(
                    child:DropdownButton<String>(
                   items: _curr.map((String value){
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text(value),
                       
                       );
                   }).toList(),
                   value: _currentItemSelected,
                   onChanged: (String newValueSelected){
                      _onDropDownItemSelected (newValueSelected);
                   },
                   ),
                  )

              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10.0, bottom: 10.0)),
            new Row(
              children: [
                Expanded(
                  child: RaisedButton(onPressed: (){
                    setState(() {
                      if(_formkey.currentState.validate()){
                      this.sum=  _calculateTotalReturn();
                      }
                    });
                  },
                  child: Text("Calculate", style: TextStyle(fontSize: 25.0)),
                  color: Colors.purple,
                  ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5.0, right: 5.0)),
                  Expanded(
                  child: RaisedButton(onPressed: (){
                    setState(() {
                      _resetbitton();
                    });
                  },
                  child: Text("Reset", style: TextStyle(fontSize: 25.0)),
                  color: Colors.black12,
                  ),
                  ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Center(
              child: Text(this.sum, style: TextStyle(fontSize: 30.0),),
            ),
            
          ],
        )
        ),
      ),
    );
  }
  Widget imageAssets(){
    // AssetImage assetImage = AssetImage('./image/Assets/money.png');
    // Image image = Image(image: assetImage, width: 125, height: 125);
    Image image = Image.asset('image/Assets/money.png', width: 170, height: 170);
    return Container(child: image,margin: EdgeInsets.all(20.0),);
  }
  String totalAmount( String a, String b, String c){
    var newsum = (double.parse(a ) * double.parse(b) * double.parse(c) / 100);
    return "the Total Amount is : $newsum";

  }
  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
  String _calculateTotalReturn(){
    double pri = double.parse(_principle.text);
    double ra = double.parse(_rate.text);
    double te = double.parse(_term.text);
    double totalAmount = pri + (pri * ra * te)/100;
    String result= "Total Amount is : $totalAmount $_currentItemSelected";
    return result;
  }
  void _resetbitton(){
    _principle.text = '';
    _rate.text = '';
    _term.text = '';
    _currentItemSelected = _curr[0];

  }

}