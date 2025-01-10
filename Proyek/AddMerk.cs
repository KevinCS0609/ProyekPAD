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

namespace Manager
{

    
    public partial class AddMerk : Form
    {

        MySqlConnection conn = koneksi.getConn();
        public AddMerk()
        {
            InitializeComponent();
        }

        private void LoadData()
        {
            try
            {
                string query = "SELECT * FROM merk";
                MySqlDataAdapter adapter = new MySqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                dataGridView2.DataSource = dt;
            }
            catch
            {

            }
        }

        private void AddMerk_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string checkQuery = "SELECT COUNT(*) FROM merk WHERE nama_merk = @nama";
                MySqlCommand checkCmd = new MySqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@nama", textBox1.Text);
                int count = Convert.ToInt32(checkCmd.ExecuteScalar());

                if (count > 0)
                {
                    // Jika nama merk sudah ada, tampilkan pesan
                    MessageBox.Show("Nama merk sudah digunakan. Silakan gunakan nama lain.", "Duplikasi Nama Merk", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    koneksi.closeConn();
                    this.Close();
                }
                else
                {
                    // Jika nama merk belum ada, lakukan proses insert
                    string query = "INSERT INTO merk (nama_merk) VALUES (@nama)";
                    MySqlCommand cmd = new MySqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@nama", textBox1.Text);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Data merk berhasil ditambahkan.", "Sukses", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
