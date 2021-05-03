<%-- 
    Document   : editar
    Created on : 2/05/2021, 04:34:48 PM
    Author     : Studio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Registro</title>
    </head>
    <body>
        <h1>Actualizacion del Perfil</h1>
        <br>
            
            <table border="2" width="100%" >
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
                            int id;
                        
                            id = Integer.parseInt(request.getParameter("id"));
                            
                            q = "select * from usuario where id_usu="+id;
                            
                            rs = set.executeQuery(q);
                            while(rs.next()){
                                %>
                <% System.out.println("HOLA");%> 
                <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id_usuario" value="<%=rs.getInt("id_usu")%>" > </td>
                </tr>
                <tr>
                    <td>NOMBRE</td>
                    <td> <input type="text" name="name" value="<%=rs.getString("nombre")%>" > </td>
                </tr>
                <tr>
                    <td>APELLIDO PATERNO</td>
                    <td> <input type="text" name="apepat" value="<%=rs.getString("appat")%>" > </td>
                </tr>
                <tr>
                    <td>APELLIDO MATERNO</td>
                    <td> <input type="text" name="apema" value="<%=rs.getString("apmat")%>" > </td>
                </tr>
                <tr>
                    <td>CALLE</td>
                    <td> <input type="text" name="street" value="<%=rs.getString("calle")%>" > </td>
                </tr>
                <tr>
                    <td>ALCALDÍA</td>
                    <td> <input type="text" name="alcal" value="<%=rs.getString("alcaldia")%>" > </td>
                </tr>
                
                <td>
                    <td>NO. DE CASA</td>
                    <td> <input type="number" name="casa" value="<%=rs.getInt("num_casa")%>" > </td>                
                </td>                
                <td>
                    <td>INTERIOR</td>
                    <td> <input type="number" name="inte" value="<%=rs.getInt("interior")%>" > </td>                
                </td>                
                <td>
                    <td>DÍA DE NACIMIENTO</td>
                    <td> <input type="number" name="dia" value="<%=rs.getInt("dia_nac")%>" > </td>                
                </td>
                <td>
                    <td>MES DE NACIMIENTO</td>
                    <td> <input type="number" name="mes" value="<%=rs.getInt("mes_nac")%>" > </td>                
                </td>
                <td>
                    <td>AÑO DE NACIMIENTO</td>
                    <td> <input type="number" name="ano" value="<%=rs.getInt("ano_nac")%>" > </td>                
                </td>
                <td>
                    <td>TELÉFONO PARTICULAR</td>
                    <td> <input type="text" name="particular" value="<%=rs.getString("tel_particular")%>" > </td>                
                </td>
                <td>
                    <td>TELÉFONO CELULAR</td>
                    <td> <input type="text" name="celular" value="<%=rs.getString("tel_celular")%>" > </td>                
                </td>
                <td>
                    <td>EDAD</td>
                    <td> <input type="number" name="edad" value="<%=rs.getInt("edad")%>" > </td>                
                </td>
                
                
                <%
                                
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error no se puede leer la tabla");
                            System.out.println(ed.getMessage());
                            %>                
                                
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
                
                
            
            </table>
         
            <input type="submit" value="Actualizar">                       
        
    
    <br> 
    <a href="index.html" >Regresar a la Pagina Principal</a>
    </body>
</html>