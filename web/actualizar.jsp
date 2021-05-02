<%-- 
    Document   : actualizar
    Created on : 2/05/2021, 04:45:34 PM
    Author     : Studio
--%>
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
                try{
                        set = con.createStatement();
                        //necesito los parametros del formulario
                        String q;
                        int id_h;
                        String helado, contenedor;
                        int gramos, bolas, precio;
                
                        
                        helado = request.getParameter("sabor");
                        gramos = Integer.parseInt(request.getParameter("grs"));
                        bolas = Integer.parseInt(request.getParameter("bolas_num"));
                        contenedor = request.getParameter("cont");
                        precio = Integer.parseInt(request.getParameter("lana"));
                        
                        id_h = Integer.parseInt(request.getParameter("id_h"));
                        
                        q = "update helado set "
                                + "tipo_helado = '"+helado+"', gramos = "+gramos+", num_bolas = "+bolas+", contenedor = '"+contenedor+"', precio = "+precio+""
                                + " where id_helado = "+id_h+"";
                        
                        int actualizar = set.executeUpdate(q);
                        
                        %>
                        <h1>Datos Actualizados con Exito</h1>
                        <%
                            set.close();
                    
                }catch(SQLException ed){
                        System.out.println("Error al actualizar el registro en la tabla");
                        System.out.println(ed.getMessage());
                        %>
                        <h1>Solo juguito contigo ¬¬ T_T</h1>
                        <%
                        
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                <br>
                <h1>Sitio en Construccion</h1>        
                        <%
            }
            
            %>
        
        <a href="registro_admin.jsp">Regresar a la página Admin</a>
        <br>
        <a href="index.html" >Regresar a la Pagina Principal</a>  
        
        
        
    </body>
</html>