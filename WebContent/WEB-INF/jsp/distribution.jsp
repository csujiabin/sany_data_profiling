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
    
    <script src="echarts/echarts.min.js"></script>
    
</head>

<body>

    <div id="wrapper">
        <%@ include file="navbar.jsp"%>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">数值分布</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            每台设备的平均值和标准差
                        </div>
                        <div class="panel-body">
                        
                            <div id="main" style="width: 1000px;height:600px;"></div>
                            
                            <script type="text/javascript">
                            var myChart = echarts.init(document.getElementById('main'));
                            var option = {
                                //backgroundColor: '#333',
                                color: [
                                    '#dd4444', '#fec42c', '#80F1BE'
                                ],
                                tooltip: {
                                    padding: 10,
                                    backgroundColor: '#666',
                                    borderColor: '#777',
                                    borderWidth: 1,
                                    formatter: function (obj) {
                                        var value = obj.value;
                                        return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
                                            + '设备：'+ value[5]
                                            + '</div>'
                                            + '最大值：' + value[3] + '<br>'
                                            + '最小值：' + value[4] + '<br>'
                                            + '平均值：' + value[1] + '<br>'
                                            + '标准差：' + value[2] + '<br>'
                                    }
                                },
                                xAxis: {
                                    type: 'value',
                                    name: '设备',
                                    nameGap: 16,
                                    nameTextStyle: {
                                        //color: '#fff',
                                        fontSize: 18
                                    },
                                    splitLine: {
                                        show: false
                                    },
                                    axisLine: {
                                        lineStyle: {
                                            color: '#777'
                                        }
                                    },
                                    axisTick: {
                                        lineStyle: {
                                            color: '#777'
                                        }
                                    },
                                    axisLabel: {
                                        formatter: '{value}',
                                        textStyle: {
                                            fontSize: 18
                                            //color: '#fff'
                                        }
                                    }
                                },
                                yAxis: {
                                    type: 'value',
                                    name: '液压油温度平均值(℃)',
                                    nameLocation: 'end',
                                    nameGap: 20,
                                    nameTextStyle: {
                                        //color: '#fff',
                                        fontSize: 18
                                    },
                                    axisLine: {
                                        lineStyle: {
                                            color: '#777'
                                        }
                                    },
                                    axisTick: {
                                        lineStyle: {
                                            color: '#777'
                                        }
                                    },
                                    splitLine: {
                                        show: false
                                    },
                                    axisLabel: {
                                        textStyle: {
                                            fontSize: 18
                                            //color: '#fff'
                                        }
                                    }
                                },
                                visualMap: [
                                    {
                                        left: 'right',
                                        top: '10%',
                                        dimension: 2,
                                        min: 0,
                                        max: 200,
                                        itemWidth: 30,
                                        itemHeight: 120,
                                        calculable: true,
                                        precision: 0.1,
                                        text: ['标准差'],
                                        textGap: 30,
                                        textStyle: {
                                            fontSize: 18
                                            //color: '#fff'
                                        },
                                        inRange: {
                                            symbolSize: [10, 70]
                                        },
                                        outOfRange: {
                                            symbolSize: [10, 70],
                                            color: ['rgba(255,255,255,.2)']
                                        },
                                        controller: {
                                            inRange: {
                                                color: ['#c23531']
                                            },
                                            outOfRange: {
                                                color: ['#444']
                                            }
                                        }
                                    },
                                ],
                                series: [
                                    {
                                        name: '液压油温度',
                                        type: 'scatter',
                                        data: []
                                    },
                                    {
                                        name: '平均值',
                                        type: 'line',
                                        data: []
                                    }
                                ]
                            };
                            
                            $.ajax({
                                type : "post",
                                url : "getAvgStd",
                                dataType : "json",
                                success : function(json) {
                                    var data = new Array(json.length);
                                    var avgSum = 0;
                                    $.each(json, function(i, item) {
                                        data[i] = new Array(6);
                                        data[i][0] = i + 1;
                                        data[i][1] = item.avg;
                                        data[i][2] = item.std;
                                        data[i][3] = item.max;
                                        data[i][4] = item.min;
                                        data[i][5] = item.equip;
                                        
                                        //avgSum += item.avg;
                                    });
                                    option.series[0].data = data;
                                    
                                    //avgAvg = avgSum / json.length;
                                    avgAvg = 35.81;
                                    var lineData = new Array(json.length);
                                    for (var i = 0; i < json.length; i++) {
                                        lineData[i] = new Array(2);
                                        lineData[i][0] = i + 1;
                                        lineData[i][1] = avgAvg;
                                        option.series[1].data.push(avgAvg);
                                    }
                                    option.series[1].data = lineData;
                                    
                                    myChart.setOption(option);
                                }
                            });
                            </script>
                            
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->
        
    </div>
    <!-- /#wrapper -->
    
   
</body>
</html>