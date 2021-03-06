<%@ page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- 알림 공통 HTML -->
<div class="modal fade" id="notiModal">
    <div class="modal-dialog" style="width: 25%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><spring:message code="myhub.label.notification"/></h4>
            </div>
            <div class="modal-body">
                <p>
                    <div id="notiMsg"></div>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnFirst" style="display:none;">
                    <spring:message code="myhub.label.select.yes"/>
                </button>
                <button type="button" class="btn btn-info" data-dismiss="modal" id="btnSecond" style="display:none;">
                    <spring:message code="myhub.label.select.no"/>
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal" id="btnThird" style="display:none;">
                    <spring:message code="myhub.label.close"/>
                </button>
            </div>
        </div>
    </div>
</div>

<%-- <div class="modal fade" id="passwordEditModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><spring:message code="myhub.label.password"/>&nbsp;<spring:message code="myhub.label.update"/></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="frmPassword" name="frmPassword" onsubmit="return false;">
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label"><spring:message code="myhub.label.before.password"/></label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="beforePassword" name="beforePassword" maxlength="12" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-3 control-label"><spring:message code="myhub.label.password"/></label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="afterPassword" name="afterPassword" maxlength="12" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="cfPassword" class="col-sm-3 control-label"><spring:message code="myhub.label.confirm.password"/></label>
                        <div class="col-sm-5">
                            <input type="password" class="form-control" id="cfafterPassword" name="cfafterPassword" maxlength="12" value="">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="btnPasswordUpdate">
                    <spring:message code="myhub.label.update"/>
                </button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <spring:message code="myhub.label.close"/>
                </button>
            </div>
        </div>
    </div>
</div> --%>


