package com.speakaboos.ane.optimizely;

import java.util.List;

import android.os.Bundle;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;
import com.optimizely.integration.OptimizelyEventListener;
import com.optimizely.integration.OptimizelyExperimentData;

public class InitOptimizely implements FREFunction {

    @Override
    public FREObject call(FREContext freContext, FREObject[] args) {
        // TODO Auto-generated method stub

        try {            

            log("InitOptimizely:");
            
            Optimizely.setVerboseLogging(true);
            
            log("Optimizely.setVerboseLogging(true)");
            
            OptimizelyEventListener listener = new OptimizelyEventListener() {
				
				@Override
				public void onOptimizelyStarted() {
					// TODO Auto-generated method stub
					log("EVENT: onOptimizelyStarted");
					
				}
				
				@Override
				public void onOptimizelyFailedToStart(String arg0) {
					// TODO Auto-generated method stub
					log("EVENT: onOptimizelyFailedToStart");
					
				}
				
				@Override
				public void onOptimizelyExperimentViewed(OptimizelyExperimentData arg0) {
					// TODO Auto-generated method stub
					log("EVENT: onOptimizelyExperimentViewed");
					
				}
				
				@Override
				public void onOptimizelyEditorEnabled() {
					// TODO Auto-generated method stub
					log("EVENT: onOptimizelyEditorEnabled");
					
				}
				
				@Override
				public void onOptimizelyDataFileLoaded() {
					// TODO Auto-generated method stub
					log("EVENT: onOptimizelyDataFileLoaded");
					
				}
				
				@Override
				public void onMessage(String arg0, String arg1, Bundle arg2) {
					// TODO Auto-generated method stub
					log("EVENT: onMessage");
					
				}
				
				@Override
				public void onGoalTriggered(String arg0, List<OptimizelyExperimentData> arg1) {
					// TODO Auto-generated method stub
					log("EVENT: onGoalTriggered");
					
				}
			};
			
			log("OptimizelyEventListener created: "+listener);

        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
    

    public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
