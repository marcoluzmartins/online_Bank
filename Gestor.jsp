
<%@page import="java.util.List"%>
<%@page import="asw.User"%>
<%@page import="asw.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String client = request.getParameter("cliente");
    DAO dao = new DAO();

    List<User> userl = null;
    
    if (client != null){
        userl = dao.searchUser(client);
    }
%>
<!DOCTYPE html>

<html>
    <head>
        <title>Gestão</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    </head>
    <body>
        <%--    <%=client%>  --%>
        <div class="container">
            <p> </p>
            <div class="row">
                <div class="col-12 display-4 text-center"> Página Pessoal do Gestor </div>
            </div>
            <p> </p>
            <p> </p>
            <p> </p>
            <p> </p>
            <div class="container">


                <nav class="nav flex-row">
                    <h2>Lista de Clientes: </h2>
                    <a class="btn nav-link col-md-8 text-right" href="Registo.jsp" role="button">Adicionar Clientes</a>

                </nav>
                <br>
                <br>
                <div class="input-group mb-12">
                    <form method="POST" action="Gestor.jsp">
                        <input type="text" class="form-control col-md-12" placeholder="Cliente" name="cliente" aria-label="Search term" aria-describedby="basic-addon">
                        
                        <div class="input-group-append">
                            <input type="submit" value="Search" class="btn btn-outline-secondary " role="button">
                        </div>
                            
                    </form>
                </div>
                <br>
                <br>

                <%
                    if ( userl != null)
                    for (User u: userl){
                    %>
                <div class="form-group row">
                    <a class="nav-link col-md-2" href="MostrarCliente.jsp?id=<%=u.getId()%>"> <%=u.getName()%></a>
                    <%
                       int idT = u.getId();
                       session.setAttribute("idtrasnsf", idT);
                        %>
                    <div class="col-md-9"></div>
                    <%--
                    <button class="btn btn-outline-secondary col-md-1">Remover</button>
                    <br>
                    --%>
                </div>
                <%
                    }
                    %>
            </div>    
            <div>
                <br />
                <br />


            </div>
        </div>   
    </body>
</html>

