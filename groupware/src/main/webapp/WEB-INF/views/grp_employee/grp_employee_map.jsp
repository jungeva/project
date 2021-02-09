<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_HEADER.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.orgchart.css">
<script src="${pageContext.request.contextPath}/js/jquery.orgchart.js"></script>
<style>
    .content-box {
        border: 1px solid #eee;
        padding: 10px 20px;
    }

    .contents {
        display: none;
    }

    .orgchart .top-level .title {
        background-color:#29558a;
        color:#fff;
        text-shadow: 1px 1px 1px rgba(255, 255, 255, 0.5);
    }

    .orgchart .high-level .title {
        /*이사급*/
        background-color: #4c84b7;
        color: #fff;
    }

    .orgchart .middle-level .title {
        /*부서장*/
        background-color: #7da5cd;
    }

    .orgchart .low-level .title {
        background-color: #e0e0e0;
    }

    .orgchart .bottom-level .title {
        background-color: #f0f0f0;
    }

    .auth-right {
        position: relative;
    }

    .auth-right form i {
        position: absolute;
        top: 0;
        left: 340px;
        line-height: 55px;
    }

    .logo a {
        display: inline-block;
        margin-top: 5px;
    }
</style>

<body>
    <div class="container p10 bg-gray">
        <div class="top-wrap">
            <div class="top  flex flex-justify weight700">
                <!-- include logo -->
                <%@ include file ="/WEB-INF/views/grp_admin_main/ADMIN_LOGO.jsp" %>
                <!-- include logo -->
                <div class="auth-wrap  flex flex-justify font18 weight700 p-lr10 bg-white" style="width:87%">
                    <!-- include auth -->
                    <%@ include file ="/WEB-INF/views/grp_admin_main/ADMIN_AUTH.jsp" %>
                    <!-- include auth -->
                </div>
            </div>
        </div>
        <div class="bottom flex flex-justify m-t10">
            <div class="left-info" style="width:12.4%">
                <!-- include menu -->
                <%@ include file="/WEB-INF/views/grp_admin_main/ADMIN_MENU.jsp" %>
                <!-- include menu -->
            </div>
            <div class="right-info bg-white p10" style="width:87% ">
                <div class="">
                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_map">
                        <span class="btn-on">조직도</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_list">
                        <span class="btn-off">사원목록</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/grp_employee/grp_employee_retired_list">
                        <span class="btn-off" style="width:95px;">사용정지목록</span>
                    </a>
                </div>
                <div class="title">
                    <h3 class="tomato font18 noto m-t20">
                        <i class="fas fa-sitemap"></i> 사원조직 > 조직도
                    </h3>
                </div>
                <div class="page-content">
                    <div id="chart-container"></div>
                </div>
            </div>
        </div>

    </div>

</body>
<script src="${pageContext.request.contextPath}/js/admin.js"></script>
<script type="text/javascript">
    $(function () {

        var datascource = {
            'name': '대표이사',
            'title': 'CEO',
            'className': 'top-level',
            'children': [{
                    'name': '관리부',
                    'title': '관리부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '관리과',
                        'title': '관리과장',
                        'className': 'middle-level',
                        'children': [{
                            'name': '관리과',
                            'title': '대리',
                            'className': 'low-level',
                            'children': [{
                                'name': '관리과',
                                'title': '사원',
                                'className': 'bottom-level'
                            }]
                        }]
                    }]

                },
                {
                    'name': '기획부',
                    'title': '기획부장',
                    'className': 'high-level',
                    'children': [{
                            'name': '기획과',
                            'title': '기획과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '기획과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '기획과',
                                    'title': '사원',
                                    'className': 'bottom-level'

                                }]
                            }]
                        }, {
                            'name': 'TF팀',
                            'title': 'TF팀장',
                            'className': 'middle-level',
                            'children': [{
                                'name': 'TF팀',
                                'title': '팀원',
                                'className': 'low-level',

                            }]
                        }

                    ]

                },
                {
                    'name': '인사부',
                    'title': '인사부장',
                    'className': 'high-level',
                    'children': [{
                            'name': '총무과',
                            'title': '총무과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '총무과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '총무과',
                                    'title': '사원',
                                    'className': 'bottom-level'

                                }]
                            }]
                        },
                        {
                            'name': '인사과',
                            'title': '인사과장',
                            'className': 'middle-level',
                            'children': [{
                                'name': '인사과',
                                'title': '대리',
                                'className': 'low-level',
                                'children': [{
                                    'name': '인사과',
                                    'title': '사원',
                                    'className': 'bottom-level'
                                }]
                            }]
                        }
                    ]
                },
                {
                    'name': '영업부',
                    'title': '영업부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '영업부',
                        'title': '영업과장',
                        'className': 'middle-level'
                    }, {
                        'name': '영업외주',
                        'title': '영업팀장',
                        'className': 'middle-level'
                    }]
                },
                {
                    'name': '생산부',
                    'title': '생산부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '생산부',
                        'title': '공장장',
                        'className': 'middle-level'
                    }]
                },
                {
                    'name': '자재부',
                    'title': '자재부장',
                    'className': 'high-level',
                    'children': [{
                        'name': '재재부',
                        'title': '자재처리부',
                        'className': 'middle-level',
                    }]
                }
            ]
        };

        $('#chart-container').orgchart({
            'visibleLevel': 5,
            'pan': true,
            'data': datascource,
            'nodeContent': 'title',
            'createNode': function ($node, data) {
                $node.on('click', function (event) {
                    if (!$(event.target).is('.edge, .toggleBtn')) {
                        var $this = $(this);
                        var $chart = $this.closest('.orgchart');
                        var newX = window.parseInt(($chart.outerWidth(true) / 2) - ($this
                            .offset().left - $chart.offset().left) - ($this
                            .outerWidth(true) / 2));
                        var newY = window.parseInt(($chart.outerHeight(true) / 2) - ($this
                            .offset().top - $chart.offset().top) - ($this
                            .outerHeight(true) / 2));
                        $chart.css('transform', 'matrix(1, 0, 0, 1, ' + newX + ', ' + newY +
                            ')');
                    }
                });
            }
        });

    });
</script>

</html>