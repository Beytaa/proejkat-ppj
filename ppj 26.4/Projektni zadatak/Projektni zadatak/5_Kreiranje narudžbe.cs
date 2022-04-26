using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
namespace Projektni_zadatak
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }
        public string kon = Login.konekcioniString;

        private void PregledArtikala()
        {
            try
            {
                string kveri = "SELECT a.artikal_id AS 'ID artikla', s.naziv_artikla AS 'Naziv artikla', s.kolicina as 'Kolicina', a.cijena as 'Cijena' FROM skladiste s, artikal a WHERE a.artikal_id = s.artikal_id";

                MySqlConnection konekcija = new MySqlConnection(kon);

                konekcija.Open();

                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(kveri, konekcija);

                DataTable tabela = new DataTable();

                dataAdapter.Fill(tabela);
                dataGridView1.DataSource = tabela;
                dataAdapter.Dispose();
                konekcija.Close();

            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void KorpaDodaj()
        {
            try
            {
                string kveri = "SELECT a.artikal_id AS 'ID artikla', s.naziv_artikla AS 'Naziv artikla', s.kolicina as 'Kolicina', a.cijena as 'Cijena' FROM skladiste s, artikal a WHERE a.artikal_id = s.artikal_id";

                MySqlConnection konekcija = new MySqlConnection(kon);

                konekcija.Open();

                MySqlDataAdapter dataAdapter = new MySqlDataAdapter(kveri, konekcija);

                DataTable tabela = new DataTable();

                dataAdapter.Fill(tabela);
                dataGridView1.DataSource = tabela;
                dataAdapter.Dispose();
                konekcija.Close();

            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void Form5_Load(object sender, EventArgs e)
        {
            PregledArtikala();
        }
    }
}
