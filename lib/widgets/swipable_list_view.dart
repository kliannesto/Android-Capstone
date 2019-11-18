// class SwipeableListView extends StatefulWidget {
//   SwipeableListView({Key key}) : super(key: key);

//   @override
//   _SwipeableListViewState createState() => _SwipeableListViewState();
// }

// class _SwipeableListViewState extends State<SwipeableListView> {
//   var list = List<String>.generate(20, (count) => 'Items $count');
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//        child: Scaffold(
//          appBar: AppBar(
//            title:Text("Swipe List View"),
//          ),
//          body: ListView.builder(
//            itemCount: list.length,
//            itemBuilder: (context, index){
//              return Dissmisable(
//                direction: DismissDirection.endToStart,
//                child: ListTile(
//                  title: Text(list[index]),
//                ),
//                key: Key(list[index]),
//                onDismissed: (item)
//                {
//                  setState(() {
//                    list.removeAt(index);
//                  });
//                },
//                background: Container(
//                  color: Colors.red,
//                  child: Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Icon(
//                      Icons.delete,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//              );
//            }
//          ),
//        )
//     );
//   }
// }