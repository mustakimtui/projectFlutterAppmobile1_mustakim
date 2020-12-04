import 'package:riadissnapback_store/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:riadissnapback_store/ui/home.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;
  EntryForm(this.contact);
  @override
  _EntryFormState createState() => _EntryFormState(this.contact);
}

class _EntryFormState extends State<EntryForm> {
  Contact _contact;
  _EntryFormState(this._contact);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (_contact != null) {
      _nameController.text = _contact.name;
      _phoneController.text = _contact.phone;
    }
    return Scaffold(
        appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.pink,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          },
          child: _contact == null ? Text('Add Planing') : Text('Change Planing')),
        actions: [
          new IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: (){}
          ),
        ],
      ),

        
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            //nama
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Item Want To Buy',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'target price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 0.0),
                      child: RaisedButton.icon(
                        onPressed:  () {
                          if (_contact == null) {
                            _contact = Contact(
                                _nameController.text,_phoneController.text);
                          } else {
                            _contact.name = _nameController.text;
                            _contact.phone = _phoneController.text;
                          }
                          Navigator.pop(context, _contact);
                        }, 
                        label: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        textColor:  Colors.white,
                        color: Colors.pink,
                        icon: Icon(Icons.save_alt, color: Colors.white), 
                      ),
                    ),   
                  
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: RaisedButton.icon(
                      onPressed: () {
                          Navigator.pop(context);
                        },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      icon: Icon(Icons.cancel, color: Colors.white),
                      label: Text(
                          'Cencel',
                          textScaleFactor: 1.5,
                        ),
                       color: Colors.pink,
                       textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
