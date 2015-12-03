using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;
using MySql.Data.MySqlClient;
using System.Collections;

namespace WindowsFormsApplication12
{
    public partial class Form1 : Form
    {
        string[] kamus;
        string connectionSQL = "server=localhost;database=stemmingIndo;uid=root;password=;";
        public Form1()
        {
            InitializeComponent();
        }

        private int menghitungJumlah(string sQuery)
        {

            int jumlah = 0;
            MySqlConnection db = new MySqlConnection(connectionSQL);
            db.Open();
            MySqlCommand dbcmd = db.CreateCommand();
            string sql = sQuery;
            dbcmd.CommandText = sql;
            MySqlDataReader reader = dbcmd.ExecuteReader();
            while (reader.Read())
            {
                jumlah = Convert.ToInt16(reader.GetString(0));
            }
            db.Close();
            return jumlah;
        }

        private void listKamus()
        {
            MySqlConnection db = new MySqlConnection(connectionSQL);
            db.Open();
            MySqlCommand dbcmd = db.CreateCommand();
            string sql = "SELECT rootword FROM tb_rootword";
            dbcmd.CommandText = sql;
            MySqlDataReader reader = dbcmd.ExecuteReader();
            int banyak = menghitungJumlah("SELECT count(*) FROM tb_rootword");
            kamus = new String[banyak];
            int i = 0;
            while (reader.Read())
            {
                kamus[i] = reader.GetString(0).ToString();              
                i++;
            }
            db.Close();

        }     

        private bool cekKataDasar(string kata)
        {
            int banyak = menghitungJumlah("SELECT count(*) FROM tb_rootword");
            //MessageBox.Show(banyak.ToString());
            for (int i = 0; i < banyak - 1; i++)
            {
                if (kata == kamus[i])
                {
                    return true;
                }
            }
            return false;
        }

        private string HapusAkhiran(string kata)
        {

            Match matchkahlah = Regex.Match(kata, @"([A-Za-z]+)([klt]ah|pun|ku|mu|nya)$", RegexOptions.IgnoreCase);
            if (matchkahlah.Success)
            {
                string key = matchkahlah.Groups[1].Value;

                return HapusAkhiranKepunyaan(key);
            } 

            return HapusAkhiranKepunyaan(kata);
        }

        private string HapusAkhiranKepunyaan(string kata) 
        {             
            Match matchkahlah = Regex.Match(kata, @"([A-Za-z]+)(nya|[km]u)$", RegexOptions.IgnoreCase);
            if (matchkahlah.Success)
            {
                string key = matchkahlah.Groups[1].Value;
                
                return key;
            }
            return kata;
        }

