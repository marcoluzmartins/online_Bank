<%-- 
    Document   : AlterarDados
    Created on : Nov 5, 2018, 11:43:48 AM
    Author     : lenovo
--%>

<%@page import="asw.User"%>
<%@page import="asw.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    DAO dao = new DAO();
    
    String ids = (String) session.getAttribute("id");

    int id = Integer.parseInt(ids);
    User user = dao.user(id);
    %>
    
<!DOCTYPE html>

<html>
    <head>
        <title>Alterar Dados</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    </head>
    
    <body>
        <div class="container" >
            </br>
            <div class="card card-body">
                
                <div class="col-md-12 text-secondary text-center display-4">Alterar Dados do Utilizador</div>
                </br>
                <form method="POST" action="AlterarDados">
                <div class="form-group row">
                    <label for="name" class="col-md-1">Name:</label>
                    <div class="col-md-11">
                        <input placeholder="<%=user.getName()%> " type="text" class="form-control" id="name" name="nameN">
                    </div>
                </div>

                <div class="form-group row">
                    <label  for="morada" class="col-md-1">Morada:</label>
                    <div class="col-md-11">
                        <input placeholder=" <%=user.getMorada()%>" type="text" class="form-control" id="morada" name="moradaN">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="mail" class="col-md-1">Mail</label>
                    <div class="col-md-11">
                        <input placeholder=" <%=user.getMail()%>"  type="text" class="form-control" id="mail" name="mailN">
                    </div>
                </div>
                
                <div class="form-group row">
                    <label for="datadenascimento" class="col-md-2">Data de Nascimento:</label>
                    <div class="col-md-10 ">
                        <input placeholder=" <%=user.getData()%>" type="date" class="form-control" id="data" name="dataN">
                    </div>
                </div>

                    
                    <input type="submit" value="Confirmar Dados" class="btn btn-outline-secondary" role="button">
                </form>
            </div>

        </div>

    </body>
</html>

