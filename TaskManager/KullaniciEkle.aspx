<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciEkle.aspx.cs" Inherits="TaskManager.KullaniciEkle" MasterPageFile="~/Site.Master" %>

<asp:Content ID="KullaniciEkleContent" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .bilgiBaslik {
            line-height: 16px;
            padding-top: 0px !important;
            margin-top: 0px !important;
            vertical-align: text-bottom;
            text-align: left;
        }

        .col-sm-2, .col-sm-10 {
            padding-left: 0;
        }

        .input-group {
            margin-bottom: 0px !important;
        }
    </style>

</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Input -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header" style="background-color: #f5f5f5;">
                    <h2>KULLANICI EKLE</h2>
                </div>
                <div class="body">
                    <h2 class="card-inside-title"></h2>

                    <asp:Label ID="lblIslemSonuc" runat="server"></asp:Label>

                    <asp:Panel ID="panelForm" runat="server">

                        <div class="row clearfix">
                            <div class="col-sm-6">
                                <asp:DropDownList ID="dropKullaniciTip" runat="server" CssClass="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="dropKullaniciTip_SelectedIndexChanged" Visible="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="islemHatali" ControlToValidate="dropKullaniciTip" InitialValue="0" ErrorMessage="Bu alan zorunludur."></asp:RequiredFieldValidator>
                            </div>



                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtAd" runat="server" CssClass="form-control" placeholder="Kullanıcı Adı" ></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAd" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control" placeholder="Kullanıcı Soyadı"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSoyad" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtEposta" runat="server" CssClass="form-control" placeholder="eposta"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEposta" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" CssClass="form-control" placeholder="Kullanıcı Şifre"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSifre" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>

                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Input -->

    <div style="float: right;">
        <asp:LinkButton ID="btnVazgec" runat="server" CssClass="btn bg-grey waves-effect" PostBackUrl="javascript:history.back();" ValidationGroup="vazgec"><i class="material-icons">keyboard_arrow_left</i>
                                    <span>VAZGEÇ</span></asp:LinkButton>
        <asp:LinkButton ID="btnKaydet" runat="server" CssClass="btn bg-blue waves-effect" OnClick="btnKaydet_Click"><i class="material-icons">check</i>
                                    <span>KAYDET</span></asp:LinkButton>
    </div>

    <div class="clearfix"></div>
</asp:Content>

