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

        private Conexion conActual = new Conexion("localhosto", "3306", "root", "", "mydb");
       
        

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
                        string res = resultado[0];
                        string[] sli = res.Split(' ');



                        // crear una consulta para buscar nombre e identificador
                        string orden = " WHERE `Nombre del usuario`='" + sli[0] + "' and Contrasena ='" + sli[1] + "'";
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
    }
}
