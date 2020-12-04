import 'package:riadissnapback_store/helpers/db.helpers.dart';
import 'package:riadissnapback_store/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:riadissnapback_store/ui/home.dart';
import 'package:sqflite/sqflite.dart';
import 'entryform.dart';

class PlanShop extends StatefulWidget {
  @override
  _PlanShopState createState() => _PlanShopState();
}

class _PlanShopState extends State<PlanShop> {
  DbHelper _dbHelper = DbHelper();
  int _count = 0;
  List<Contact> _contactList;
  @override
  Widget build(BuildContext context) {
    if (_contactList == null) {
      _contactList = List<Contact>();
    }
    return Scaffold(
       appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: Text('What Do You Want To Buy')),
        actions: [
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){}
          ),
        ],
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          child: Icon(Icons.edit, color: Colors.white),
          tooltip: 'Tambah Pengingat',
          onPressed: () async {
            var contact = await navigateToEntryForm(context, null);
            if (contact != null) addContact(contact);
          }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<Contact> navigateToEntryForm(
      BuildContext context, Contact contact) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return EntryForm(contact);
        },
      ),
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.note),
            ),
            title: Text(
              this._contactList[index].name,
              style: textStyle,
            ),
            subtitle: Text(
              this._contactList[index].phone,
            ),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                deleteContact(_contactList[index]);
              },
            ),
            onTap: () async {
              var contact =
                  await navigateToEntryForm(context, this._contactList[index]);
              if (contact != null) editContact(contact);
            },
          ),
        );
      },
    );
  }

  void addContact(Contact object) async {
    int result = await _dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editContact(Contact object) async {
    int result = await _dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(Contact object) async {
    int result = await _dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = _dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = _dbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this._contactList = contactList;
          this._count = contactList.length;
        });
      });
    });
  }
}
