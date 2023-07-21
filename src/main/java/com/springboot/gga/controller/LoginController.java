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

    // 패스워드 찾기
    @GetMapping("login_pwFind")
    public String login_pwFind(){
        return "/login/login_pwFind";
    }

    // 아이디 찾기 결과 출력
    @GetMapping("login_idSelect/{id}")
    public String login_idSelect(@PathVariable String id, Model model){
        model.addAttribute("id", id);
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
    public String loginProc(MemberDto memberDto, Model model, HttpSession session){
//        String viewName = "";
        SessionDto sessionDto = memberService.login(memberDto);
        if(sessionDto.getLoginResult() == 1 ) {
            // 상태 토큰으로 사용할 랜덤 문자열 생성
//            String state = generateState();
            // 세션 또는 별도의 저장 공간에 상태 토큰을 저장
//            request.session().attribute("state", state);
//            session.setAttribute("state", state);
//            return state;
            model.addAttribute("loginResult","ok");
//            model.addAttribute("sessionDto",sessionDto);
            session.setAttribute("svo",sessionDto);
//            viewName = "index";
        }
//        else if(sessionDto == null){ 널 체크
//            viewName = "login_fail";
//        }
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
        return "login_fail";
    }



//    // CSRF 방지를 위한 상태 토큰 생성 코드
//    // 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.
//
//
//    public String generateState() {
//        SecureRandom random = new SecureRandom();
//        return new BigInteger(130, random).toString(32);
//    }

}
