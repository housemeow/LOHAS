using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using System.Text;
using System.Net.Mail;
using System.Net.Mime;

/// <summary>
/// MailWebService 的摘要描述
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// 若要允許使用 ASP.NET AJAX 從指令碼呼叫此 Web 服務，請取消註解下一行。
[System.Web.Script.Services.ScriptService]
public class MailWebService : System.Web.Services.WebService {

    public MailWebService () {

        //如果使用設計的元件，請取消註解下行程式碼 
        //InitializeComponent(); 
    }

    [WebMethod]
    public void sendMail(Mail mail) {

        MailMessage mailMessage = new MailMessage();
        mailMessage.From = new MailAddress(mail.senderAddress);
        mailMessage.To.Add(new MailAddress(mail.receiverAddress));

        mailMessage.Subject = mail.subject;
        mailMessage.SubjectEncoding = Encoding.UTF8;

        ContentType mimeType = new ContentType("text/html");
        AlternateView alternate = AlternateView.CreateAlternateViewFromString(mail.message, mimeType);
        mailMessage.AlternateViews.Add(alternate);

        string smtpServer = "smtp.gmail.com";
        int smtpPort = 587;

        string username = "www99590306@gmail.com";
        string password = "www99590306";
        SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);
        smtpClient.Credentials = new System.Net.NetworkCredential(username, password);
        smtpClient.EnableSsl = true;

        smtpClient.Send(mailMessage);

        
    }

    public class Mail {
        public string receiverName;
        public string receiverAddress;
        public string senderName;
        public string senderAddress;
        public string subject;
        public string message;
    }
}
