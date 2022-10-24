
package Apis;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObjet;
import org.json.JSONException;
import javax.swing.table.DefaultTableModel;

public class apiCliente {
    private String get(){
    String salida = "";
        try {
            
            URL url = new URL("https://localhost:5000/api/clientes");
            HttpURLConnection capi=(HttpURLConnection) url.openConnection();
            capi.setRequestMethod("GET");
            capi.setRequestProperty("Accept", "application/json");
            if(capi.getResponseCode() == 200){
            
                InputStreamReader entrada = new InputStreamReader(capi.getInputStream());
                BufferedReader lectura = new BufferedReader(entrada);
                salida = lectura.readLine();
                
            }else{
                System.out.println("Error al conectar con la api" + capi.getResponseCode());
            }
            
            capi.disconnect();
            
        } catch (Exception e) {
            System.out.println("Error api"+ e.getMessage());
        }
        return salida;
    }
    
    public DefaultTableModel leer(){
    DefaultTableModel tabla = new DefaultTableModel();
        try {
            String encabezado[] = {"ID","NIT","NOMBRE","APELLIDO","DIRECCION","TELEFONO"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[]=new String[6];
            JSONArray arreglo = new JSONArray(get());
            for(int indice= 0;indice <arreglo.lenght();indice++){
                JSONObject atributo = arreglo.getJSONObject(indice);
                datos [0]=String.copyValueOf(atributo.getInt("idEmpleado"));
                datos [1]=atributo.getString("Nit");
                datos [2]=atributo.getString("Nombres");
                datos [3]=atributo.getString("Apellidos");
                datos [4]=atributo.getString("Direccion");
                datos [5]=atributo.getString("Telefono");
                tabla.addRow(datos);
            
            }
            
            
        } catch (Exception e) {
            System.out.println("Error");
        }
    return tabla;
    }
}
