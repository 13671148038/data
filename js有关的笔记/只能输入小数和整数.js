  //ֻ����������У��
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


   //ֻ����������֮����
        function jiaoyanint(value) {
            var r = parseInt(value).toString()
            if (parseInt(value).toString() == "NaN") {
                return "";
            } else {
                return  r;
            }
        }

//ֻ��������������С��(������λС��)
  function num(obj){
      obj.value = obj.value.replace(/[^\d.]/g,""); //���"����"��"."������ַ�
      obj.value = obj.value.replace(/^\./g,""); //��֤��һ���ַ�������
      obj.value = obj.value.replace(/\.{2,}/g,"."); //ֻ������һ��, ��������
      obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
      obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3'); //ֻ����������С��
  }

