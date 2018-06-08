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
                try
                {
                    txtNombreDel.Text = dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString();
                }
                catch (Exception)
                {

                    txtNombreDel.Text = dataGridView1.Rows[0].Cells[0].Value.ToString();
                }
                
            };
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            //string consulta = " VALUES ('" + txtNombreAdd.Text + "'," + Int32.Parse(txtPrecio.Text) + ",1);";

            string consulta = " (Nombre_producto,Precio_producto, Inventario_IdProducto) VALUES('" + txtNombreAdd.Text + "'," + Int32.Parse(txtPrecio.Text) + ",2);";
            if (txtNombreAdd.Text != string.Empty || txtPrecio.Text != string.Empty)
            {
                Cn1.conexionConServidor.Open();
                try
                {
                    Cn1.ConsultaGuardar("productos", consulta);
                }
                catch (Exception)
                {

                    MessageBox.Show("No se guardo el reguistro");
                }

                Cn1.conexionConServidor.Close();
                grid();

            }
            else {
                MessageBox.Show("Hace falta llenar un campo");
            }

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {

            string consulta = " IdProducto ='" +txtNombreDel.Text+"'";
            if (txtNombreDel.Text != string.Empty && Int32.TryParse(txtNombreDel.Text, out int i))
            {
                Cn1.conexionConServidor.Open();
                try
                {
                    Cn1.ConsultaEliminar("productos", "IdProducto =" + Int32.Parse(txtNombreDel.Text));

                }
                catch (Exception)
                {
                    txtNombreDel.Text = string.Empty;
                    MessageBox.Show("Error: no existe el producto, o digito mal el nombre");
                }
                Cn1.conexionConServidor.Close();

                grid();
            }
            else
                txtNombreDel.Text = "";
        }

        
        private void componenteAdmProducto_Load(object sender, EventArgs e)
        {
            grid();
        }
        private void grid() {



            Cn1.conexionConServidor.Open();
            Cn1.llenarGridV("productos", dataGridView1);
            Cn1.conexionConServidor.Close();
            dataGridView1.Columns[0].HeaderText = "ID";
            dataGridView1.Columns[1].HeaderText = "Nombre";
            dataGridView1.Columns[2].HeaderText = "Costo";

        }
    }
}
