package com.springboot.gga.controller;

import com.springboot.gga.dto.MemberDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    private MemberService memberService;



    // 패스워드 찾기 결과 출력
    @GetMapping("login_pwSelect/{pass}/{name}")
    public String login_pwSelect(@PathVariable String pass, @PathVariable String name, Model model){
        model.addAttribute("pass", pass);
        model.addAttribute("name", name);
        return "/login/login_pwSelect";
    }

    // 패스워드 찾기
    @GetMapping("login_pwFind")
    public String login_pwFind(){
        return "/login/login_pwFind";
    }

    // 아이디 찾기 후 패스워드 찾기
    @GetMapping("login_pwFind/{id}/{name}/{birth}/{phone}")
    public String login_pwFind(@PathVariable String id,@PathVariable String name,
                               @PathVariable String birth, @PathVariable String phone, Model model){
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("birth", birth);
        model.addAttribute("phone", phone);
        return "/login/login_pwFind";
    }

    // 아이디 찾기 결과 출력
    @GetMapping("login_idSelect/{id}/{name}/{birth}/{phone}")
    public String login_idSelect(@PathVariable String id,@PathVariable String name,
                                 @PathVariable String birth, @PathVariable String phone, Model model){
        model.addAttribute("id", id);
        model.addAttribute("name", name);
        model.addAttribute("birth", birth);
        model.addAttribute("phone", phone);
        return "/login/login_idSelect";
    }

//    // 아이디 찾기 진행
//    @GetMapping("login_idFind_proc/{name}/{birth}/{phone}")
//    @ResponseBody
//    public String login_idFind_proc(@PathVariable String name,@PathVariable String birth, @PathVariable String phone){
//        Map<String,String> param = new HashMap<String,String>();
//        param.put("name", name);
//        param.put("birth", birth);
//        param.put("phone", phone);
//        return memberService.findId(param);
//    }

    // 아이디 찾기
    @GetMapping("login_idFind")
    public String login_idFind() {
        return "/login/login_idFind";
    }


    // 로그인 proc
    @PostMapping("login")
    public String loginProc(MemberDto memberDto, Model model, HttpSession session) {
        SessionDto sessionDto = memberService.login(memberDto);
        if (sessionDto.getLoginResult() == 1) {
            model.addAttribute("loginResult", "ok");
            session.setAttribute("svo", sessionDto);
        }
        return "index";
    }

    //로그아웃 매핑
    @GetMapping("logout")
    public String logout(HttpSession session,Model model){
        SessionDto svo = (SessionDto)session.getAttribute("svo");
        if(svo != null){
            session.invalidate();
            model.addAttribute("logoutResult","ok");
        }
//        sessionDto.setId("");
//        sessionDto.setLoginResult(0);
//        sessionDto.setName("");
//        sessionDto.setPass("");
//        model.addAttribute("logoutResult","ok");
//        model.addAttribute("sessionDto",sessionDto);
        return "index";
    }

    //로그인 실패
    @GetMapping("login_fail")
    public String login_fail(){
        return "/login/login_fail";
    }

    @GetMapping("errorpage")
    public String error(){
        return "/errorpage";
    }

}
