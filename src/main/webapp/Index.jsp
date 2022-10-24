<%-- 
    Document   : Index
    Created on : 21 oct. 2022, 20:57:38
    Author     : Admin
--%>
<%@page import = "Apis.apiCliente"%>
<%@page import = "import javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- https://mvnrepository.com/artifact/org.json/json -->
<dependency>
    <groupId>org.json</groupId>
    <artifactId>json</artifactId>
    <version>20220924</version>
</dependency>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
  <h2>Bordered Table</h2>
  <p>The .table-bordered class adds borders to a table:</p>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Nit</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
    <tbody
         <tr>
       <%
            
        apiCliente apic = new apiCliente();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = apic.leer();
        for(int t = 0;t<tabla.getRowCount(); t++){
        System.out.println("<tr>");
        System.out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
        System.out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
        System.out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");
        System.out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
        System.out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
        System.out.println("</tr>");
           
           }
      
        

        %>
      </tr>
    </tbody>
      </tr>
    </thead>
  </table>
</div>
       
    </body>
</html>
