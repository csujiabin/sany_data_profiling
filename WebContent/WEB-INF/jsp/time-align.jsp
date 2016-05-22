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
    
    
    <script>
       $(document).ready(function() {
            $.ajax({
                type : "get",
                url : "getParaAttributes",
                dataType : "json",
                success : function(responseJson) {
                    console.log(responseJson[0]);
                    $.each(responseJson, function(index, paraAttri) {
                        $("#left-select").append($("<option>")
                                .text(paraAttri.paraID + ": " + paraAttri.paraName));
                    });
                }
            });
        });
        
        function moveOption(obj1, obj2) {
             for(var i = obj1.options.length - 1; i >= 0; i--) {
                 if(obj1.options[i].selected) {  
                    var opt = new Option(obj1.options[i].text, obj1.options[i].value);
                    opt.selected = true;
                    obj2.options.add(opt);
                    obj1.remove(i);
                }
             }
        }
        
        function clearSelect(obj) {
            var len = obj.options.length;
            for(var i = len - 1; i >= 0; i--) {
                obj.remove(obj.options[i]);
            }
       }
    </script>
    
    <script>
       $(document).ready(function() {
            $.ajax({
                type : "get",
                url : "getEquips",
                dataType : "json",
                success : function(responseJson) {
                    console.log(responseJson[0]);
                    $.each(responseJson, function(index, equip) {
                        $("#equip-left-select").append($("<option>").text(equip));
                    });
                }
            });
        });
        
        function moveOption(obj1, obj2) {
             for(var i = obj1.options.length - 1; i >= 0; i--) {
                 if(obj1.options[i].selected) {  
                    var opt = new Option(obj1.options[i].text, obj1.options[i].value);
                    opt.selected = true;
                    obj2.options.add(opt);
                    obj1.remove(i);
                }
             }
        }
        
        function clearSelect(obj) {
            var len = obj.options.length;
            for(var i = len - 1; i >= 0; i--) {
                obj.remove(obj.options[i]);
            }
       }
    </script>
    
</head>

<body>

    <div id="wrapper">
        <%@ include file="navbar.jsp"%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">时标对齐</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            选择状态监测参数
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-24">
                                    <form role="form" action="goEquipSelection" method="post">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group form-group-lg">
                                                    <label>备选参数（双击进行选择）</label>
                                                    <select id="left-select" multiple class="form-control" size="10" 
                                                    ondblclick="moveOption(document.getElementById('left-select'), document.getElementById('right-select'))">
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                            <!-- <div>
                                                <button type="button" class="btn btn-default"><i class="fa fa-arrow-right"></i></button>
                                                <button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i></button>
                                            </div> -->
                                            <div class="col-lg-6">
                                                <div class="form-group form-group-lg">
                                                    <label>已选参数（双击进行删除）</label>
                                                    <select id="right-select" name="paraList" multiple class="form-control" size="10"
                                                    ondblclick="moveOption(document.getElementById('right-select'), document.getElementById('left-select'))">
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="reset" class="btn btn-danger btn-block btn-outline" 
                                                onclick="clearSelect(document.getElementById('right-select'))">清空</button>
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="submit" class="btn btn-primary btn-block btn-outline">添加所有</button>
                                            </div>
                                            <div class="col-lg-4">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            选择设备
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-24">
                                    <form role="form" action="goAlignResult" method="post">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group form-group-lg">
                                                    <label>备选设备（双击进行选择）</label>
                                                    <select id="equip-left-select" multiple class="form-control" size="12" 
                                                    ondblclick="moveOption(document.getElementById('equip-left-select'), document.getElementById('equip-right-select'))">
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                            <!-- <div>
                                                <button type="button" class="btn btn-default"><i class="fa fa-arrow-right"></i></button>
                                                <button type="button" class="btn btn-default"><i class="fa fa-arrow-left"></i></button>
                                            </div> -->
                                            <div class="col-lg-6">
                                                <div class="form-group form-group-lg">
                                                    <label>已选设备（双击进行删除）</label>
                                                    <select id="equip-right-select" name="equipList" multiple class="form-control" size="12"
                                                    ondblclick="moveOption(document.getElementById('equip-right-select'), document.getElementById('equip-left-select'))">
                                                    </select>
                                                </div>
                                            </div>
                                            <!-- /.col-lg-6 (nested) -->
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4">
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="reset" class="btn btn-danger btn-block btn-outline" 
                                                onclick="clearSelect(document.getElementById('equip-right-select'))">清空</button>
                                            </div>
                                            <div class="col-lg-2">
                                                <button type="submit" class="btn btn-primary btn-block btn-outline">添加所有</button>
                                            </div>
                                            <div class="col-lg-4">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            设置时间窗口大小
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input class="form-control" placeholder="1">
                                </div>
                                <div class="col-lg-6">
                                    <h4>秒</h4>
                                </div>
                                <div class="col-lg-0">
                                </div>
                                <div class="col-lg-0">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3">
                </div>
                <div class="col-lg-3">
                    <button type="reset" class="btn btn-warning btn-block" 
                    onclick="clearSelect(document.getElementById('right-select'))">重置</button>
                </div>
                <div class="col-lg-3">
                    <button type="submit" class="btn btn-success btn-block">提交</button>
                </div>
                <div class="col-lg-3">
                </div>
            </div>
            <!-- /.row -->
            <br>
            <br>
            <div class="row">
                <div class="col-lg-12">
                    <div class="alert alert-success">
                        Learn more about the profiler tool, please contact <a href=mailto:csujiabin@126.com>LiangJiabin@tsinghua.edu.cn</a>.
                    </div>
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