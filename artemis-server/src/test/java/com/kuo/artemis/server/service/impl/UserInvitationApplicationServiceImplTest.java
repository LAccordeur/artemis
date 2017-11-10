package com.kuo.artemis.server.service.impl;

import com.kuo.artemis.server.entity.UserProjectKey;
import com.kuo.artemis.server.service.UserInvitationApplicationService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration({"classpath:spring/spring-*.xml"})
public class UserInvitationApplicationServiceImplTest {

    @Resource
    private UserInvitationApplicationService userInvitationApplicationService;

    @Test
    public void applyToJoinProject() throws Exception {

        UserProjectKey userProjectKey = new UserProjectKey(4, 1);
        userInvitationApplicationService.applyToJoinProject(userProjectKey);

    }

    @Test
    public void inviteToJoinProject() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(5, 1);
        userInvitationApplicationService.inviteToJoinProject(userProjectKey);
    }

    @Test
    public void refuseApplication() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(4, 1);
        userInvitationApplicationService.refuseApplication(userProjectKey);
    }

    @Test
    public void acceptApplication() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(3, 18);
        userInvitationApplicationService.acceptApplication(userProjectKey);
    }

    @Test
    public void refuseInvitation() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(5, 1);
        userInvitationApplicationService.refuseInvitation(userProjectKey);
    }

    @Test
    public void acceptInvitation() throws Exception {
        UserProjectKey userProjectKey = new UserProjectKey(5, 1);
        userInvitationApplicationService.acceptInvitation(userProjectKey);
    }

    @Test
    public void listApplication() throws Exception {
        System.out.println(userInvitationApplicationService.listApplication("1"));
    }

    @Test
    public void listInvitation() throws Exception {
        System.out.println(userInvitationApplicationService.listInvitation("5"));
    }

}