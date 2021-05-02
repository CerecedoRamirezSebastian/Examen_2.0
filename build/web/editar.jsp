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
        <form method="get" name="formularioeditar" action="actualizar.jsp">    
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
                            
                            q = "select * from helado where id_helado="+id;
                            
                            rs = set.executeQuery(q);
                            while(rs.next()){
                                %>
                <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id_h" value="<%=rs.getInt("id_helado")%>" > </td>
                </tr>
                <tr>
                    <td>HELADO</td>
                    <td> <input type="text" name="sabor" value="<%=rs.getString("tipo_helado")%>" > </td>
                </tr>
                <tr>
                    <td>GRAMOS</td>
                    <td> <input type="number" name="grs" value="<%=rs.getInt("gramos")%>" > </td>
                </tr>
                <tr>
                    <td>NO. DE BOLAS</td>
                    <td> <input type="number" name="bolas_num" value="<%=rs.getInt("num_bolas")%>" > </td>
                </tr>
                <tr>
                    <td>CONTENEDOR</td>
                    <td> 
                        <select name="cont" value="<%=rs.getString("contenedor")%>">
                            <option>Vaso</option>
                            <option>Cono</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>PRECIO</td>
                    <td> <input type="number" name="lana" value="<%=rs.getInt("precio")%>" > </td>
                </tr>                
                                
                                <%
                                
                            }
                            rs.close();
                            set.close();
                        
                        }catch(SQLException ed){
                            System.out.println("Error no se puede leer la tabla");
                            System.out.println(ed.getMessage());
                            %>
                <tr>
                    <td>ID</td>
                    <td> <input type="hidden" name="id2" value="<%=rs.getInt("id_usu")%>" > </td>
                </tr>
                <tr>
                    <td>Nombre</td>
                    <td> <input type="text" name="nombre2" value="<%=rs.getString("nom_usu")%>" > </td>
                </tr>
                <tr>
                    <td>Ciudad</td>
                    <td> <input type="text" name="ciudad2" value="<%=rs.getString("ciu_usu")%>" > </td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td> <input type="text" name="tel2" value="<%=rs.getString("tel_usu")%>" > </td>
                </tr>                
                                
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
        </form>
    </body>
</html>