using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Gma.QrCodeNet.Encoding;
using Gma.QrCodeNet.Encoding.Windows.Render;

using AForge.Video;
using AForge.Video.DirectShow;

using BarcodeLib.BarcodeReader;

using ZXing;

using MySql.Data.MySqlClient;


namespace ProyectoLogGym
{
    public partial class Form1 : Form
    {
        private FilterInfoCollection DispositivosVideo;
        private VideoCaptureDevice VideoFinal;

        // crear varias conexiones para realizar mas de una consulta a la vez
        private Conexion conActual = new Conexion("localhost", "3306", "root", "", "gym");
        private Conexion conActual2 = new Conexion("localhost", "3306", "root", "", "gym");
        private Conexion conActual3 = new Conexion("localhost", "3306", "root", "", "gym");



        public Form1()
        {
            InitializeComponent();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // preparar para capturar video 
            this.DispositivosVideo = new FilterInfoCollection(FilterCategory.VideoInputDevice);
            this.VideoFinal        = new VideoCaptureDevice();

            Fill_Products();
        }

        private void Fill_Products()
        {
            // conseguir todos los productos y llenar el combo de productos
            this.conActual.conexionConServidor.Open();
            this.conActual2.conexionConServidor.Open();
            MySqlDataReader lectr2 = this.conActual2.ConsultaSelectAllFrom("productos");
            MySqlDataReader lectr = this.conActual.ConsultaSelectAllFrom("inventario");
            while ( lectr2.Read() && lectr.Read() )
                if(Convert.ToInt32( lectr[2]) > 0 )
                    this.comboBox1.Items.Add(lectr2["Nombre_producto"]);
            this.conActual2.conexionConServidor.Close();
            this.conActual.conexionConServidor.Close();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
           // Application.Exit();
        }

        // cuando el formulario se este cerrando
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (this.VideoFinal.IsRunning == true) this.VideoFinal.Stop();
            Application.Exit();
        }

        // terminar grabacion
        private void button2_Click(object sender, EventArgs e)
        {
    
        }

        //iniciar/terminar grabacion
        private void button1_Click(object sender, EventArgs e)
        {
            if (this.VideoFinal.IsRunning == true)
            {
                this.timer1.Enabled = false;
                this.VideoFinal.Stop();
                this.videoSourcePlayer1.SignalToStop();
               
                
                label8.Text = "Apagado";
                this.Refresh();
                return;
            }
            timer1.Enabled = true;
            this.VideoFinal = new VideoCaptureDevice(this.DispositivosVideo[0].MonikerString);
            this.videoSourcePlayer1.VideoSource = this.VideoFinal;
            this.videoSourcePlayer1.Start();
        }

  