        private string HapusAkhiranIAnKan(string kata)
        {
            string kataasal = kata;

            if (Regex.IsMatch(kata, "(kan)$"))
            {
                string kata1 = Regex.Replace(kata, "(kan)$", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }

            }

            if (Regex.IsMatch(kata, "(i|an)$"))
            {
                string kata2 = Regex.Replace(kata, "(i|an)$", "");
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }

            }
            return kataasal;
        }

     
        private string hapus_derivation_prefix(string kata)
        {
            string kataasal = kata;
            if (Regex.IsMatch(kata, "^(di|[ks]e)"))
            {               
                string kata1 = Regex.Replace(kata, "^(di|[ks]e)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }

                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }

         
            #region cek te- me- be- pe-
            if (Regex.IsMatch(kata, "^([tmbp]e)")) //cek te- me- be- pe-
            {
                #region awalan be-

                if (Regex.IsMatch(kataasal, "^(be)"))
                {
                    if (Regex.IsMatch(kataasal, "^(ber)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(ber)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(ber)", "r");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }

                    if (Regex.IsMatch(kata, "^(ber)[^aiueor][A-Za-z](?!er)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(ber)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }

                    if (Regex.IsMatch(kata, "^(ber)[^aiueor][A-Za-z]er[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(ber)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }

                    if (Regex.IsMatch(kata, "^(belajar)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(bel)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(ber)[^aiueor]er[^aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(be)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }


                }

                #endregion

                #region awalan te-
                if (Regex.IsMatch(kata, "^(te)"))
                {
                    if (Regex.IsMatch(kata, "^(terr)"))
                    {
                        return kata;
                    }
                    if (Regex.IsMatch(kata, "^(ter)[aioue]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(ter)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(ter)", "r");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    //teko kene
                }
                if (Regex.IsMatch(kata, "^(ter)[^aiueor]er[aiueo]"))
                {
                    string kata1 = Regex.Replace(kata, "^(ter)", "");
                    if (cekKataDasar(kata1))
                    {
                        return kata1;
                    }
                    string kata2 = HapusAkhiranIAnKan(kata1);
                    if (cekKataDasar(kata2))
                    {
                        return kata2;
                    }
                }
                if (Regex.IsMatch(kata, "^(ter)[^aiueor](?!er)"))
                {
                    string kata1 = Regex.Replace(kata, "^(ter)", "");
                    if (cekKataDasar(kata1))
                    {
                        return kata1;
                    }
                    string kata2 = HapusAkhiranIAnKan(kata1);
                    if (cekKataDasar(kata2))
                    {
                        return kata2;
                    }
                }
                if (Regex.IsMatch(kata, "^(te)[^aiueor]er[aiueo]"))
                {
                    string kata1 = Regex.Replace(kata, "^(te)", "");
                    if (cekKataDasar(kata1))
                    {
                        return kata1;
                    }
                    string kata2 = HapusAkhiranIAnKan(kata1);
                    if (cekKataDasar(kata2))
                    {
                        return kata2;
                    }
                }
                if (Regex.IsMatch(kata, "^(ter)[^aiueor]er[^aiueo]"))
                {
                    string kata1 = Regex.Replace(kata, "^(ter)", "");
                    if (cekKataDasar(kata1))
                    {
                        return kata1;
                    }
                    string kata2 = HapusAkhiranIAnKan(kata1);
                    if (cekKataDasar(kata2))
                    {
                        return kata2;
                    }
                }

                #endregion

                #region awalan me-
                if (Regex.IsMatch(kata, "^(me)"))
                {
                    if (Regex.IsMatch(kata, "^(me)[lrwyv][aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(me)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(mem)[bfvp]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(mem)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(mem)((r[aiueo])|[aiueo])"))
                    {
                        string kata1 = Regex.Replace(kata, "^(mem)", "m");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(mem)", "p");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }

                    }
                    if (Regex.IsMatch(kata, "^(men)[cdjszt]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(men)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(men)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(men)", "n");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(men)", "t");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(meng)[ghqk]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(meng)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(meng)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(meng)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(meng)", "k");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(menge)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(meny)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(meny)", "s");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(me)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                }
                #endregion

                #region awalan pe-
                if (Regex.IsMatch(kata, "^(pe)"))
                {
                    if (Regex.IsMatch(kata, "^(pe)[wy]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pe)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(per)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(per)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(per)", "r");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(per)[^aiueor][A-Za-z](?!er)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(per)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(per)[^aiueor][A-Za-z](er)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(per)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pembelajaran)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pembelajaran)", "ajar");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pem)[bfv]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pem)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pem)(r[aiueo]|[aiueo])"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pem)", "m");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(pem)", "p");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pen)[cdjzt]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pen)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pen)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pen)", "n");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(pen)", "t");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(peng)[^aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(peng)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(peng)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(peng)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(peng)", "k");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(penge)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(peny)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(peny)", "s");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                        kata1 = Regex.Replace(kata, "^(pe)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pel)[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pel)", "l");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pelajar)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pel)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pe)[^rwylmn]er[aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pe)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pe)[^rwylmn](?!er)"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pe)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                    if (Regex.IsMatch(kata, "^(pe)[^aiueo]er[^aiueo]"))
                    {
                        string kata1 = Regex.Replace(kata, "^(pe)", "");
                        if (cekKataDasar(kata1))
                        {
                            return kata1;
                        }
                        string kata2 = HapusAkhiranIAnKan(kata1);
                        if (cekKataDasar(kata2))
                        {
                            return kata2;
                        }
                    }
                }
            }

                #endregion
            #endregion

            #region memper- dkk

            if (Regex.IsMatch(kata, "^(memper)"))
            {
                string kata1 = Regex.Replace(kata, "^(memper)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(memper)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }

            if (Regex.IsMatch(kata, "^(mempel)"))
            {
                string kata1 = Regex.Replace(kata, "^(mempel)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(mempel)", "l");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }

            }
            if (Regex.IsMatch(kata, "^(menter)"))
            {
                string kata1 = Regex.Replace(kata, "^(menter)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(menter)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }

            }
            if (Regex.IsMatch(kata, "^(member)"))
            {
                string kata1 = Regex.Replace(kata, "^(member)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(member)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }

            }

            #endregion

            #region diper-
            if (Regex.IsMatch(kata, "^(diper)"))
            {
                string kata1 = Regex.Replace(kata, "^(diper)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(diper)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region diter-
            if (Regex.IsMatch(kata, "^(diter)"))
            {
                string kata1 = Regex.Replace(kata, "^(diter)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(diter)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region dipel-
            if (Regex.IsMatch(kata, "^(dipel)"))
            {
                string kata1 = Regex.Replace(kata, "^(dipel)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(dipel)", "l");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region diber-
            if (Regex.IsMatch(kata, "^(diber)"))
            {
                string kata1 = Regex.Replace(kata, "^(diber)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(diber)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region keber-
            if (Regex.IsMatch(kata, "^(keber)"))
            {
                string kata1 = Regex.Replace(kata, "^(keber)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(keber)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region keter-
            if (Regex.IsMatch(kata, "^(keter)"))
            {
                string kata1 = Regex.Replace(kata, "^(keter)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
                kata1 = Regex.Replace(kata, "^(keter)", "r");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }
            }
            #endregion

            #region berke-
            if (Regex.IsMatch(kata, "^(keter)"))
            {
                string kata1 = Regex.Replace(kata, "^(berke)", "");
                if (cekKataDasar(kata1))
                {
                    return kata1;
                }
                string kata2 = HapusAkhiranIAnKan(kata1);
                if (cekKataDasar(kata2))
                {
                    return kata2;
                }

            }
            #endregion

            //cek awalan di ke se te be me
            if (Regex.IsMatch(kata, "^(di|[kstbmp]e)") == false)
            {
                return kataasal;
            }
            return kataasal;


        }

        private string Stemming(string kata)
        {
            if (cekKataDasar(kata))
            {
                return kata;
            }

            kata = HapusAkhiran(kata);

            kata = HapusAkhiranIAnKan(kata);

            kata = hapus_derivation_prefix(kata);
            
            return kata;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            listKamus();
            string kata;
            kata = textBox1.Text;
            kata = Stemming(kata);
            textBox2.Text = kata;
        }
    }
}
