using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ProyectoLogGym
{
    public partial class componenteAdmProducto : UserControl
    {

        Conexion Cn1 = new Conexion("localhost", "3306", "root", "", "mydb");
        public componenteAdmProducto()
        {
            InitializeComponent();

            dataGridView1.SelectionChanged += (ss, ee) => {
                txtNombreDel.Text = dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString();
            };
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string consulta = "(Nombre del producto, Presio del producto) VALUES ('" + txtNombreAdd.Text + "','" + txtPrecio + "');";
            if (txtNombreAdd.Text != string.Empty || txtPrecio.Text != string.Empty)
            {
                //Cn1.conexionConServidor.Open();
                if (Cn1.ConsultaGuardar("Productos", consulta) == 0) {
                    MessageBox.Show("No se agrego");
                }

                //Cn1.conexionConServidor.Close();

            }

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {

            string consulta = " Nombre del producto ='" + txtNombreDel.Text+"';";
            if (txtNombreDel.Text != string.Empty)
            {
                //Cn1.conexionConServidor.Open();
                try
                {
                  Cn1.ConsultaGuardar("Productos", consulta);
                    
                }
                catch (Exception)
                {
                    txtNombreDel.Text = string.Empty;
                    MessageBox.Show("Error: no existe el producto, o digito mal el nombre");
                }
                //Cn1.conexionConServidor.Close();
            }
        }

        
        private void componenteAdmProducto_Load(object sender, EventArgs e)
        {
            //Cn1.conexionConServidor.Open();
            //Cn1.llenarGridV("Productos",dataGridView1);
            //Cn1.conexionConServidor.Close();
        }
    }
}
