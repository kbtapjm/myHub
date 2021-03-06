<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
    
                <!-- 상단 헤더 -->    
                <div class="navbar navbar-inverse navbar-static-top" role="navigation">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="<c:url value='/main'/>">MyHub</a>
                        </div>
                        <div class="navbar-collapse collapse">
                        
                            <!-- 서비스 메뉴는 로그인 한 사용자에게만 활성화 -->
                            <security:authorize access="fullyAuthenticated">
                            <ul class="nav navbar-nav">
                                <li><a href="#">Friend</a></li>
                                <li><a href="#">Photo</a></li>
                            </ul>
                            <form class="navbar-form navbar-left" role="search" onsubmit="return false;">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Search">
                                </div>
                                <button type="submit" id="btnSearch" class="btn btn-default">Search</button>
                            </form>
                            </security:authorize>
                            
                            <ul class="nav navbar-nav navbar-right">
	                            <!-- 로그인한 사용자 정보 -->
	                            <security:authorize access="fullyAuthenticated">
                                <li>
	                               <a href="<c:url value='/user/userInfo' />">
	                                   <security:authentication property="principal.username"/>
	                               </a>
                                </li>
                                </security:authorize>
                                
                                <!-- 관리자 메뉴 -->
                                <security:authorize access="fullyAuthenticated and hasRole('ROLE_ADMIN')" >
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><spring:message code="myhub.label.admin"/></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="<c:url value='/admin/userManage/userList'/>"><spring:message code="myhub.label.user.list"/></a></li>
                                        <li><a href="<c:url value='/admin/logHistory/logHistoryList'/>"><spring:message code="myhub.label.loghistory.list"/></a></li>
                                        <li><a href="javascript:MyHubHeaderApp.popup.activeUserListPopup();"><spring:message code="myhub.label.connection.status"/></a></li>
                                    </ul>
                                </li>
                                </security:authorize>
                                
                                <!-- 로그인 인증 권한 -->
                                <security:authorize access="fullyAuthenticated">
                                <!-- 
                                <li>
                                    <a href="javascript:MyHubHeaderApp.popup.userPasswordEdit('<security:authentication property="principal.username"/>');"><spring:message code="myhub.label.change.password"/></a>
                                </li>
                                 -->
                                <li>
                                    <a href="<c:url value='/j_spring_security_logout' />"><spring:message code="myhub.label.logout"/></a>
                                </li>
                                </security:authorize>

                                <!-- 로그인을 안한 상태는 로그인 버튼 활성화 -->
                                <security:authorize ifNotGranted="ROLE_ADMIN, ROLE_MANAGER, ROLE_USER" >
                                <li>
                                    <a href="<c:url value='/' />"><spring:message code="myhub.label.login"/></a>
                                </li>
                                </security:authorize>
                                <!-- 
                                <li>
                                    <a href="<c:url value='/test/testList' />">Test</a>
                                </li>
                                 -->
                            </ul>
                        </div>
                    </div>
                </div>

<!-- 페이지 공통 함수 -->                
<script type="text/javascript">
	var MyHubHeaderApp = {
		pageInit: function() {
		    'use strict';
               
            // data init
            this.data.init();
               
            // event init
            this.event.init();
        },
           
        data: {
            init: function() {
            	
            },
            
            // 세션 정보 체크
            setIntervalSessionCheck: function() {
            	var url = commonObj.config.contextPath.concat('/sessionCheck');
                var pars = '';
                
                commonObj.data.ajax(url, {pars: pars, async: true, 
                    onsucc: function(res) {
                        log(res);
                    },
                    onerr: function(res) {
                        alert(res);
                    }
                });
            }
        },
        
        event: {
        	init: function() {
        		// 세션정보 1분마다 체크
        		<security:authorize access="fullyAuthenticated">;
        		var intervalTime = 1;    // 1분
                //window.setInterval('MyHubHeaderApp.data.setIntervalSessionCheck();', (intervalTime * 60 * 1000));
        		</security:authorize>;
        	}
        },
		
		popup: {
			// 비밀번호 수정
            userPasswordEdit: function(email) {
                commonObj.popup.open({
                    url : '<c:url value="/user/userPasswordEdit"/>',
                    pars : 'email='.concat(email),
                    title: 'userPasswordEdit',
                    width : '420',
                    height : '400'
                });
            },
            
            // 접속 현황
            activeUserListPopup: function() {
            	commonObj.popup.open({
                    url : '<c:url value="/admin/userManage/activeUserListPopup"/>',
                    pars : '',
                    title: 'activeUserList',
                    width : '750',
                    height : '450'
                });
            }
        }
	};
	
	$(document).ready(function() {
        try {
        	MyHubHeaderApp.pageInit();
        } catch (e){
            log('Error : ' + e.toString());
        }
    });

</script>
