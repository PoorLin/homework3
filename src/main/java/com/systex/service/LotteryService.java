package com.systex.homework3.service;

import java.util.*;

public class LotteryService {

    public ArrayList<Integer>[] getNumbers(int groups, LinkedList<Integer> excludes){
        ArrayList<Integer>[] res = new ArrayList[groups];
        for(int resIndex=0;resIndex<groups;resIndex++){
            ArrayList<Integer> arrayList = new ArrayList<>();
            for (int newNum = 1; newNum < 7; newNum++) {
                int randanNum = ((int) (Math.random() * 49) + 1);
                if (excludes.contains(randanNum)) {
                    newNum--;
                } else {
                    if (arrayList.contains(randanNum)) {
                        newNum--;
                    } else {
                        arrayList.add(randanNum);
                    }
                }
            }
            Collections.sort(arrayList);
            res[resIndex] = arrayList;

        }

        return res;
    }




}
