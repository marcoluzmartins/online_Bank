<%-- 
    Document   : Verificacao
    Created on : Nov 5, 2018, 11:44:38 AM
    Author     : lenovo
--%>

<%@page import="asw.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DAO dao = new DAO();
    int id = Integer.parseInt(request.getParameter("idT"));
    session.setAttribute("idT", id);
    //int id = dao.getId("idT");
    String n = dao.getName(id);
    int vt = Integer.parseInt(request.getParameter("valorT"));
    session.setAttribute("valorT", vt);
%> 

<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    </head>
    <body>
        <form  method="POST" action="Verificacao">
            <div class="form-group row"><h1> </h1></div>
            <div class="container">
                <div class="card card-body">
                    <div class="col-md-12 text-secondary text-center display-4">Verificação de Transferência</div>

                    <br />

                    <div class="row">
                        <div class="col-md-1"> Nome:  </div>
                        <div class="col-md-11 text-left"> <%=n%> </div>
                    </div>

                    <div class="row">
                        <div class="col-md-1"> Id:  </div>
                        <div class="col-md-11 text-left"> <%=id%> </div>
                    </div>

                    <div class="row">
                        <div class="col-md-1"> Valor: </div>
                        <div class="col-md-11 text-left"> <%=vt%> €</div>
                    </div>

                    <br />

                    <nav class="nav flex-row">
                        <input type="submit" class="btn btn-outline-secondary col-md-2" role="button" value="Confirmar"></input>
                        
                        <a class="btn btn-outline-secondary col-md-2" href="Cliente.jsp" role="button">Cancelar</a>
                    </nav>
                </div>
            </div>
        </form>
    </body>
</html>

