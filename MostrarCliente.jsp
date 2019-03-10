
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="asw.Desc"%>
<%@page import="asw.User"%>
<%@page import="asw.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DAO dao = new DAO();
    
    int idT = Integer.parseInt(request.getParameter("id"));
    User user = dao.user(idT);
   
    
    String avisoVisible = "d-none";

%>
<html>
    <head>
        <title>Página Pessoal Do Cliente</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    </head>

    <body>
        <div class="container">
            <br />

            <div class="card card-body">
                <div class="row">
                    <div class="col-12 display-4 text-center"> Página Pessoal do Cliente </div>
                </div>
                <%
                %>
                <div class="row">
                    <h2 class="col-md-10 text-left">Id: <%=idT%></h2>
                </div>
                <div class="row">
                    <div class="col-md-1"> Nome:</div>
                    <div class="col-md-11 text-left"> <%=user.getName()%></div>
                </div>

                <div class="row">
                    <div class="col-md-1"> Morada:</div>
                    <div class="col-md-11 text-left"> <%=user.getMorada()%> </div>
                </div>

                <div class="row">
                    <div class="col-md-1"> Mail:</div>
                    <div class="col-md-11 text-left"> <%=user.getMail()%></div>
                </div>

                <div class="row">
                    <div class="col-md-2"> Data Nascimento:</div>
                    <div class="col-md-10 text-left"> <%=user.getData()%> </div>
                </div>
            </div>

            <div class="card card-body">
                <div class="container">
                    <div class="row">

                        <div class="col-md-10 text-right"> Saldo Total:</div>
                        <div class="col-md-2 text-right"> <%=user.getVal()%> €</div>

                    </div>

                </div>  
            </div>
                        <div><nav class="nav flex-row " style="justify-content: center "  >
                          <a class=" btn nav-link col-md-4" href="Gestor.jsp" role="button">Retornar</a>
                    </nav></div>
    </body>
</html>
