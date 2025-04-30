<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Seller/index.Master" CodeBehind="Dashboard.aspx.cs" Inherits="A1Mobile.Seller.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
        body{
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .dashboard-title {
            text-align: center;
            margin-top: 30px;
            font-size: 32px;
            font-weight: bold;
            color: #333;
        }

        .dashboard-container {
            display: flex;
            gap: 20px;
            justify-content: center;
            margin-top: 40px;
            flex-wrap: wrap;
            padding: 0 20px;
        }

        .dashboard-card {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            width: 250px;
            height: 200px;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .dashboard-card:hover {
            transform: scale(1.05);
        }

        .card-title {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .card-value {
            font-size: 28px;
            font-weight: bold;
            margin: 0;
        }

        .dashboard-card p {
            font-size: 28px;
            font-weight: bold;
            margin: 0;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdid" runat="server" />

    <h1 class="dashboard-title">Welcome to Your Seller Dashboard</h1>

    <div class="dashboard-container">
        <!-- Total Products Sold Card -->
        <div class="dashboard-card">
            <h3 class="card-title">Total Products Sold</h3>
            <p class="card-value"><asp:Label ID="lblTotalSold" runat="server" Text="0"></asp:Label></p>
        </div>

        <!-- Remaining Products Card -->
        <div class="dashboard-card" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
            <h3 class="card-title">Remaining Products</h3>
            <p class="card-value"><asp:Label ID="lblRemaining" runat="server" Text="0"></asp:Label></p>
        </div>

        <!-- Total Earnings Card -->
        <div class="dashboard-card" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
            <h3 class="card-title">Total Earnings (₹)</h3>
            <p class="card-value"><asp:Label ID="lblTotalEarnings" runat="server" Text="₹0.00"></asp:Label></p>
        </div>
    </div>

</asp:Content>
