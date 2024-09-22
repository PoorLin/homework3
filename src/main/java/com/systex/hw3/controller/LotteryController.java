package com.systex.homework3.controller;

import com.systex.homework3.service.LotteryService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

@WebServlet(name = "lotteryController", value = "/lottery/lotteryController.do")
public class LotteryController extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action = request.getParameter("action");
        RequestDispatcher view;
        switch (action){
            case "generate":{
                generateLottery(request,response);
            } default:{
                view = request.getRequestDispatcher("error.jsp");
                view.forward(request, response);
            }
        }


        // Hello



    }

    public void generateLottery(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher view;
        Map<String,String> errorMsg = new HashMap<>();


        String lotteryCount = request.getParameter("lotteryCount");
        String excludedNumbers = request.getParameter("excludedNumbers");

        if(lotteryCount == null || lotteryCount.trim().isEmpty()) {
            errorMsg.put("lotteryCount","請輸入要產生的樂透組數");
        }
        if(excludedNumbers== null || excludedNumbers.trim().isEmpty()) {
            errorMsg.put("excludedNumbers","請輸入要排除的數字");
        }
        request.setAttribute("errorMsg", errorMsg);
        if(!errorMsg.isEmpty()) {
            view = request.getRequestDispatcher("main.jsp");
            view.forward(request, response);
            return;//將控制權還給container
        }


            LotteryService lotteryService = new LotteryService();
        String[] excludedNumbersArr;
        LinkedList<Integer> excludedNumberList = new LinkedList<>();
        try{
           excludedNumbersArr = excludedNumbers.split(" ");
            for(String nowNumber:excludedNumbersArr){
                excludedNumberList.add(Integer.valueOf(nowNumber));
            }
        }catch (Exception e){
            e.printStackTrace();
            errorMsg.put("excludedNumbers","請輸入數字");
            request.setAttribute("errorMsg", errorMsg);
            view = request.getRequestDispatcher("main.jsp");
            view.forward(request, response);
            return;
        }


        ArrayList<Integer>[]  res ;
            try {
                res=lotteryService.getNumbers(Integer.valueOf(lotteryCount),excludedNumberList);
            }catch (Exception e){
            e.printStackTrace();
            errorMsg.put("lotteryCount","請輸入數字");
            request.setAttribute("errorMsg", errorMsg);
            view = request.getRequestDispatcher("main.jsp");
            view.forward(request, response);
            return;
            }


            request.setAttribute("res",res);
            view = request.getRequestDispatcher("result.jsp");
            view.forward(request, response);



    }

    public void destroy() {
    }
}