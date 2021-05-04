<%-- 
    Document   : actualizar
    Created on : 2/05/2021, 04:45:34 PM
    Author     : Studio
--%>
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
                try{
                        set = con.createStatement();
                        //necesito los parametros del formulario
                        String q;
                        int id_usuario, casa, inte, dia, mes, ano, edad;
                        String celular, particular, name, apepat, apema, street, alcal;
                       
                
                        
                        celular = request.getParameter("celular");
                        particular = request.getParameter("particular");
                        casa = Integer.parseInt(request.getParameter("casa"));
                        name = request.getParameter("name");
                        inte = Integer.parseInt(request.getParameter("inte"));
                        dia = Integer.parseInt(request.getParameter("dia"));
                        mes = Integer.parseInt(request.getParameter("mes"));
                        ano = Integer.parseInt(request.getParameter("ano"));
                        edad = Integer.parseInt(request.getParameter("edad"));
                        apepat = request.getParameter("apepat");
                        apema = request.getParameter("apema");
                        street = request.getParameter("street");
                        alcal = request.getParameter("alcal");
                        
                        id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
                        
                        q = "update usuario set "
                                + "nombre = '"+name+"', appat = '"+apepat+"', apmat = '"+apema+"', calle = '"+street+"', alcaldia = '"+alcal+"', num_casa = "+casa+", interior = "+inte+", dia_nac = "+dia+", mes_nac = "+mes+", ano_nac = "+ano+", tel_particular = '"+particular+"', tel_celular = '"+celular+"', edad = "+edad+" where id_usu = "+id_usuario+"";
                        
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
        
        <a href="consultar_usu.jps">Regresar a edición</a>
        <br>
        <a href="index.html" >Regresar a la Pagina Principal</a>  
        
        
        
    </body>
</html>