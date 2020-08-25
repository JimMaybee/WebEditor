import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xml2json/xml2json.dart';
import 'package:xml/xml.dart';
import 'dart:html';

void main() {
  TextAreaElement textArea = querySelector('#xml');
  var instance = FirebaseFirestore.instance;
  final myTransformer = Xml2Json();

  if (textArea.text.trim() != '') {
    final document = XmlDocument.parse(textArea.text);
    print(document);
    myTransformer.parse(textArea.text);
    var json = myTransformer.toBadgerfish();
    print(json);
    // json = myTransformer.toParker();
    // print(json);
    instance
        .collection('webtest')
        .doc('DMFftGeHEFXuaZkRfhm0')
        .set({'map': json});
  }

  textArea.onChange.listen((event) {
    updateOnChange(event, instance);
  });
}

void updateOnChange(Event event, FirebaseFirestore instance) {
  instance
      .collection('webtest')
      .doc('DMFftGeHEFXuaZkRfhm0')
      .set({'map': 'notxml'});
}
