<%@ Page Title="" Language="C#" MasterPageFile="~/Estilo/TicoParts.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="slnPartes.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container"  style="overflow: auto; height: 90vh;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" style=" width:85%">
      <div class="item active">
        <img src="../Imagenes/Diseno/LUJO.png" alt="Taller Lujo" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 24406484</h3>
          <p>San Antonio del Tejar, Alajuela</p>
        </div>
      </div>
      <div class="item">
        <img src="../Imagenes/Diseno/TP.png" alt="Ticoparts.co.cr" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 24406484</h3>
          <p>San Antonio del Tejar, Alajuela</p>
        </div>
      </div>
      <div class="item">
        <img src="../Imagenes/Diseno/toyosan.png" alt="Toyosan" style="width:100%;"/>
        <div class="carousel-caption">
          <h3>Tel: 2440 1090</h3>
          <p>Coyol, Alajuela</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
</asp:Content>
