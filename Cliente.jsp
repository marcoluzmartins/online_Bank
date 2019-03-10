<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="asw.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="asw.Desc"%>
<%@page import="asw.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DAO dao = new DAO();

    String ids = (String) session.getAttribute("id");

    int id = Integer.parseInt(ids);
    int s = dao.getBalance(id);

    List<Desc> l = dao.descL(id);

    User user = dao.user(id);

    String avisoVisible = "d-none";

%>


<%    if (session.getAttribute("error") != null && (Boolean) session.getAttribute("error") == true) {

        avisoVisible = "";
        session.setAttribute("error", null);
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <title>Página Pessoal</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript">
            function table() {
                dados = {
                    id : <%=user.getId()%>
                }    
                $.ajax({
                    url: "Table",
                    method: "POST",
                    data: JSON.stringify(dados),
                    success: function (result) {
                        texto = "";
                        for (i = 0; i < result.length; i++) {                        
                            texto = texto + "<tr> <td>" + result[i].id + " </td> " + "<td> " + result[i].desc + " </td> " + "<td>" + result[i].id_o + " </td>" + "<td> " + result[i].id_d + " </td> " + "<td>" + result[i].mont + " </td>" + "<td>" + result[i].dat.date.year + "/" + result[i].dat.date.month + "/" + result[i].dat.date.day + " " + result[i].dat.time.hour +":" + result[i].dat.time.minute + ":" + result[i].dat.time.second + "</td>" + "</tr>";
                        }
                        $("#table").html(texto);                        
                    }
                });
            }
        </script>
    </head>
    <body onload="setInterval(table,1000)">


        <div class="container">
            <br />

            <div class="card card-body">
                <div class="row">
                    <div class="col-12 display-4 text-center"> Página Pessoal de Utilizador </div>
                </div>
                <%

                %>
                <div class="row">

                    <h2 class="col-md-10 text-left">Id: <%=id%></h2>
                    <a  class="col-md-1 btn btn-link btn-sm text-right"href="AlterarDados.jsp">Atualizar</a>
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
                <%--              <div class="row">
                <div class="col-md-2"> Password:</div>
                <div class="col-md-10 text-left">  </div>                    
                </div> --%>
            </div>

            <br /><div class="card card-body">

                <div class="container">
                    <div class="row">
                        <h2 class="col-md-10 text-left">Transferências</h2>
                    </div>
                    <form method="POST" action="Verificacao.jsp">
                        <div class="form-group row">
                            <label for="id" class="col-md-2 text-right">Id:</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="idnumb" name="idT">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label for="montante" class="col-md-2 text-right">Valor:</label>
                            <div class="col-md-9">
                                <input type="number" step="0.01" class="form-control" id="valor" name="valorT">
                            </div>

                            <nav class="nav flex-row">


                                <input type="submit" value="Transferir" class="ol-md-1 btn btn-link btn-sm" role="button">

                            </nav>
                        </div>
                    </form>
                </div>
            </div>
            <br />

            <div class="card card-body" >
                <div class="row">
                    <h2 class="col-md-10 text-left">Depósitos</h2>
                </div>

                <form method="POST" action="Cliente">
                    <div class="form-group row">

                        <label for="montante" class="col-md-2 text-right">Valor:</label>
                        <div class="col-md-9">
                            <input type="number" step="0.01" class="form-control" id="valor" name="valorD">
                        </div>

                        <input class="ol-md-1 btn btn-link btn-sm" type="submit"value ="Aplicar">
                    </div>
                </form>


                <br />

                <div class="card card-body">

                    <table id="tableT" class="table table-sm table-hover">
                        <thead>
                            <tr>
                                <th>Transição</th>
                                <th>Decrição</th>
                                <th>Id Origem</th>
                                <th>Id Destino</th>
                                <th>Valor</th>
                                <th>Data</th>
                            </tr>
                        </thead>
                        <tbody id="table">
                            <%
                                // date = new Date();
                                //SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
                                DateTimeFormatter format = DateTimeFormatter.ofPattern("d/MM/yyyy  hh:mm");

                                for (int i = 0; i < l.size(); i++) {
                                    Desc desc = l.get(i);

                                    String data = desc.getDat().format(format);

                            %>
                            <tr>
                                <td> <%=desc.getId()%> </td>                                
                                <td> <%=desc.getDesc()%></td>
                                <td> <%=desc.getId_o()%></td>
                                <td> <%=desc.getId_d()%></td>
                                <td> <%=desc.getMont()%></td>

                                <td> <%=data%></td>
                                <%-- <td> <%=System.out.print(sdf.format(date)) %> </td> --%>
                            </tr>
                        

                            <%
                                }
                            %>


                        </tbody>
                    </table>


                </div>

                <br />
            </div>
            <div class="form-group row"><h1> </h1></div>
            <div class="card card-body">
                <div class="container">
                    <div class="row">

                        <div class="col-md-10 text-right"> Saldo Total:</div>
                        <div class="col-md-2 text-right"> <%=user.getVal()%> €</div>

                    </div>

                </div>  
            </div>

            <br />

        </div>
    </body>
</html>

