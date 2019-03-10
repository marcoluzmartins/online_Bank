

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Sign In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container" >
            <br />
            <div class="card card-body">

                <div class="col-md-12 text-secondary text-center display-4">Sign In</div>
                <br />
                <form action="Login" method="POST"> 

                    <div class="form-group row">
                        <label for="name" class="col-md-2 text-right">Name:</label>
                        <div class="col-md-10">
                            <input  type="text" class="form-control" id="name" name="name">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="id" class="col-md-2 text-right">Id:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" id="idnumb" name="id">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="pwd" class="col-md-2 text-right">Password:</label>
                        <div class="col-md-10">
                            <input type="password" class="form-control" id="pwd" placeholder="Password" name="Password">
                        </div>
                    </div>

                    <div>
                        <input class="btn btn-outline-secondary col-md-2" type="submit"value ="Confirmar">
                        <button type="reset" class="btn btn-outline-secondary col-md-2">Limpar</button>
                    </div>  
                </form>
            </div>
        </div>
    </body>
</html>
