using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;


namespace ProyectoLogGym
{
    public partial class ComponenteSeguridadLogueo : Form
    {
        // crear una nueva conexion cuando se abre el form
        Conexion Cn1 = new Conexion("localhost", "3306", "root", "", "GYM");

        public ComponenteSeguridadLogueo()
        {
            InitializeComponent();
        }

        private void ComponenteSeguridadLogueo_Load(object sender, EventArgs e)
        {
            // traer todos los registros de la tabla login
            Cn1.conexionConServidor.Open();
            MySqlDataReader consulta = Cn1.ConsultaSelectAllFrom("Usuarios");

            // leer el resultado de la consulta y agregar al combo
            while (consulta.Read())
                this.comboBox1.Items.Add(consulta["NombreEmpleado"]);

            Cn1.conexionConServidor.Close();
        }

        
        private void button1_Click(object sender, EventArgs e)
        {
            string pas = this.textBox1.Text;
            string usr = this.comboBox1.Text;

            string consultaCriterio = " WHERE `NombreEmpleado`='" + usr + "' and `Password` ='" + pas+"'";

            // hacer una consulta selec compuesta 
            Cn1.conexionConServidor.Open();
            MySqlDataReader consulta = Cn1.ConsultaSelectAllCompuesta("`Usuarios`", consultaCriterio);

            if (consulta.HasRows)
            {
                //redirigir a la ventana principal
                Form1 fm1 = new Form1();
                fm1.Show();
                this.Hide();
            }
            else
            {
                this.label3.BackColor = Color.Red;
                this.label3.Text = "Error de Contraseña y usuario";
                this.textBox1.Text = "";
            }

            Cn1.conexionConServidor.Close();
        }
    }
}
