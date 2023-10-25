import 'dart:convert';
import 'package:crudapps/style/style.dart';
import 'package:http/http.dart' as http;

Future<List> Productgridviwe() async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');
  var PostHeader = {'Content-Type': 'application/json'};

  var response = await http.get(URL, headers: PostHeader);

  var Resultcode = response.statusCode;
  var Resultbody = json.decode(response.body);

  if (Resultcode == 200 && Resultbody['status'] == 'success') {
    successMassage('Requset Success ');
    return Resultbody['data'];
  } else {
    errorMassage('Requset fail');
    return [];
  }
}

Future ProductcreateRequst(Formvalues) async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');

  var Postbody = json.encode(Formvalues);
  var PostHeader = {'Content-Type': 'application/json'};

  var response = await http.post(URL, body: Postbody, headers: PostHeader);

  var Resultcode = response.statusCode;
  var Resultbody = json.decode(response.body);

  if (Resultcode == 200 && Resultbody['status'] == 'success') {
    successMassage('Request Success ');
    return true;
  } else
    () {
      errorMassage('Request Fail');
      return false;
    };
}


Future<bool> productdelete(id)async{

var URL=Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/'+id);
var PostHeader = {'Content-Type': 'application/json'};
var response= await http.get(URL,headers: PostHeader);
var Resultcode = response.statusCode;
  var Resultbody = json.decode(response.body);

if (Resultcode==200 && Resultbody['status'] == 'success') {
  successMassage('Requset success');
  return true;
}
else{

  errorMassage('Requset Not success');
  return false;
}
}


Future ProductUpdateRequst(Formvalues,id) async {
  var URL = Uri.parse('https://crud.teamrabbil.com/api/v1/UpdateProduct/'+id);

  var Postbody = json.encode(Formvalues);
  var PostHeader = {'Content-Type': 'application/json'};

  var response = await http.post(URL, body: Postbody, headers: PostHeader);

  var Resultcode = response.statusCode;
  var Resultbody = json.decode(response.body);

  if (Resultcode == 200 && Resultbody['status'] == 'success') {
    successMassage('Request Success ');
    return true;
  } else
    () {
      errorMassage('Request Fail');
      return false;
    };
}