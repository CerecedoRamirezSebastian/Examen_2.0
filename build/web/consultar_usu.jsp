<%-- 
    Document   : consultar
    Created on : 2/05/2021, 04:04:39 PM
    Author     : Studio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./CSS/estilo.css">

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
                        <th>Nombre</th>
                        <th>Apellido Paterno</th>
                        <th>Apellido Materno</th>
                        <th>Edad</th>
                        <th>Día de nacimiento</th>
                        <th>Mes de nacimiento</th>
                        <th>Año de nacimiento</th>
                        <th>Calle</th>
                        <th>Alcaldía</th>
                        <th>No. de casa</th>
                        <th>Interior</th>
                        <th>Tel. Particular</th>
                        <th>Tel. Celular</th>
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
                                
                                q = "select * from usuario";
                                
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                    %>
                <tr>
                    <td><%=rs.getInt("id_usu")%> </td>
                    <td><%=rs.getString("nombre")%> </td>
                    <td><%=rs.getString("appat")%> </td>
                    <td><%=rs.getString("apmat")%> </td>
                    <td><%=rs.getString("calle")%> </td>
                    <td><%=rs.getString("alcaldia")%> </td>
                    <td><%=rs.getInt("num_casa")%></td>
                    <td><%=rs.getInt("interior")%></td>
                    <td><%=rs.getInt("dia_nac")%></td>
                    <td><%=rs.getInt("mes_nac")%></td>
                    <td><%=rs.getInt("ano_nac")%></td>
                    <td><%=rs.getString("tel_particular")%></td>
                    <td><%=rs.getString("tel_celular")%></td>
                    <td><%=rs.getInt("edad")%></td>
                    <td> <a href="editar_perfil.jsp?id=<%=rs.getInt("id_usu")%>" >Editar</a> </td>
                    <td> <a href="borrar_usu.jsp?id=<%=rs.getInt("id_usu")%>" >Borrar</a> </td>
                                        
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
            
            <br>
            <a href="index.html" >Regresar a la Pagina Principal</a>
        </div>
    </body>
</html>
