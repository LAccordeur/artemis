package com.kuo.artemis.server.controller;

/**
 * @Author : guoyang
 * @Description :用于处理课题的申请和邀请
 * @Date : Created on 2017/11/9
 */

import com.kuo.artemis.server.core.common.Authority;
import com.kuo.artemis.server.core.dto.Response;
import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.service.UserInvitationApplicationService;
import com.kuo.artemis.server.service.UserProjectService;
import com.kuo.artemis.server.util.constant.PermissionConst;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.inject.Inject;

@Controller
@RequestMapping(value = "/api/relation", produces = {"application/json;charset=utf8"})
public class RelationshipController {

    private static Logger logger = LoggerFactory.getLogger(RelationshipController.class);

    @Inject
    private UserInvitationApplicationService userInvitationApplicationService;

    @Inject
    private UserProjectService userProjectService;


    /**
     * 用户申请加入课题
     * @param userProjectKey
     * @return
     */
    @RequestMapping(value = "/application", method = RequestMethod.POST)
    @ResponseBody
    public Response applyToJoinProject(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.applyToJoinProject(userProjectKey);
    }


    /**
     * 用户拒绝邀请
     * @param userProjectKey
     * @return
     */
    @RequestMapping(value = "/invitation/reject", method = RequestMethod.PUT)
    @ResponseBody
    public Response refuseInvitation(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.refuseInvitation(userProjectKey);
    }


    /**
     * 用户接受邀请
     * @param userProjectKey
     * @return
     */
    @RequestMapping(value = "/invitation/acceptance", method = RequestMethod.PUT)
    @ResponseBody
    public Response acceptInvitation(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.acceptInvitation(userProjectKey);
    }

    /**
     * 课题负责人邀请用户加入课题
     * @param userProjectKey
     * @return
     */
    @RequestMapping(value = "/invitation", method = RequestMethod.POST)
    @ResponseBody
    public Response inviteToJoinProject(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.inviteToJoinProject(userProjectKey);
    }

    /**
     * 课题负责人拒绝申请
     * @param userProjectKey
     * @return
     */
    //@Authority(value = PermissionConst.PROJECT_MANAGEMENT_HANDLE_APPLICATION)
    @RequestMapping(value = "/application/reject", method = RequestMethod.PUT)
    @ResponseBody
    public Response refuseApplication(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.refuseApplication(userProjectKey);
    }

    /**
     * 课题负责人接受申请
     * @param userProjectKey
     * @return
     */
    //@Authority(value = PermissionConst.PROJECT_MANAGEMENT_HANDLE_APPLICATION)
    @RequestMapping(value = "/application/acceptance", method = RequestMethod.PUT)
    @ResponseBody
    public Response acceptApplication(@RequestBody UserProjectKey userProjectKey) {
        return userInvitationApplicationService.acceptApplication(userProjectKey);
    }

    /**
     * 课题负责人删除某个成员
     * @param userProjectKey
     * @return
     */
    //@Authority(value = PermissionConst.PROJECT_MANAGEMENT_MEMBER_MANAGEMENT)
    @RequestMapping(value = "/project/member", method = RequestMethod.PUT)    //TODO  之后改为delete
    @ResponseBody
    public Response adminDeleteProjectMember(@RequestBody UserProjectKey userProjectKey) {

        logger.info("-------------------userProjectKey----------------");
        logger.info(userProjectKey.toString());

        return userProjectService.exitProject(userProjectKey);
    }

    /**
     * 用户主动退出某个课题
     * @param userProjectKey
     * @return
     */
    @RequestMapping(value = "/user/project", method = RequestMethod.PUT)    //TODO  之后改为delete
    @ResponseBody
    public Response userExitProject(@RequestBody UserProjectKey userProjectKey) {
        return userProjectService.exitProject(userProjectKey);
    }

}
