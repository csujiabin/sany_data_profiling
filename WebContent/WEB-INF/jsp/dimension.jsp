<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>工业状态监测数据画像系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="sb-admin-2/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="sb-admin-2/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="sb-admin-2/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="sb-admin-2/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="sb-admin-2/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- jQuery -->
    <script src="sb-admin-2/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="sb-admin-2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="sb-admin-2/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="sb-admin-2/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="sb-admin-2/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="sb-admin-2/dist/js/sb-admin-2.js"></script>
    
    <!-- DataTables -->
<!--     <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script> -->
<!--     <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script> -->

<!--     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
    <script src="echarts/echarts.min.js"></script>
    
    <script type="text/javascript">
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
        $('#datatable').DataTable({
            responsive: true,
            paging: true,
            ordering: true,
            searching: true,
            "ajax": {
                "type": "get",
                "url": "getParaAttributes",
                "dataSrc": function(json) {
                    return json;
                }
             },
            "columns": [
                { "data": "paraID" },
                { "data": "paraName" },
                { "data": "valueType" },
                { "data": "paraType" },
                { "data": "equipCount" } 
            ]
         });
    });
    </script>
    
    
    
    <!-- <script type="text/javascript">
        console.log("hello world");
        $(document).ready(function() {
            $.ajax({
                type : "GET",
                url : "getParaAttributes",
                dataType : "json",
                success : function(responseJson) {
                    console.log(responseJson[0]);
                    $.each(responseJson, function(index, paraAttri) {
                        $("<tr>").appendTo($("#datatable").children("tbody"))
                        .append($("<td>").text(paraAttri.paraID))
                            .append($("<td>").text(paraAttri.paraName))
                            .append($("<td>").text(paraAttri.valueType))
                            .append($("<td>").text(paraAttri.paraType))
                            .append($("<td>").text(paraAttri.equipCount));
                    });
                }
            });
        });
    </script> -->
    
</head>

<body>

    <div id="wrapper">
        <%@ include file="navbar.jsp"%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">维度特征</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-lg-6">
                                    每个参数的属性
                                </div>
                                <div class="col-lg-6" align="right">
                                    <a href="dimension-2">
                                        <button type="button" class="btn btn-info">查看柱状图</button>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table id="datatable" class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>参数编号</th>
                                            <th>参数名称</th>
                                            <th>数值类型</th>
                                            <th>参数类型</th>
                                            <th>设备数量</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
        
    </div>
    <!-- /#wrapper -->
    
   
</body>
</html>