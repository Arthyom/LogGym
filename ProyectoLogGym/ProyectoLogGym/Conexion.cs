using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ProyectoLogGym
{
    class Conexion
    {
        public string host, port, user, pass, dbName;
        public string cadCon;
        public MySqlConnection conexionConServidor;
        public MySqlCommand    comando;

        // constructor crea una nueva conexion
        public Conexion(string host, string port, string user, string pass, string dbName)
        {
            this.host = host;
            this.port = port;
            this.user = user;
            this.pass = pass;
            this.dbName = dbName;
            cadCon = "datasource="+host +";port="+ port +";username=" + user + ";password=" + pass + ";database=" + dbName+ ";SslMode=none;";
           
            try
            {
                this.conexionConServidor = new MySqlConnection(cadCon);
            }
            catch(Exception ex)
            {
                Console.WriteLine("[ERROR] NO SE PUEDE ABRIR CONECCION");
            }
            this.conexionConServidor.Close();
        }

        // realizar una consulta select *
        public MySqlDataReader ConsultaSelectAllFrom( string tableName )
        {
            string Consulta = "SELECT * FROM " + tableName + ";";
            this.comando = new MySqlCommand(Consulta, this.conexionConServidor);

            MySqlDataReader lector = this.comando.ExecuteReader();
            return lector;
        }

        public MySqlDataReader ConsultaSelectAllCompuesta(string tableName, string criteria)
        {
            string Consulta = "SELECT * FROM " + tableName + " "+ criteria +  " ;";
            this.comando = new MySqlCommand(Consulta, this.conexionConServidor);

            MySqlDataReader lector = this.comando.ExecuteReader();
            return lector;
        }
        public int ConsultaGuardar(string tableName, string consulta)
        {
            string Consulta = "INSERT INTO "+ tableName + " "+consulta;
            this.comando = new MySqlCommand(Consulta, this.conexionConServidor);
            return this.comando.ExecuteNonQuery();

        }

        public void ConsultaEliminar(string tableName, string condicion)
        {
            string Consulta = "DELETE FROM  "+tableName+" WHERE "+condicion+";";
            this.comando = new MySqlCommand(Consulta, this.conexionConServidor);

            this.comando.ExecuteNonQuery();
            
        }

        public void llenarGridV(string tableName, DataGridView DG )
        {
            string Consulta = "SELECT * FROM " + tableName +  "; ";
            this.comando = new MySqlCommand(Consulta, this.conexionConServidor);
            MySqlDataAdapter da = new MySqlDataAdapter(comando);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DG.DataSource = dt;
        }


    }
}
