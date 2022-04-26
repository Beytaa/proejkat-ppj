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
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }
        public string kon = Login.konekcioniString;
      

        private void PrikazKupaca()
        {
            try
            {
                string kveri = "SELECT kupac_id AS 'ID kupca', ime AS 'Ime', prezime AS 'Prezime', grad AS 'Grad', adresa AS 'Adresa', telefon AS 'Telefon', user as 'Username', pass as 'Šifra' FROM kupac WHERE kupac_id = kupac_id ";
               
                

                if (textBoxIme.Text != "" )
                {
                    kveri += " AND ime LIKE '%" + textBoxIme.Text + "%' ";
                }
             
                
                if (textBoxPrezime.Text != "" )
                {
                    kveri += " AND prezime LIKE '%" + textBoxPrezime.Text + "%' ";
                }
                

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
        private void Kreiranje()
        {
            try
            {
                string kveri = "INSERT INTO kupac(ime, prezime, grad, adresa, telefon, user, pass) VALUES " +
                   " ('" + textBox3.Text + "', '" + textBox6.Text + "', '" + textBox10.Text + "', " +
                    " '" + textBox7.Text + "', '" + textBox5.Text + "', '" + textBox4.Text + "', '" + textBox2.Text + "') ";


                MySqlConnection konekcija = new MySqlConnection(kon);

                konekcija.Open();
                MySqlCommand cmd = new MySqlCommand(kveri, konekcija);

                cmd.ExecuteNonQuery();
                MessageBox.Show("Kreiran je novi kupac");


                konekcija.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }
        private void Ažuriranje()
        {
            try
            {
                string kveri = "UPDATE kupac SET " +
                      " ime='" + textBox3.Text + "', " +
                    " prezime='" + textBox6.Text + "', " +
                    " grad='" + textBox10.Text + "', " +
                    " adresa='" + textBox7.Text + "', " +
                    " telefon='" + textBox5.Text + "', " +
                    " user='" + textBox4.Text + "', " +
                    " pass='" + textBox2.Text + "' " +
                    " WHERE kupac_id='" + textBox1.Text + "' ";


                MySqlConnection konekcija = new MySqlConnection(kon);
                konekcija.Open();

                MySqlCommand cmd = new MySqlCommand(kveri, konekcija);

                cmd.ExecuteNonQuery();

                MessageBox.Show("Podaci za kupca ID=" + textBox1.Text + " su ažurirani!");

                konekcija.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        

        private void buttonKreiranje_Click(object sender, EventArgs e)
        {
            Kreiranje();
        }

        private void buttonAzuriranje_Click(object sender, EventArgs e)
        {
            Ažuriranje();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            PrikazKupaca();
        }

        private void Form2_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void artikliToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form3 fr3 = new Form3();
            this.Hide();
            fr3.Show();
        }

        private void narudžbeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form4 fr4 = new Form4();
            this.Hide();
            fr4.Show();
        }

        private void textBoxIme_TextChanged(object sender, EventArgs e)
        {
            PrikazKupaca();
        }

        private void textBoxPrezime_TextChanged(object sender, EventArgs e)
        {
            PrikazKupaca();
        }

    }
}
