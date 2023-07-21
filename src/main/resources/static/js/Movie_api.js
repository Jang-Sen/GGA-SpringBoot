//키번호 : 67d50dfdbcd15a1228e1aae184e976ff

$(document).ready(function(){

    //일별, 주말 조회 button event
    $("#btnKobis").click(function(){
        if($("#kselect").val() == "default"){
            alert("박스오피스를 선택해주세요");
            $("#kselect").focus();
            return false;
        }else{
           //yesterday
            let today = new Date();
            let year = today.getFullYear();
            let month = ('0' + (today.getMonth()+1)).slice(-2);
            let date = ('0'+(today.getDate() -1)).slice(-2);
            let date2 = ('0'+(today.getDate() -7)).slice(-2);

            let ktype = $("#kselect").val();

            var url = "";
            if(ktype == "Daily"){
                //Daily
                url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/search"+ktype+"BoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+year+month+date;
            }else{
                url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/search"+ktype+"BoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+year+month+date2+"&weekGb=0";
            }
//alert(url);
            $.getJSON(url, function(kobis){
                //output
                //alert(kobis.boxOfficeResult);
                let boxOffice = kobis.boxOfficeResult;
                let output = "<div id='2222' class='KobisList'>"
                output += "<table>";
                output += "<tr>";
                output += "<th>순위</th>";
                output += "<th>영화명</th>";
                output += "<th>누적관객</th>";
                output += "<th>개봉일자</th>";
                output += "<th>순위증감분</th>";
                output += "</tr class='KobisListth'>";

                var listName = null;
                if(ktype == "Daily"){
                    listName = boxOffice.dailyBoxOfficeList;
                }else{
                    listName = boxOffice.weeklyBoxOfficeList;
                }

                for(list of listName){
                    output += "<tr>"
                    output += "<td>"+list.rank+"</td>";
                    output += "<td>"+"<button>"+list.movieNm+"</button>"+"</td>";
                    output += "<td>"+list.audiAcc+"</td>";
                    output += "<td>"+list.openDt+"</td>";
                    output += "<td>"+list.rankInten+"</td>";
                    output += "</tr>"
                }

                output += "</table>";
                output += "</div>";

                $("#2222").remove();

                $("#1111").after(output);


            }); //getJSON



        }
    });    //btnKobis click function

});    //document.ready.function