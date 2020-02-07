import 'package:flutter/material.dart'; 
class Episode5 extends StatefulWidget {
  @override
  _Episode5State createState() => _Episode5State();
}

class _Episode5State extends State<Episode5> { 
  Widget bodyData() => DataTable( 
    onSelectAll: (b){}, 
    sortColumnIndex: 1, 
    sortAscending: true, 
    columns: <DataColumn>[ 
      DataColumn(
      label: Text("First Name"), 
      numeric: false,  
      // sort by b
      onSort: (i, b){ 
        print("$i $b"); 
        setState((){ 
          names.sort((a, b) => a.firstName.compareTo(b.firstName));
        });
      }, 
      tooltip: "To display first name of the name"
      ), 
      DataColumn( 
        label: Text("Last Name"), 
        numeric: false, 
        onSort: (i, b){ 
          print("$i $b"); 
          setState((){ 
            names.sort((a,b)=> a.lastName.compareTo(b.lastName));
          });
        }, 
        tooltip: "To display last name of the name"
      )
    ], 
    rows: names.map(  
      // define file 
      (name) => DataRow( 
        cells: [ 
          DataCell( 
            Text(name.firstName), 
            showEditIcon: false, 
            placeholder: false
          ), 
          DataCell( 
            Text(name.lastName), 
            showEditIcon:false, 
            placeholder: false
          )
        ]
      )
    ).toList()
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Episode 5 - Data Table")
      ),  
      // set widget 
      body: Container( 
        child: bodyData(),
      ),
    );
  }
} 
class Name{ 
  String firstName; 
  String lastName; 
  Name({this.firstName, this.lastName});
}  
// define constructor
var names = <Name>[ 
  Name(firstName: "Pawan", lastName: "Kumar"), 
  Name(firstName: "Aakash", lastName: "Tewari"), 
  Name(firstName: "Rohan", lastName: "Signh"),
];