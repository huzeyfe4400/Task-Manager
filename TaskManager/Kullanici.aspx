<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kullanici.aspx.cs" Inherits="TaskManager.Kullanici" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <script src="js/owl.carousel.js"></script>
    <link href="css/animate.min.css" rel="stylesheet" />
    <link href="css/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="carousel/css/owl.carousel.min.css" rel="stylesheet">
    <link href="carousel/css/owl.theme.default.min.css" rel="stylesheet">
    <script src="carousel/js/jquery.min.js"></script>
    <script src="carousel/js/owl.carousel.min.js"></script>



</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">

                <div class="header">
                    <h2>Kullanıcı Listesi</h2>

                </div>

                <div class="body table-responsive">
                    <table class="table table-striped">
                        <tr>
                            <th style="width: 20%;">Kullanıcı Ad</th>
                            <th style="width: 20%;">Kullanıcı Soyad</th>
                            <th style="width: 20%;">Kullanıcı Tip</th>
                            <th style="width: 20%;">Kullanıcı Eposta</th>
                            <th style="width: 20%;"></th>
                        </tr>
                        <asp:ListView ID="lvListe" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("KullaniciAd") %></td>
                                    <td><%#Eval("KullaniciSoyad") %></td>
                                    <td><%#Eval("KullaniciTip") %></td>
                                    <td><%#Eval("KullaniciEposta") %></td>
                                    <td></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </table>

                  <%--  <asp:LinkButton ID="btnKaydet" runat="server" CssClass="btn bg-blue waves-effect" OnClick="test_Click"><i class="material-icons">check</i>
                                    <span>KAYDET</span></asp:LinkButton>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



