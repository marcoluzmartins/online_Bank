

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorVisible = "d-none";
    String valido = "d-none";
%>

<%
    if (session.getAttribute("verificacao") != null && (Boolean) session.getAttribute("verificacao") == true) {

        valido = "";
        session.setAttribute("verificacao", null);
    }
%>

<%
    if (session.getAttribute("error") != null && (Boolean) session.getAttribute("error") == true) {

        errorVisible = "";
        session.setAttribute("error", null);
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Banco Marco</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


    </head>
    <body>

        <div class="container" >

            <div class="col-md-12 display-3 text-secondary text-center">Banco Marco</div>
            <div class="col-md-12 display-4 text-secondary text-center">Registo</div>
            <br />

            <h1 class=" text-center text-danger <%=errorVisible%>">
                Erro!!!
                Por favor tente novamente!!!
            </h1>
            <h1 class=" text-center text-success <%=valido%>">
                Utilizador Criado com Sucesso!!!
            </h1> 
            <br />
            <form action="Registo" method="POST">
                <div class="form-group row">
                    <label for="name" class="col-md-1">Name:</label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="morada" class="col-md-1">Morada:</label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="morada" name="morada">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="datadenascimento" class="col-md-2">Data de Nascimento:</label>
                    <div class="col-md-10 ">
                        <input type="date" class="form-control" id="data" name="data">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="mail" class="col-md-1">Mail</label>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="mail" name="mail">
                    </div>
                </div>



                <div class="form-group row">
                    <label for="montante" class="col-md-1">Montante Inicial:</label>
                    <div class="col-md-11">
                        <input type="number" min="250"step="0.01" class="form-control" id="valor" name="valorI">
                    </div>
                </div>


                <div class="form-group row">
                    <label for="pwd" class="col-md-1">Password</label>
                    <div class="col-md-11">
                        <input type="password" class="form-control" id="pwd" name="Password" placeholder="Password">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Tipo" class="col-md-1">Tipo:</label>
                    <select class="col-md-11" name="Tipo">
                        <option value="1">Cliente</option>
                        <option value="2">Gestor</option>
                    </select>
                </div>

                <br />

                <div><nav class="nav flex-row" style="justify-content: center">
                        <input class="btn btn-outline-secondary col-md-3" type="submit"value ="Confirmar">
                        <button type="reset" class="btn btn-outline-secondary col-md-3">Limpar</button>
                        <a class=" btn btn-outline-secondary col-md-3" href="Registo.jsp" role="button">Novo Cliente</a>      
                    </nav> </div>
                <br /><br />
                <div><nav class="nav flex-row " style="justify-content: center "  >
                          <a class=" btn nav-link col-md-4" href="Gestor.jsp" role="button">Retornar</a>
                    </nav></div>
                
                <br />

            </form>

        </div>

    </body>

</html>

