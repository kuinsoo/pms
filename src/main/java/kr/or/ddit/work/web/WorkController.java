package kr.or.ddit.work.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.attachment.service.AttachmentServiceInf;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.card.service.CardServiceInf;
import kr.or.ddit.comments.service.CommentsServiceInf;
import kr.or.ddit.issue.service.IssueServiceInf;
import kr.or.ddit.meeting.model.MeetingVo;
import kr.or.ddit.meeting.service.MeetingServiceInf;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.MemberServiceInf;
import kr.or.ddit.message.service.MessageServiceInf;
import kr.or.ddit.post.service.PostServiceInf;
import kr.or.ddit.project.model.ProjectVo;
import kr.or.ddit.project.service.ProjectServiceInf;
import kr.or.ddit.todo.service.ToDoServiceInf;
import kr.or.ddit.work.model.WorkVo;
import kr.or.ddit.work.service.WorkServiceInf;

import javax.servlet.http.HttpServletRequest;

/**
 * kr.or.ddit.work.web
 * null.java
 * Desc : 업무 컨트롤러
 *
 * @Author : Mr.KKu
 * @Date : 2018-11-27 / 오후 3:34
 * @Version :
 */
@Controller
public class WorkController {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private WorkServiceInf workService;

    @Autowired
    private CommentsServiceInf commentsService;

    @Autowired
    private CardServiceInf cardService;

    @Autowired
    private ProjectServiceInf projectService;

    @Autowired
    private MemberServiceInf memberService;

    @Autowired
    private MeetingServiceInf meetingService;

    @Autowired
    private ToDoServiceInf todoService;

    @Autowired
    private PostServiceInf postService;

    @Autowired
    private MessageServiceInf messageService;
    
    @Autowired
	private IssueServiceInf issueService;

    @Autowired
    private AttachmentServiceInf attachmentService;

