<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchPage.aspx.cs" Inherits="SearchPage.SearchPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
</head>
    <body style="padding-top: 10px">
    <div class="col-xs-8 col-xs-offset-2">
        <form id="form1" runat="server" class="form-horizontal">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Search </h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="inputCategory" class="control-label col-xs-2">
                            Category
                        </label>
                        <div class="col-xs-10">
                            <input type="text" runat="server" class="form-control"
                                id="inputCategory" placeholder="Category" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputProductName" class="control-label col-xs-2">
                            ProductName
                        </label>
                        <div class="col-xs-10">
                            <input type="text" runat="server" class="form-control"
                                id="inputProductName" placeholder="ProductName" />
                        </div>
                    </div>



                    <div class="form-group">
    <label for="inputSize" class="control-label col-xs-2">
        Size
    </label>
    <div class="col-xs-10">
        <select id="inputSize" runat="server">
            <option value="Null">None</option>
            <option value="L">L</option>
            <option value="M">M</option>
            <option value="S">S</option>
        </select>
    </div>
</div>


                    <div class="form-group">
                <label for="inputPriceMin" class="control-label col-xs-2">
                    Price (Min)
                </label>
                <div class="col-xs-4">
                    <input type="number" runat="server" class="form-control"
                        id="inputPriceMin" placeholder="Min"
                        min="100" max="5000" />
                </div>
                <label for="inputPriceMax" class="control-label col-xs-2">
                    Price (Max)
                </label>
                <div class="col-xs-4">
                    <input type="number" runat="server" class="form-control"
                        id="inputPriceMax" placeholder="Max"
                        min="100" max="5000" />
                </div>
            </div>



                     

                    <div class="form-group">
                        <label for="inputDate" class="control-label col-xs-2">
    Date
</label>
    <div class="col-xs-10">
        <input type="date" id="inputDate" runat="server" class="form-control" placeholder="Date"/>
    </div>
</div>


                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-2">
                            <asp:Button ID="btnSearch" runat="server" Text="Search"
                                CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-10 col-xs-offset-2">
                            <asp:Button ID="btnReset" runat="server" Text="Reset"
                                CssClass="btn btn-primary" OnClick="btnReset_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3>Search Results</h3>
                </div>
                <div class="panel-body">
                    <div class="col-xs-10">
                        <asp:GridView CssClass="table table-bordered"
                            ID="gvSearchResults" runat="server">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
