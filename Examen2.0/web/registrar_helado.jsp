<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./CSS/estilo.css">
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
                String helado, contenedor, promocion, q;
                int gramos,no_bolas, precio;
                
                helado = request.getParameter("helado");
                contenedor = request.getParameter("contenedor");
                gramos = Integer.parseInt(request.getParameter("gramos"));
                no_bolas = Integer.parseInt(request.getParameter("bolas"));
                precio = Integer.parseInt(request.getParameter("precio"));
                promocion = request.getParameter("promocion");
                            
                q = "insert into helado(tipo_helado, gramos, num_bolas, contenedor,  precio, promocion) "
                        + "values ('"+helado+"', "+gramos+", "+no_bolas+", '"+contenedor+"', "+precio+", '"+promocion+"')";
                

                int registro = set.executeUpdate(q);
      
                %>
                <h1>Registro Exitoso</h1>
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
        <a href="registro_admin.jsp">Regresar a la página Admin</a>
        <br>    
        <a href="index.html" >Regresar a la Pagina Principal</a>
    </body>
</html>