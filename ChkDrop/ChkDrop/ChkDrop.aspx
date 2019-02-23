<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChkDrop.aspx.cs" Inherits="ChkDrop.ChkDrop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="ja">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>ドラッグドロップ</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        .DragBody {
            border: solid;
            width: 9em;
            height: 2em;
        }
        .DropBody {
            width: 9em;
            height: 2em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/jquery-3.3.1.js" />
                <asp:ScriptReference Path="~/Scripts/jquery-ui-1.12.1.js" />
                <asp:ScriptReference Path="~/Scripts/bootstrap.js" />
            </Scripts>
        </asp:ScriptManager>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table id="Tbl">
                        <thead>
                            <tr runat="server" id="TableHead">
                                <th runat="server" id="Hp1"><span ondrag="">1</span></th>
                                <th runat="server" id="Hp2"><span ondrag="">2</span></th>
                            </tr>
                        </thead>
                        <tbody runat="server" id="TableBody">
                        </tbody>
                    </table>
                    <asp:HiddenField runat="server" ID="Target"/>
                    <asp:HiddenField runat="server" ID="Obj" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
    <script>
        jQuery(function () {
            jQuery(".DragBody").draggable({
                revert: "invalid"
            });
            jQuery(".DropBody").droppable({
                accept: ".DragBody",
                drop: function (event, ui) {
                    var targetID = event.target.id;
                    var objectID = ui.draggable[0].id;
                    console.log(targetID);
                    console.log(objectID);
                    console.log("Event:");
                    console.log(event);
                    console.log("Ui:");
                    console.log(ui);

                    ui.position.left = 0;
                    ui.offset.left = 0;

                    var targetElement = document.getElementById(targetID);
                    var objectElement = document.getElementById(objectID);
                    // console.log(PageMethods);
                    // PageMethods.Handle(targetID, objectID, onSucceed, onError);

                    //objectElement.setAttribute("style", "position: relative");
                    //targetElement.appendChild(objectElement);

                    //console.log(ui.draggable);
                    //console.log(document.body);

                    //if (targetElement.childElementCount > 1) {
                    //    var enemy = targetElement.childNodes.item(0);
                    //    var oleEnemy = targetElement.removeChild(enemy);
                    //}

                    //jQuery.ajax({
                    //    type: 'POST',
                    //    url: './DragDrop.aspx',
                    //    conentType: "application/json; charset=utf-8",
                    //    data: '{ obj: ' + event.target.id + ', targ: ' + ui.draggable.context.id + ' }'
                    //});
                    jQuery("#Target").attr("Value", targetID);
                    jQuery("#Obj").attr("Value", objectID);
                    //form1.elements["target"] = targetID;
                    //form1.elements["obj"] = objectID;
                    //alert(form1.elements["target"]);
                    form1.submit();

                }
            });
        });

    </script>
</body>
</html>
