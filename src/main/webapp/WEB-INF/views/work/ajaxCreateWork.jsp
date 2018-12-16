<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${workList}" var="work" varStatus="i">
    <div class="currentCardList" >
        <div class="cardUserInfo">
            <div class="cardUserInfoImg">
                <img src="${work.member_profile}">
            </div>
            <div class="cardUserInfoName">
                <b>${work.member_mail}</b><br> <%-- 작성자 --%>
                <span>${work.work_wdate}</span>
            </div>
            <div class="updateDeleteIcon">
                <i class="icon-wrench icons"></i>
                <a href="#opens"><i class="icon-bulb icons"></i></a>
                <div class="white_contents" id="opens">
                    <div>
                        <a href="#close"><i class="icon-close icons"></i></a>
                        <div class="issueCreateInputField">
                            <div class="issueCreateInputFieldLeft">
                                <ul>
                                    <li>담당자</li>
                                    <li>할일내용</li>
                                    <li>시작일자</li>
                                    <li>마감일자</li>
                                </ul>
                            </div>
                            <div class="issueCreateInputFieldRight">
                                <ul>
                                    <li><input type="text" /></li>
                                    <li><textarea>할일내용</textarea></li>
                                    <li><input type="datetime-local" /></li>
                                    <li><input type="datetime-local" /></li>
                                </ul>
                            </div>
                        </div>
                        <input type="button" value="등록" class="issueInfoCreate" />
                        <input type="button" value="취소" class="issueInfoClose"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="currentCardContentView">
            <div class="currentCardContentViewLeft">
                <h2>${work.work_title}</h2>
                <textarea readonly>${work.work_content}</textarea>
            </div>
            <div class="currentCardContentViewRight">
                <table>
                    <thead>
                    <tr>
                        <th><input type="checkbox" /></th>
                        <th>TODO</th>
                        <th>담당자</th>
                        <th>시작</th>
                        <th>마감</th>
                        <th>이슈</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td>
                            <a href="#open" class="issueTitlePopup">샘플 제목 테스트</a>
                            <div class="white_content" id="open">
                                <div>
                                    <a href="#close"><i class="icon-close icons"></i></a>
                                    <div class="issueSelectPage">
                                        <div class="issueSelectPageLeft">
                                            <form action="#" method="post">
                                                <div class="issueProfile">
                                                    <img src="http://placehold.it/150x200" />
                                                </div>
                                                <div class="issues">
                                                    <div class="issuesLeft">
                                                        <ul>
                                                            <li>담당자</li>
                                                            <li>시작</li>
                                                            <li>예상마감</li>
                                                            <li>마감</li>
                                                        </ul>
                                                    </div>
                                                    <div class="issuesRight">
                                                        <ul>
                                                            <li><input type="text" /></li>
                                                            <li><input type="text" /></li>
                                                            <li><input type="text" /></li>
                                                            <li><input type="text" /></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <textarea>누른것에 대한 상세 내용...........</textarea>
                                            </form>
                                        </div>
                                        <div class="issueSelectPageRight">
                                            <h2>발생이슈</h2>
                                            <input type="button" value="등록" class="issueCreateBtn" />
                                            <input type="button" value="수정" class="insueUpdateBtn" />
                                            <form action="#" mehtod="post">
                                                <textarea>이슈에 대한 내용,,,,,</textarea>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>구인수</td>
                        <td>2018-12-14</td>
                        <td>2018-12-18</td>
                        <td>발생</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="issueInfos">샘플 제목 테스트</span></td>
                        <td>구인수</td>
                        <td>2018-12-14</td>
                        <td>2018-12-18</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="issueInfos">샘플 제목 테스트</span></td>
                        <td>구인수</td>
                        <td>2018-12-14</td>
                        <td>2018-12-18</td>
                        <td>발생</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" /></td>
                        <td><span class="issueInfos">샘플 제목 테스트</span></td>
                        <td>구인수</td>
                        <td>2018-12-14</td>
                        <td>2018-12-18</td>
                        <td>발생</td>
                    </tr>
                    </tbody>
                </table>
                <div class="pagination">
                    <ul>
                        <li><i class="icon-arrow-left icons"></i></li>
                        <li><span>1</span></li>
                        <li><span>2</span></li>
                        <li><span>3</span></li>
                        <li><span>4</span></li>
                        <li><span>5</span></li>
                        <li><span>6</span></li>
                        <li><span>7</span></li>
                        <li><span>8</span></li>
                        <li><span>9</span></li>
                        <li><span>10</span></li>
                        <li><i class="icon-arrow-right icons"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="currentCardContentBottomView">
            <div id="container${work.work_id}"></div>
            <%@ include file="/WEB-INF/views/work/testChart.jsp" %>
        </div>

        <!-- 댓글  -->
        <div class="cardContentComment">
            <c:forEach items="${cmtList}" var="cmt">
                <c:if test="${cmt.cmt_work eq  work.work_id}">
                    <ul>
                        <li>
                            <div class="cardContentCommentUser">
                                <div class="cardContentCommentUserImg">
                                    <img src="${cmt.member_profile}">
                                </div>
                                <div class="cardContentCommentUserName">
                                    <b>${cmt.member_name}</b><span class="times">${cmt.cmt_date}</span>
                                    <br>
                                    <span>${cmt.cmt_content}</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:if>
            </c:forEach>
            <ul>
                <li>
                    <div class="cardContentCommentUser">
                        <div class="cardContentCommentUserImg">
                            <img src="${memberVo.member_profile}">
                        </div>
                        <div class="cardContentCommentUserName">

                            <input type="text" class="form-control" id="cmt_content${i.index}" value="" placeholder="댓글을 입력해주세요" required >
                            <div class="cardContentBottom">
                                <i class="icon-bubble icons"></i>
                                <span onclick="insertCmt('${work.work_id}', 'cmt_content${i.index}');">댓글 작성</span>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div> <%-- 끝--%>
</c:forEach>
