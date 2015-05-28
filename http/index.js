/**
 * Created by bandit on 13/12/2014.
 */
var codes = [100,101,102,200,201,202,203,204,205,206,207,300,301,302,303,304,305,306,307,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,421,422,424,425,426,449,500,501,502,503,504,505,506,507,509,510];
var suc = [];
var fail = [];
$.ajaxSetup({async:false});
for(var i in codes){
    $.ajax({
        type: "POST",
        url: "404.php",
        data: {"code":codes[i]}
    })
        .done(function(){ suc.push(codes[i]);})
        .fail(function(){ fail.push(codes[i]);})
}
console.log(suc.toString());
console.log('-------------------------------------------');
console.log(fail.toString());