  //只能输入数字校验
function jiaoyan(value) {
        var r = parseFloat(value).toString();
        var e = "";
        if((value+"").length>1){
            var b = value.substring(value.length-1)=="0";
            if(b){
                e="0";
            }
        }
        if (parseFloat(value).toString() == "NaN") {
            return 0;
        } else {
            if(value.indexOf(".") != -1){
                var len =  r.split(".").length;
                if(len>1){
                    return  r+e;
                }else {
                    return  r+"."+e;
                }
            }
            return  r;
        }
    }


   //只能输入数字之整数
        function jiaoyanint(value) {
            var r = parseInt(value).toString()
            if (parseInt(value).toString() == "NaN") {
                return "";
            } else {
                return  r;
            }
        }

//只能输入整数或者小数(保留两位小数)
  function num(obj){
      obj.value = obj.value.replace(/[^\d.]/g,""); //清除"数字"和"."以外的字符
      obj.value = obj.value.replace(/^\./g,""); //验证第一个字符是数字
      obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个, 清除多余的
      obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
      obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //只能输入两个小数
  }

