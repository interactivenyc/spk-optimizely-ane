package com.speakaboos.ane.optimizely;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;

public class RequestVersion implements FREFunction {
	
	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		String optimizelyVersion = Optimizely.sdkVersion();
		SpeakaboosANEContext context = SpeakaboosANE.context;
		
		log("dispatch event OPTIMIZELY_GET_VERSION: "+optimizelyVersion);
		context.dispatchStatusEventAsync("OPTIMIZELY_GET_VERSION", optimizelyVersion);
		
		return null;
	}
	
	public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