        private void timer1_Tick(object sender, EventArgs e)
        {
            //asegurar una imagen en el control
            if(this.videoSourcePlayer1.GetCurrentVideoFrame() != null)
            {
                // conseguir los frames de la imagen
                Bitmap img = new Bitmap(this.videoSourcePlayer1.GetCurrentVideoFrame());

                // leer el codigo
                string[] resultado = BarcodeLib.BarcodeReader.BarcodeReader.read(img, BarcodeLib.BarcodeReader.BarcodeReader.QRCODE);
                              
                // quitar la imagen de la memoria
                img.Dispose();

                // conseguir el resultado
                if (resultado != null)
                {
                    if (resultado.Length != 3)
                    {
                        try
                        {                     
                            string res = resultado[0];
                            string[] sli = res.Split(' ');

                            // crear una consulta para buscar nombre e identificador
                            // verificar que el cliente exista en la base de datos
                            this.conActual.conexionConServidor.Open();
                            MySqlDataReader r = this.conActual.ConsultaSelectAllCompuesta("clientes", " WHERE idCliente = " + sli[1] + " ");
                            
                            if (r.HasRows)
                            {
                                label8.Text = "Aceptado";
                                label8.BackColor = Color.Green;
                            }
                            else
                            {
                                label8.Text = "Rechazado";
                                label8.BackColor = Color.Red;
                            }

                            this.conActual.conexionConServidor.Close();
                        }
                        catch (Exception ex) {; }
                    }

                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void splitContainer1_Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer1_Panel2_Paint_1(object sender, PaintEventArgs e)
        {

        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (this.splitContainer1.Panel2Collapsed)
            {
                this.splitContainer1.Panel2Collapsed = false;
                this.splitContainer1.Panel1Collapsed = true;
            }
            else
            {
                this.splitContainer1.Panel2Collapsed = true;
                this.splitContainer1.Panel1Collapsed = false;
            }
        }

        private void splitContainer1_Panel2_Paint_2(object sender, PaintEventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.button1_Click(sender,e);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // agregar datos del campo a la lista de venta
            this.listView1.Items.Add(this.comboBox1.Text);
        }

        private void comboBox1_Click(object sender, EventArgs e)
        {
            
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // cuando el valor del combo sea cambiado
        private void comboBox1_SelectionChangeCommitted(object sender, EventArgs e)
        {
            // conseguir valor de la caja de texto
            this.conActual.conexionConServidor.Open();
            this.conActual2.conexionConServidor.Open();

            MySqlDataReader lector = this.conActual.ConsultaSelectAllCompuesta("productos", " WHERE Nombre_producto = '" + comboBox1.Text + "'");
  

            if ( lector.HasRows && lector.Read() )
            {
                MySqlDataReader lector2 = this.conActual2.ConsultaSelectAllCompuesta("inventario", " WHERE idProducto = " + lector[0].ToString() + "");
                if(lector2.HasRows && lector2.Read() && Convert.ToUInt32(lector2["Cantidad_En_Almacen"]) > 0)
                {
                    //conseguir la informacion del item seleccionado
                    ListViewItem nuevoItem = new ListViewItem(lector["Nombre_producto"].ToString());
                    nuevoItem.SubItems.Add(lector["PresioUnitario"].ToString());
                    nuevoItem.SubItems.Add("1");

                    listView1.Items.Add(nuevoItem);
                }
            }
            this.conActual.conexionConServidor.Close();
            this.conActual2.conexionConServidor.Close();

            this.textBox1.Text = calcular().ToString();
        }

        private void listView1_ItemChecked(object sender, ItemCheckedEventArgs e)
        {
            if (e.Item.Checked)
            {
                listView1.Items.Remove(e.Item);
                this.textBox1.Text = calcular().ToString();
            }
        }

        private double calcular()
        {
            double total = 0;
            // recorrer el listado en buscar de los precios
            foreach( ListViewItem it in this.listView1.Items)         
                total += Convert.ToDouble(it.SubItems[1].Text);
            return total;
        }

        private void listView1_ItemCheck(object sender, ItemCheckEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged_1(object sender, EventArgs e)
        {

        }

        // calcular el cambio
        private void textBox2_Leave(object sender, EventArgs e)
        {
            if( this.textBox2.Text != "")
                this.textBox3.Text = ( Convert.ToDouble(textBox2.Text) - Convert.ToDouble(textBox1.Text) ).ToString();
            
        }

        // vender todos los productos agregados a las lista
        private void button2_Click_1(object sender, EventArgs e)
        {
            
           
            
            foreach ( ListViewItem it in listView1.Items )
            {
                // verificar que el producto seleccionado exista en la base de datos 
                this.conActual2.conexionConServidor.Open();
                this.conActual.conexionConServidor.Open();
                MySqlDataReader rd  = this.conActual.ConsultaSelectAllCompuesta("productos",   "WHERE Nombre_producto ='" + it.SubItems[0].Text+"'");
                

                if ( rd.HasRows && rd.Read() )
                {
                    MySqlDataReader rd2 = this.conActual2.ConsultaSelectAllCompuesta("inventario", "WHERE idProducto      = " + rd[0].ToString() + " ");
                    if ( rd2.HasRows && rd2.Read() )
                    {                    
                        // actualizar la existencia del producto
                        string s = "Cantidad_En_Almacen =" + (Convert.ToUInt32(rd2[2]) - 1) + " WHERE idProducto= " + Convert.ToUInt32(rd2[1]);
                        this.conActual3.conexionConServidor.Open();
                        this.conActual3.UpdateGenericTable("inventario", s);
                        this.conActual3.conexionConServidor.Close();
                    }
                }

                this.conActual.conexionConServidor.Close();
                this.conActual2.conexionConServidor.Close();
            }
            
           
            

            this.comboBox1.Items.Clear();
            this.listView1.Items.Clear();
            this.Fill_Products();
        }

        // cuando se pulse el boton de registrar
        private void button1_Click_1(object sender, EventArgs e)
        {
            // verificar que el cliente exista en la base de datos
            this.conActual.conexionConServidor.Open();
            MySqlDataReader r = this.conActual.ConsultaSelectAllCompuesta("clientes", " WHERE idCliente = " + textBox4.Text + " ");

            try
            {
                if (r.HasRows)
                {
                    this.label1.Text = "Aceptado";
                    this.label1.BackColor = Color.Green;
                }
                else
                {
                    this.label1.Text = "Rechazado";
                    this.label1.BackColor = Color.Red;
                }
            }
            catch( Exception ex)
            {
                ;
            }

            this.conActual.conexionConServidor.Close();
        }

    }
}
