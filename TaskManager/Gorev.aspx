<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gorev.aspx.cs" MasterPageFile="~/Site.Master" Inherits="TaskManager.Gorev" %>


<asp:Content ID="GorevContent" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="font-awesome-4.5.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="js/chosen/docsupport/prism.css" />
    <link rel="stylesheet" href="js/chosen/chosen.css" />

    <link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.datepick.js"></script>
    <script type="text/javascript" src="js/jquery.datepick-tr.js"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
                    <asp:Label ID="lblIslemSonuc" runat="server"></asp:Label>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">

                <div class="header">
                    <h2>Görev Listesi</h2>

                </div>

                <div class="body table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th style="width: 15%;">Görev Başlığı</th>
                            <th style="width: 15%;">Görev İçeriği</th>
                            <th style="width: 15%;">Görev Bitiş Tarihi</th>
                            <th style="width: 15%;">Görev Kullanici</th>
                            <th style="width: 10%;">Aciliyet</th>
                            <th style="width: 10%;">Öncelik</th>
                            <th style="width: 10%;">Durumu</th>
                            <th style="width: 10%;"></th>
                        </tr>
                        <asp:ListView ID="lvListe" runat="server">
                            <ItemTemplate>
                                <tr <%#Eval("Aciliyet").ToString()=="0"  && Eval("Oncelik").ToString()=="0" && Eval("Status").ToString()!="2" ? " style=\"background-color:#9de498;color:black; \"" : 
                                        Eval("Aciliyet").ToString()=="0"  && Eval("Oncelik").ToString()=="1" && Eval("Status").ToString()!="2" ? " style=\"background-color:#fdf17e;color:black;\"" :
                                        Eval("Aciliyet").ToString()=="1"  && Eval("Oncelik").ToString()=="0" && Eval("Status").ToString()!="2" ? " style=\"background-color:#ffa556;color:black;\"" :
                                        Eval("Aciliyet").ToString()=="1"  && Eval("Oncelik").ToString()=="1" && Eval("Status").ToString()!="2" ? " style=\"background-color:#fd7755;color:black;\"" :
                                         Eval("Status").ToString()=="2" ? "": ""
                                        %>>
                                    <td><b><%#Eval("TaskBaslik") %></b></td>
                                    <td><%#Eval("TaskIcerik") %></td>
                                    <td><%#Eval("TaskBitisTarih") %></td>
                                    <td><%#Eval("KullaniciAd") %></td>
                                    <td><%#Eval("Aciliyet").ToString()=="0" ? "Acil Değil" :" Acil" %></td>
                                    <td><%#Eval("Oncelik").ToString()=="0" ? "Öncelikli Değil" :"Öncelikli" %></td>
                                    <td><%#Eval("Status").ToString()=="0" ? "Devam Ediyor" :Eval("Status").ToString()=="1" ? "Beklemede":Eval("Status").ToString()=="2" ? "Tamamlandı" :"" %></td>

                                    <td style="text-align:right; "><%#Eval("Status").ToString()=="0"  ? "<a href=\"Gorev.aspx?TaskId="+Eval("TaskId")+"&islem=Ok\" class=\"buton gri\"title=\"Görevi Tamamla\"  style=\"background-color: white; width:25%;height:100%; text-align:center;\" onclick=\"return confirm('Görev Tamamlandı?');\"><i class=\"fa fa-check\"></i></a><a href=\"Gorev.aspx?TaskId="+Eval("TaskId")+"&islem=Hold\" class=\"buton gri\"title=\"Görevi Beklemeye Al\"  style=\"background-color: white; width:25%;height:100%; text-align:center;\" onclick=\"return confirm('Görev Beklemede?');\"><i class=\"fa fa-clock-o\"></i></a>" : 
                                                                  Eval("Status").ToString()=="1"  ? "<a href=\"Gorev.aspx?TaskId="+Eval("TaskId")+"&islem=Ok\" class=\"buton gri\"title=\"Görevi Tamamla\"  style=\"background-color: white; width:25%;height:100%; text-align:center;\" onclick=\"return confirm('Görev Tamamlandı?');\"><i class=\"fa fa-check\"></i></a>" : "" %>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </table>

                </div>
            </div>
        </div>
    </div>
      <script src="plugins/momentjs/moment.js"></script>
    <script src="plugins/momentjs/moment-with-locales.min.js"></script>

    <!-- Bootstrap Material Datetime Picker Plugin Js -->
    <script src="plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>

    <!-- Autosize Plugin Js -->
    <script src="plugins/autosize/autosize.js"></script>

    <script src="js/fancybox/jquery.fancybox.js?v=2.1.4" type="text/javascript"></script>
    <script src="js/fancybox/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
    <link href="js/fancybox/jquery.fancybox.css?v=2.1.4"" rel="stylesheet" type="text/css" />  

    <script src="js/chosen/chosen.jquery.js" type="text/javascript"></script>
    <script src="js/chosen/docsupport/prism.js" type="text/javascript" charset="utf-8"></script>
</asp:Content>

