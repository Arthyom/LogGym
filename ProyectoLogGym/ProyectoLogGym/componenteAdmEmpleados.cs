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
    public partial class componenteAdmEmpleados : UserControl
    {
        Conexion Cn1 = new Conexion("localhost", "3306", "root", "", "GYM");
        public componenteAdmEmpleados()
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
            string consulta  = " (Nombre_empleado, Horario_trabajo, Ocupacion) ";
            consulta = "VALUES('" + txtNombreAdd.Text + "','" + txtHorario.Text + "','"+ txtOcupacion.Text + "');";

          
            if (txtNombreAdd.Text != string.Empty || txtHorario.Text != string.Empty || txtOcupacion.Text != string.Empty)
            {
                Cn1.conexionConServidor.Open();
                try
                {
                    Cn1.ConsultaGuardar("usuarios", consulta);
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
                MessageBox.Show("Hace falta llenar un campo");
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            
            if (txtNombreDel.Text != string.Empty && Int32.TryParse(txtNombreDel.Text, out int i))
            {
                Cn1.conexionConServidor.Open();
                try
                {
                    if (Int32.Parse(txtNombreDel.Text) != 1)
                    {
                        Cn1.ConsultaEliminar("login", " Usuarios_IdEmpleado =" + Int32.Parse(txtNombreDel.Text));
                        Cn1.ConsultaEliminar("usuarios", " IdEmpleado =" + Int32.Parse(txtNombreDel.Text));
                    }

                }
                catch (Exception ee)
                {
                    txtNombreDel.Text = string.Empty;
                    MessageBox.Show("Error: no existe el producto, o digito mal el nombre"+ee);
                }
                Cn1.conexionConServidor.Close();

                grid();
            }
            else
                txtNombreDel.Text = "";
        }

        private void componenteAdmEmpleados_Load(object sender, EventArgs e)
        {
            grid();
        }

        private void grid()
        {


            string Consulta = "SELECT idEmpleado, NombreEmpleado, FROM usuarios; ";
            Cn1.conexionConServidor.Open();
            Cn1.llenarGridV(Consulta, dataGridView1);
            Cn1.conexionConServidor.Close();
            dataGridView1.Columns[0].HeaderText = "ID";
            dataGridView1.Columns[1].HeaderText = "Nombre";
            dataGridView1.Columns[2].HeaderText = "Horario";
            dataGridView1.Columns[2].HeaderText = "Ocupacion";

        }
    }
}
