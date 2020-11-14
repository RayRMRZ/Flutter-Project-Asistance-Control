

class Validation{

bool isCorrect(String email){
var pattern= r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$';
var regExp=RegExp(pattern);

var _;
if ((regExp.hasMatch(email))) {
  _ = true;
} else {
  _ = false;
}
return _;
}


}
