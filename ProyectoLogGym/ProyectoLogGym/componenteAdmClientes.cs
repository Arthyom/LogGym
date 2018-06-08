using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ProyectoLogGym
{
    public partial class componenteAdmClientes : UserControl
    {
        Conexion Cn1 = new Conexion("localhost", "3306", "root", "", "mydb");
        public componenteAdmClientes()
        {
            InitializeComponent();
            dataGridView1.SelectionChanged += (ss, ee) => {
                try
                {
                    txtID.Text = dataGridView1.Rows[dataGridView1.CurrentRow.Index].Cells[0].Value.ToString();
                }
                catch (Exception)
                {

                    txtID.Text = dataGridView1.Rows[0].Cells[0].Value.ToString();
                }

            };
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string consulta = " (Nombre_cliente,Tipo_pago,MontoAcobrar,Fecha_ingreso,Venta_has_Productos_Venta_IdProducto,Venta_has_Productos_Productos_IdProducto) ";
                consulta += "VALUES('" + txtNombreAdd.Text + "','" +  txtTipo.Text + "'," + Int32.Parse(txtMonto.Text) + ",'" + txtIngreso.Text + "',1000,1000);";
            if (txtNombreAdd.Text != string.Empty || txtMonto.Text != string.Empty|| txtTipo.Text != string.Empty || txtIngreso.Text!=string.Empty || Int32.TryParse(txtMonto.Text,out int i))
            {
                Cn1.conexionConServidor.Open();
                try
                {
                    Cn1.ConsultaGuardar("clientes", consulta);
                }
                catch (Exception)
                {

                    MessageBox.Show("No se guardo el reguistro");
                }

                Cn1.conexionConServidor.Close();
                grid();

            }
            else
            {
                MessageBox.Show("Hace falta llenar un campo o se equiboco del tipo de dato");
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {

        }
        private void grid()
        {


            string Consulta = "SELECT * FROM productos; ";
            Cn1.conexionConServidor.Open();
            Cn1.llenarGridV(Consulta, this.dataGridView1);
            Cn1.conexionConServidor.Close();
            /*   dataGridView1.Columns[0].HeaderText = "ID";
               dataGridView1.Columns[1].HeaderText = "Nombre";
               dataGridView1.Columns[2].HeaderText = "Tipo de pago";
               dataGridView1.Columns[3].HeaderText = "Monto a cobrar";
               dataGridView1.Columns[4].HeaderText = "Fecha";*/

        }

        private void componenteAdmClientes_Load(object sender, EventArgs e)
        {
            grid();
        }
    }
}
