package com.speakaboos.ane.optimizely;

import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;
import com.optimizely.integration.OptimizelyExperimentData;

public class GetAllExperiments implements FREFunction {

	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		// TODO Auto-generated method stub
		
		Map<String, OptimizelyExperimentData> experiments = Optimizely.getAllExperiments();
        log("experiments.values(): "+experiments.values());
        
		return null;
	}
	
	public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
