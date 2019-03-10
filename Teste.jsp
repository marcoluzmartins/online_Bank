

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Teste</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript">
            function desc() {
                $.ajax({
                    url: "ServicoSaldos",
                    method: "GET",
                    success: function (result) {
                        t = "";
                        for (i = 0; i < result.length; i++) {
                            t = t + "<div> <b>" + result[i].Id + "</b> " + result[i].Id_d + "</b> " + result[i].Id_o + "</b> " + result[i].Desc + "</b> " + result[i].Mont "</div>";;
                            }
                        $("#teste").html(t);

                    }
                });
            }
        </script>
    </head>
    <body onload="setInterval(desc(),1000)">
        
        <div id="teste">

        </div>
      
    </body>
</html>
