//kobis 키번호 : 67d50dfdbcd15a1228e1aae184e976ff

    $(document).ready(function(){

        /********************************
         * glides movie poster
         *****************************/



        /*****
         * default = daily 나와라 뿅
         */

        initKobis();

        function initKobis(){

            let today = new Date();
            let year = today.getFullYear();
            let month = ('0' + (today.getMonth()+1)).slice(-2);
            let date = ('0'+(today.getDate() -1)).slice(-2);

            //alert(year+month+date);

            let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt="+year+month+date;
                     //alert(url);

                $.getJSON(url, function(kobis){
                    //alert(kobis);
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

                    var listName = boxOffice.dailyBoxOfficeList;
                    var kobisCount = 0;

                    for(list of listName){
                        output += "<tr>"
                        output += "<td>"+list.rank+"</td>";
                        output += "<td id='buttonTitle'><button type='button' id='movieName"+kobisCount+"' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal'>"+list.movieNm+"</button></td>";
                        output += "<td>"+list.audiAcc+"</td>";
                        output += "<td>"+list.openDt+"</td>";
                        output += "<td>"+list.rankInten+"</td>";
                        output += "</tr>"

                        kobisCount++;

                    }

                    output += "</table>";
                    output += "</div>";

                    //alert(output);

                    $("#1111").after(output);

                    var soyoon = "";
                    var url = "";
                    $("#movieName0").click(function (){
                        // alert("진입 성공!");
                        soyoon = $("#movieName0").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName1").click(function (){
                        soyoon = $("#movieName1").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName2").click(function (){
                        soyoon = $("#movieName2").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName3").click(function (){
                        soyoon = $("#movieName3").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName4").click(function (){
                        soyoon = $("#movieName4").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName5").click(function (){
                        soyoon = $("#movieName5").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName6").click(function (){
                        soyoon = $("#movieName6").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName7").click(function (){
                        soyoon = $("#movieName7").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName8").click(function (){
                        soyoon = $("#movieName8").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName9").click(function (){
                        soyoon = $("#movieName9").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });




                }); //getJSON


        }//initKobis


        /********************************
         일별, 주말 조회 button event
         ********************************/

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

                //alert(year+month+date);

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
                    let boxOffice = kobis.boxOfficeResult;
                    let output = "<div id='2222' class='KobisList'>"
                    output += "<table>";
                    output += "<tr>";
                    output += "<th>순위</th>";
                    output += "<th id='movieNmSize'>영화명</th>";
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

                    var kobisCount = 0;

                    for(list of listName){
                        output += "<tr>"
                        output += "<td>"+list.rank+"</td>";
                        output += "<td id='buttonTitle'><button type='button' id='movieName"+kobisCount+"' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#exampleModal'>"+list.movieNm+"</button></td>";
                        output += "<td>"+list.audiAcc+"</td>";
                        output += "<td>"+list.openDt+"</td>";
                        output += "<td>"+list.rankInten+"</td>";
                        output += "</tr>"

                        kobisCount++;

                    }

                    output += "</table>";
                    output += "</div>";

                    $("#2222").remove();

                    $("#1111").after(output);

                    var soyoon = "";
                    var url = "";
                    $("#movieName0").click(function (){
                       // alert("진입 성공!");
                        soyoon = $("#movieName0").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName1").click(function (){
                        soyoon = $("#movieName1").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName2").click(function (){
                        soyoon = $("#movieName2").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName3").click(function (){
                        soyoon = $("#movieName3").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName4").click(function (){
                        soyoon = $("#movieName4").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName5").click(function (){
                        soyoon = $("#movieName5").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName6").click(function (){
                        soyoon = $("#movieName6").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName7").click(function (){
                        soyoon = $("#movieName7").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName8").click(function (){
                        soyoon = $("#movieName8").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });
                    $("#movieName9").click(function (){
                        soyoon = $("#movieName9").text();
                        if(soyoon != "") {
                            url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&ServiceKey=923G54G6VL3W1VEO4A7P&detail=Y&title="+soyoon;
                            mainPoster(url);
                        }
                    });

                }); //kobis getJSON

            }

        });    //btnKobis click function

                    /***************************
                     영화 상세정보 모달창
                     ***************************/
                    function mainPoster(url){
                        $("#posterRemove").remove();
                        $("#modalBody").remove();
                       // alert(url);
                            $.getJSON(url, function(kmdb){
                                kmdb.Data[0].Result.sort(function(a, b) {
                                    return b.prodYear - a.prodYear;
                                });

                                let posters = kmdb.Data[0].Result[0].posters;
                                // alert(posters);
                                let poster = "";
                                let poster_img = "";

                                for(poster_img of posters){
                                    if(poster_img.posters != ""){
                                        poster_img = posters.split("|")[0];
                                        //alert(poster_img);
                                        break;
                                    }
                                }

                                var info = null
                                info = kmdb.Data[0].Result[0];
                                var movieActors = info.actors.actor;
                                var movieAc = Object.keys(movieActors).length;

                                var movieAc2 = "";
                                    for(i=0; i<Math.min(info.actors.actor.length, 6); i++) {
                                        movieAc2 += info.actors.actor[i].actorNm+", ";
                                }
                                movieAc2 = movieAc2.slice(0, -2);
                                //alert(movieAc2);


                                // alert($("#movieName").text()+","+poster_img);


                                let title1 = kmdb.Data[0].Result[0].title;
                                //alert(title1);
                                let replaced_title1 = title1.replace(/ !HE /g, '').replace(/ !HS /g,'');
                                //alert(replaced_title1);

                                let output = "";
                                output += "<div id='modalBody'>";
                                output += "<table id='posterRemove'>";
                                output += "<div>";
                                output += "<td><img src='"+poster_img+"'/></td>";
                                output += "</div>";
                                output += "<p id='movieTitle'>"+replaced_title1+"</p>";
                                output += "<P id='actors'>"+movieAc2+"</P>";
                                output += "<img src='images/info.png' id='info'>";
                                output += "<div id='movieInformation'><p>"+info.plots.plot[0].plotText+"</p>";
                                output += "<p>상영시간 : "+info.runtime+"분</p>";
                                output += "<p>관람등급 : "+info.rating+"</p>";
                                output += "<p>장르 : "+info.genre+"</P></div>"
                                output += "</div>";
                                output += "</table>";




                                $(".modal-body").after(output);


                            }); //kmdb getjson
                    }

        }); //click function







