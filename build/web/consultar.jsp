<%-- 
    Document   : consultar
    Created on : 2/05/2021, 04:04:39 PM
    Author     : Studio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta</title>
    </head>
    <body>
        <h1>Tabla General de Registro</h1>
        <div class="containerTable" >
            <table border="2" width="100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Helado</th>
                        <th>Gramos</th>
                        <th>No. de bolas</th>
                        <th>Contenedor</th>
                        <th>Precio</th>
                        <th>Promoción</th>
                    </tr>        
                </thead>
                <tbody>
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
                                
                                q = "select * from helado";
                                
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                    %>
                <tr>
                    <td><%=rs.getInt("id_helado")%> </td>
                    <td><%=rs.getString("tipo_helado")%> </td>
                    <td><%=rs.getInt("gramos")%> </td>
                    <td><%=rs.getInt("num_bolas")%> </td>
                    <td><%=rs.getString("contenedor")%> </td>
                    <td><%=rs.getInt("precio")%> </td>
                    <td><%=rs.getInt("promocion")%></td>
                    <td> <a href="editar.jsp?id=<%=rs.getInt("id_helado")%>" >Editar</a> </td>
                    <td> <a href="borrar.jsp?id=<%=rs.getInt("id_helado")%>" >Borrar</a> </td>
                                        
                </tr>                
                                    
                                    <%
                                
                                }
                            rs.close();    
                            set.close();
                            
                            }catch(SQLException ed){
                                System.out.println("Error al consultar la tabla");
                                System.out.println(ed.getMessage());
                                %>
                </tbody>  
            </table>

                <br>
                <h1>Error no se pueden visualiar los datos en este momento</h1>
                                <%
                            
                            }
                        con.close();
                        
                        }catch(Exception e){
                            System.out.println("Error al conectar la bd");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                        %>
                <br>
                <h1>Sitio en Construccion</h1>        
                        <%
                        
                        }
                        
                    %>
        <br>                                  
        </div>
        <div>
            <a href="registro_admin.jsp">Regresar a la página Admin</a>
            <br>
            <a href="index.html" >Regresar a la Pagina Principal</a>
        </div>
    </body>
</html>