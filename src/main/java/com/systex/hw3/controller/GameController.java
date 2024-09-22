package com.systex.hw3.controller;

import com.systex.hw3.model.GuessGame;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "gameController", value = "/game/gameController.do")
public class GameController extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher view = request.getRequestDispatcher("guess.jsp");
        view.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
       String action= request.getParameter("action");
        switch (action){
            case "guess":{
                guess(request,response);
            } default:{
              RequestDispatcher  view = request.getRequestDispatcher("error.jsp");
                view.forward(request, response);
            }
        }


    }
    public void guess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        RequestDispatcher view;

        Map<String,String> errorMsg = new HashMap<>();
        String guessStr = request.getParameter("guessNumber");

        Integer  guessNumber = null;
        if(guessStr == null || guessStr.trim().isEmpty()) {
            errorMsg.put("guessNumber","請輸入要猜的數字");
        }else {
            try {
                guessNumber = Integer.valueOf(guessStr);
                if(guessNumber>10 || guessNumber < 1){
                    errorMsg.put("guessNumber","請輸入1~10之間的數字");
                }
            }catch (Exception e){
                errorMsg.put("guessNumber","請輸入數字");
            }



        }
        request.setAttribute("errors", errorMsg);
        if(!errorMsg.isEmpty()) {
            view = request.getRequestDispatcher("guess.jsp");
            view.forward(request, response);
            return;//將控制權還給container
        }

        HttpSession httpSession =request.getSession();
        GuessGame guessGame=(GuessGame)httpSession.getAttribute("guessGame");
        System.out.println(guessGame);
        if(guessGame == null){
            guessGame = new GuessGame(10, ((int) (Math.random() * 10) + 1));
        }
        boolean isCorr= guessGame.guess(guessNumber);
        if(isCorr){
            view = request.getRequestDispatcher("youWin.jsp");
        }else {
            if(guessGame.getRemains() == 0){
                httpSession.invalidate();
                view = request.getRequestDispatcher("youLose.jsp");
                view.forward(request, response);
                return;
            }else {
                view = request.getRequestDispatcher("guess.jsp");
            }
        }

        httpSession.setAttribute("guessGame",guessGame);
        view.forward(request, response);
    }
    public void destroy() {
    }
}