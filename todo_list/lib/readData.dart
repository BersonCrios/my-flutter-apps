import 'getFile.dart';

Future<String> readData() async{
  try{
    final file = await getFile();
    return file.readAsString();
  }
  catch (e){
    return null;
  }
}