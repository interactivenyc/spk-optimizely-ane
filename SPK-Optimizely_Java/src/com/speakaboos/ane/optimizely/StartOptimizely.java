package com.speakaboos.ane.optimizely;

import java.util.List;

import android.app.Application;
import android.os.Bundle;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;
import com.optimizely.integration.OptimizelyEventListener;
import com.optimizely.integration.OptimizelyExperimentData;

public class StartOptimizely implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] arg1) {
		// TODO Auto-generated method stub
		
        Application app = freContext.getActivity().getApplication();
        
        //log("calling Optimizely.startOptimizely('AAM7hIkA_r3a5beLECpwdgySS8MxbQqB')");
		//Optimizely.startOptimizely("AAM7hIkA_r3a5beLECpwdgySS8MxbQqB~3409680848", app);
        
        OptimizelyEventListener listener = new OptimizelyEventListener() {
			
			@Override
			public void onOptimizelyStarted() {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onOptimizelyStarted");
				
			}
			
			@Override
			public void onOptimizelyFailedToStart(String arg0) {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onOptimizelyFailedToStart");
				
			}
			
			@Override
			public void onOptimizelyExperimentViewed(OptimizelyExperimentData arg0) {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onOptimizelyExperimentViewed");
				
			}
			
			@Override
			public void onOptimizelyEditorEnabled() {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onOptimizelyEditorEnabled");
				
			}
			
			@Override
			public void onOptimizelyDataFileLoaded() {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onOptimizelyDataFileLoaded");
				
			}
			
			@Override
			public void onMessage(String arg0, String arg1, Bundle arg2) {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onMessage");
				
			}
			
			@Override
			public void onGoalTriggered(String arg0, List<OptimizelyExperimentData> arg1) {
				// TODO Auto-generated method stub
				log("EVENT (startOptimizely): onGoalTriggered");
				
			}
		};
		
		log("calling Optimizely.startOptimizelyAsync('AAM7hIkA_r3a5beLECpwdgySS8MxbQqB', app, listener)");
		Optimizely.startOptimizelyAsync("AAM7hIkA_r3a5beLECpwdgySS8MxbQqB~3409680848", app, listener);
        
		return null;
	}
	
	public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
