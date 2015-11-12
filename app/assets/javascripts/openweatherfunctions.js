
function createTableCell(str){
    return "<td>"+str+"</td>";
}
function formatData(data){
    var output ="<table class=\"table\">";
    output += "<tr>";
    output +="<th>Forecast for "+data.name;
    output +="</th>";
    output +="<th>Value";
    output +="</th>";
    output+="</tr>";
    for(var key in data.main) {
        output += "<tr>";
        output += createTableCell(key + " ");
        output += createTableCell(data.main[key]);
        output += "</tr>";
    }
    output+="</table>";

    $('#data_content').html(output);
}

$(document).ready(function(){
    $("#loadjson").click(function(event) {
        var city = document.getElementById("city_name").value;
        var theUrl = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=2de143494c0b295cca9337e1e96b00e0";
        event.preventDefault();
        $.get(theUrl, {}, function(data) {
            formatData(data);
        });
    });
});
