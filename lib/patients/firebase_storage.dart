import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(
      String filePath, String fileName
      ) async{
    File file=File(filePath);

    try{
      await storage.ref('Patients/$fileName').putFile(file);
    }on firebase_core.FirebaseException catch(e){
      print(e);
    }
  }
}