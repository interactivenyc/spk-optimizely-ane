package com.speakaboos.ane.optimizely;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class SpeakaboosANEContext extends FREContext {

    @Override
    public void dispose() {
        // TODO Auto-generated method stub

    }

    @Override
    public Map<String, FREFunction> getFunctions() {
        log("creating map");

        Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

        //****************************************************
        // Optimizely
        //***************************************************

        functionMap.put("initOptimizely", new InitOptimizely());
        functionMap.put("requestVersion", new RequestVersion());
        functionMap.put("startOptimizely", new StartOptimizely());
        functionMap.put("enableEditor", new EnableEditor());
        functionMap.put("getAllExperiments", new GetAllExperiments());
        functionMap.put("getUserId", new GetUserId());

        return functionMap;
    }


    public void log(String msg) {
        System.out.println("[ SpeakaboosANEContext ] " + msg);
    }

}
