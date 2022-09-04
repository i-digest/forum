package org.example.forum.controller;

import org.example.forum.dao.dto.ForumDto;
import org.example.forum.dao.dto.TopicDto;
import org.example.forum.dao.dto.UserDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class JspController {

    @PostMapping("/signInAction")
    public String signInAction(@ModelAttribute final UserDto userDto, final BindingResult result, final Model model) {
        model.addAttribute(userDto);
        return "signInAction";
    }

    @PostMapping("/joinAction")
    public String joinAction(@ModelAttribute final UserDto userDto, final BindingResult result, final Model model) {
        model.addAttribute(userDto);
        return "joinAction";
    }

    @PostMapping("/addForumAction")
    public String addForumAction(@ModelAttribute final ForumDto forumDto, BindingResult result, final Model model) {
        model.addAttribute(forumDto);
        return "addForumAction";
    }

    @PostMapping("/addTopicAction")
    public String addTopicAction(@ModelAttribute final TopicDto topicDto, BindingResult result, final Model model) {
        model.addAttribute(topicDto);
        return "addTopicAction";
    }

    @PostMapping("/updateForumAction")
    public String updateForumAction(@ModelAttribute final ForumDto forumDto, BindingResult result, final Model model) {
        model.addAttribute(forumDto);
        return "updateForumAction";
    }

    @PostMapping("/updateTopicAction")
    public String updateTopicAction(@ModelAttribute final TopicDto topicDto, BindingResult result, final Model model) {
        model.addAttribute(topicDto);
        return "updateTopicAction";
    }
}
