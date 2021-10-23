using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;

namespace TaskManager.Classes
{
    public class MailGonder
    {
        public static string GmailUzerinden(string mailBaslik, string mailIcerik, string aliciPosta, object ekDosya = null)
        {
            string gonderimSonucu = "";

            int mailAdresiSayisi = Regex.Matches(aliciPosta, ";").Count + 1;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("aliceliktaskmanager@gmail.com", "Task Manager"); //gönderici olarak görünen mail bilgileri
            mail.Priority = MailPriority.High;
            mail.Subject = mailBaslik;

            if (mailAdresiSayisi > 1)
            {
                string[] aliciPostaAdresleri = aliciPosta.Split(';');

                for (int i = 0; i < mailAdresiSayisi; i++)
                {
                    string aliciPostaAdresi = aliciPostaAdresleri[i];

                    mail.To.Add(new MailAddress(aliciPostaAdresi, ""));
                }
            }
            else
            {
                mail.To.Add(new MailAddress(aliciPosta, ""));
            }

            mail.Body = mailIcerik;
            mail.IsBodyHtml = true;

            if (ekDosya != null)
            {
                mail.Attachments.Add(new Attachment(ekDosya.ToString()));
            }

            NetworkCredential girisIzni = new NetworkCredential("aliceliktaskmanager@gmail.com", "taskmanager");
            client.EnableSsl = true;
            client.Credentials = girisIzni;



            try
            {
                client.Send(mail);

                gonderimSonucu = "OK";
                return gonderimSonucu;
            }
            catch (Exception ex)
            {
                //ex.Message.ToString();
                gonderimSonucu = ex.Message;
                return gonderimSonucu;
            }
        }

    }
}