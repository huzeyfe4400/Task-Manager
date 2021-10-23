<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GorevEkle.aspx.cs" MasterPageFile="~/Site.Master" Inherits="TaskManager.GorevEkle" %>

<asp:Content ID="GorevEkleContent" ContentPlaceHolderID="head" runat="server">
    <link href="style.css" rel="stylesheet" />
    <script src="js/jquery.js"></script>
    <link rel="stylesheet" href="font-awesome-4.5.0/css/font-awesome.min.css" />

    <link rel="stylesheet" href="js/chosen/docsupport/prism.css" />
    <link rel="stylesheet" href="js/chosen/chosen.css" />

    <link type="text/css" href="css/jquery.datepick.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery.datepick.js"></script>
    <script type="text/javascript" src="js/jquery.datepick-tr.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {

            $('.date_tr').bootstrapMaterialDatePicker({
                format: 'DD.MM.YYYY',
                lang: 'tr',
                //weekStart: 0,
                time: false,
                cancelText: 'VAZGEÇ'
            });

        });

    </script>

    <script type="text/javascript">
        function PostToNewWindow() {
            originalTarget = document.forms[0].target;
            document.forms[0].target = '_blank';
            window.setTimeout("document.forms[0].target=originalTarget;", 300);
            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Input -->
                    <asp:Label ID="lblIslemSonuc" runat="server"></asp:Label>

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">


                <div class="header" style="background-color: #f5f5f5;">
                    <h2>GÖREV EKLE</h2>
                </div>
                <div class="body">
                    <h2 class="card-inside-title"></h2>


                    <asp:Panel ID="panelForm" runat="server">

                        <div class="row clearfix">




                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtbaslik" runat="server" CssClass="form-control" placeholder="Görev Başlığı" ></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbaslik" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txticerik" runat="server" CssClass="form-control" placeholder="Görev İçeriği"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txticerik" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:DropDownList ID="dropOncelik" runat="server" OnSelectedIndexChanged="dropOncelik_SelectedIndexChanged">
                                            <asp:ListItem Value="1" Text="Önemli"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="Önemli Değil"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dropOncelik" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                             <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:DropDownList ID="dropAciliyet" runat="server" OnSelectedIndexChanged="dropAciliyet_SelectedIndexChanged">
                                            <asp:ListItem Value="1" Text="Acil"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="Acil Değil"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="dropAciliyet" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="input-group">
                                    <div class="form-line">
                                        <asp:TextBox ID="txtSonTarih" Style="font-size: medium;" runat="server" CssClass="datepicker date_tr form-control" placeholder="Bitiş Tarihi"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSonTarih" ErrorMessage="Bu alan zorunludur." CssClass="islemHatali"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <asp:DropDownList ID="dropKullanici" runat="server" CssClass="form-control show-tick" AutoPostBack="true" OnSelectedIndexChanged="dropKullanici_SelectedIndexChanged" Visible="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="islemHatali" ControlToValidate="dropKullanici" InitialValue="0" ErrorMessage="Bu alan zorunludur."></asp:RequiredFieldValidator>
                            </div>

                            <div>
                                döküman ekleme------
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
