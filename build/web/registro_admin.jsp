<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
        //aqui ya puedo incorporar codigo java
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String url, userName, password, driver;
        
        url = "jdbc:mysql://localhost/examen";
        userName = "root";
        password = "04022004";
        
        driver = "com.mysql.jdbc.Driver";
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, userName, password);
            
            //diferentes vistas para los errores
            //error exclusivo de sql
            try{
                set = con.createStatement();
                //necesito los parametros del formulario
                String usuario, contraseña_admin, q;
                
                
                usuario = request.getParameter("usu_admin");
                contraseña_admin = request.getParameter("contraseña_admin");
                
                
                            
                q = "insert into admin(usuario, contra_admin) "
                        + "values ('"+usuario+"', '"+contraseña_admin+"')";
                

                int registro = set.executeUpdate(q);
      
                %>
                <h1>Registro Exitoso</h1>
                <hr>
                <h3>Registrar helados</h3>
                <br>
                <form action="registrar_helado.jsp" method="post">
                    <label for="helado">Sabor de helado</label>
                    <br>
                    <input name="helado" type="text" id="helado">
                    <br>
                    <label for="gramos">Gramos</label>
                    <br>
                    <input name="gramos" type="number" id="gramos">
                    <br>
                    <label for="bolas">No. de bolas</label>
                    <br>
                    <input name="bolas" id="bolas" type="number" max="2">
                    <br>
                    <label for="contenedor">Contenedor</label>
                    <br>
                    <select name="contenedor" id="contenedor">
                        <option>Vaso</option>
                        <option>Cono</option>
                    </select>
                    <br>
                    <label for="precio">Precio</label>
                    <br>
                    $<input name="precio" id="precio" type="number">
                    <br>
                    <input type="submit" value="Registrar helado">
                </form>
                <br>
                
                <a href="consultar.jsp"><h3>Consultar helados</h3></a>
                <%
                set.close();
            
            }catch(SQLException ed){
                System.out.println("Error al registrar en la tabla");
                System.out.println(ed.getMessage());
                
                %>
                <h1>Registro No Exitoso, error en la lectura de la tabla</h1>
                <%            
            }
            con.close();
        
        }catch(Exception e){
            System.out.println("Error al conectar bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            %>
            <h1>Sitio en Construccion</h1>
            <%
        }    
            %>                                        
        <a href="index.html" >Regresar a la Pagina Principal</a>
    </body>
</html>