    @RequestMapping(value = "/ajaxCreateWork", method = RequestMethod.POST)
    public void ajaxCreateWork(Model model, WorkVo workVo, @RequestParam("project_id") String project_id,
                                 @SessionAttribute("memberVo") MemberVo memberVo,
                                 @RequestParam("file") MultipartFile[] files) {

        try {
            Map<String, String> mapWM = new HashMap<>();
            mapWM.put("pmember_member", memberVo.getMember_mail());
            mapWM.put("pmember_project", project_id);
            workVo.setWork_project(project_id);
            if (workVo.getWork_public() == null)
                workVo.setWork_public("N");
            if (files == null && files.length < 0) {
                cardService.createCard(mapWM, workVo, files);
            } else {
                cardService.createCard(mapWM, workVo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/createWork", method = RequestMethod.POST)
    public String createWork(Model model, WorkVo workVo, @RequestParam("project_id") String project_id,
                             @SessionAttribute("memberVo") MemberVo memberVo,
                             @RequestParam("file") MultipartFile[] files, HttpServletRequest request) {
        try {
            Map<String, String> mapWM = new HashMap<>();
            mapWM.put("pmember_member", memberVo.getMember_mail());
            mapWM.put("pmember_project", project_id);
            workVo.setWork_project(project_id);
            if (workVo.getWork_public() == null)
                workVo.setWork_public("N");
            if (files != null && files.length > 0) {
                cardService.createCard(mapWM, workVo, files);
            } else {
                cardService.createCard(mapWM, workVo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, String> mapWork = new HashMap<>();
        mapWork.put("member_mail", memberVo.getMember_mail());
        mapWork.put("project_id", project_id);


        ProjectVo projectVo =  projectService.selectProject(project_id);
        /* 프로젝트 객체  */
        model.addAttribute("projectVo", projectVo);

        /* 프로젝트에 포함된 멤버 정보 */
        model.addAttribute("projectMemberList", memberService.projectMemberList(project_id));

        /* 업무 출력 */
        model.addAttribute("workList",workService.selectWorks(project_id));
        model.addAttribute("workMainChart",workService.workMainChart(project_id));

        /* 업무에 달린 댓글 출력 */
        model.addAttribute("cmtList", commentsService.cmtList(project_id));

        /* 업무 카드 출력 */
        model.addAttribute("wcList", cardService.selectWorkCard(project_id));

        /* 첨부파일 리스트 출력 */
        model.addAttribute("attList", attachmentService.selectProjectAtt(project_id));

        /* 업무수정을 위한 값 */
        model.addAttribute("projectWorkList", workService.selectProjectWork(project_id));

        /* 나진실 : 마이페이지 부분 값 넘겨주기 위함 */

        String myTodo_id = request.getParameter("todo_id");
        String myProject_id = request.getParameter("project_id");
        String myProject_title = request.getParameter("project_title");
        String myWork_id = request.getParameter("work_id");
        String myWork_title = request.getParameter("work_title");

        model.addAttribute("todo_id", myTodo_id);
        model.addAttribute("project_id", myProject_id);
        model.addAttribute("project_title", myProject_title);
        model.addAttribute("work_id", myWork_id);
        model.addAttribute("work_title", myWork_title);


        /* 차트 목록 */
        Map<String, String> mtMap = new HashMap<>();
        mtMap.put("project_id", project_id);
        model.addAttribute("workCharts",workService.workChart(mtMap));

        /* 변찬우(추가 2018.12.26) 프로젝트 목록 출력 */
        List<MeetingVo> meetingList= meetingService.meetingList(project_id);
        model.addAttribute("meetingList",meetingList );

        model.addAttribute("member_name",memberService.selectUser(project_id) );

        /* 알림기능 - IKS */
        model.addAttribute("pageCnt", postService.totalPostCnt());
        model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
        model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));

            return "main/subMain";
    }


    @RequestMapping(value = "/testGantt", method = RequestMethod.GET)
    public String testGantt() {
        return "work/testChart";
    }

    @RequestMapping(value = "/testGantt2", method = RequestMethod.GET)
    public String testGantt2() {
        return "work/2222";
    }

    @RequestMapping(value = "/ajaxWorkChart", method = RequestMethod.POST)
    public String ajaxWorkChart(Model model, @RequestParam("project_id") String project_id,
                                @RequestParam("work_id") String work_id, @SessionAttribute("memberVo") MemberVo memberVo) {
        Map<String, String> mtMap = new HashMap<>();
        mtMap.put("project_id", project_id);
        mtMap.put("work_id", work_id);
        model.addAttribute("workCharts", workService.selectWorkChart(mtMap));

        /* 알림기능 - IKS */
        model.addAttribute("pageCnt", postService.totalPostCnt());
        model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
        model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));

        return "work/ajaxWorkChart";
    }

    @RequestMapping(value = "/ajaxWorkProgress", method = RequestMethod.GET)
    @ResponseBody
    public WorkVo ajaxWorkProgress(@RequestParam("project_id") String project_id,
                                   @RequestParam("work_id") String work_id) {
        Map<String, String> workMap = new HashMap<>();
        workMap.put("project_id", project_id);
        workMap.put("work_id", work_id);
        WorkVo workVo = workService.selectWorkMap(workMap);
        return workVo;
    }

    /**
     * Method : myWorkList
     * 작성자 : bhuanchanwoo
     * 변경이력 : 20190101
     *
     * @param project_id
     * @param member_mail
     * @param workVo
     * @param model
     * @return Method 설명 : cors 적용, 회의실에서 나의 업무 목록 출력 용
     */
    @CrossOrigin
    @RequestMapping(value = "/myWorkList",
            method = {RequestMethod.GET, RequestMethod.POST},
            headers = "Accept=application/json")
    @ResponseBody
    public List<WorkVo> myWorkList(@RequestParam("project_id") String project_id,
                                   @RequestParam("member_mail") String member_mail,
                                   WorkVo workVo, Model model) {

        workVo.setMember_mail(member_mail);
        workVo.setWork_project(project_id);

        List<WorkVo> myWorkList = workService.myWorkList(workVo);

        return myWorkList;
    }

    @RequestMapping(value = "/updateWork", method = RequestMethod.POST)
    public String updateWork(Model model, WorkVo workVo, @RequestParam("work_id")String work_id,
                             @RequestParam("project_id") String project_id,
                             @SessionAttribute("memberVo") MemberVo memberVo,
                             @RequestParam("file") MultipartFile[] files, HttpServletRequest request) {
        WorkVo updateWorkVo = workService.selectWork(work_id);
        updateWorkVo.setWork_title(workVo.getWork_title());
        updateWorkVo.setWork_content(workVo.getWork_content());
        updateWorkVo.setWork_sdate(workVo.getWork_sdate());
        updateWorkVo.setWork_eedate(workVo.getWork_eedate());
        updateWorkVo.setWork_type(workVo.getWork_type());
        updateWorkVo.setWork_importance(workVo.getWork_importance());
        updateWorkVo.setWork_public(workVo.getWork_public());
        try {
            workService.updateWork(updateWorkVo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Map<String, String> mapWork = new HashMap<>();
        mapWork.put("member_mail", memberVo.getMember_mail());
        mapWork.put("project_id", project_id);


        ProjectVo projectVo =  projectService.selectProject(project_id);
        /* 프로젝트 객체  */
        model.addAttribute("projectVo", projectVo);

        /* 프로젝트에 포함된 멤버 정보 */
        model.addAttribute("projectMemberList", memberService.projectMemberList(project_id));

        /* 업무 출력 */
        model.addAttribute("workList",workService.selectWorks(project_id));
        model.addAttribute("workMainChart",workService.workMainChart(project_id));

        /* 업무에 달린 댓글 출력 */
        model.addAttribute("cmtList", commentsService.cmtList(project_id));

        /* 업무 카드 출력 */
        model.addAttribute("wcList", cardService.selectWorkCard(project_id));

        /* 첨부파일 리스트 출력 */
        model.addAttribute("attList", attachmentService.selectProjectAtt(project_id));

        /* 업무수정을 위한 값 */
        model.addAttribute("projectWorkList", workService.selectProjectWork(project_id));

        /* 나진실 : 마이페이지 부분 값 넘겨주기 위함 */

        String myTodo_id = request.getParameter("todo_id");
        String myProject_id = request.getParameter("project_id");
        String myProject_title = request.getParameter("project_title");
        String myWork_id = request.getParameter("work_id");
        String myWork_title = request.getParameter("work_title");

        model.addAttribute("todo_id", myTodo_id);
        model.addAttribute("project_id", myProject_id);
        model.addAttribute("project_title", myProject_title);
        model.addAttribute("work_id", myWork_id);
        model.addAttribute("work_title", myWork_title);


        /* 차트 목록 */
        Map<String, String> mtMap = new HashMap<>();
        mtMap.put("project_id", project_id);
        model.addAttribute("workCharts",workService.workChart(mtMap));

        /* 변찬우(추가 2018.12.26) 프로젝트 목록 출력 */
        List<MeetingVo> meetingList= meetingService.meetingList(project_id);
        model.addAttribute("meetingList",meetingList );

        model.addAttribute("member_name",memberService.selectUser(project_id) );

        /* 알림기능 - IKS */
        model.addAttribute("pageCnt", postService.totalPostCnt());
        model.addAttribute("workMemberTotalCnt", workService.workMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalMsgReceived", messageService.totalMsgReceived(memberVo.getMember_mail()));
        model.addAttribute("issueMemberTotalCnt", issueService.issueMemberTotalCnt(memberVo.getMember_mail()));
        model.addAttribute("totalyouGiveFriendList", messageService.totalyouGiveFriendList(memberVo.getMember_mail()));

        return "main/subMain";
    }

    @RequestMapping(value = "/deleteWork", method = RequestMethod.GET)
    @ResponseBody
    public void deleteWork(@RequestParam("work_id")String work_id) {
        workService.deleteWork(work_id);
    }
}