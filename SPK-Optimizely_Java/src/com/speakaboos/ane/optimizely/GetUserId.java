package com.speakaboos.ane.optimizely;

import android.content.Context;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;

public class GetUserId implements FREFunction {

	@Override
	public FREObject call(FREContext freContext, FREObject[] arg1) {
		// TODO Auto-generated method stub
		Context context = freContext.getActivity().getApplicationContext();
		log("getApplicationContext context: "+context.toString());
		String userID = Optimizely.getUserId(context);
        log("userID: "+userID);
		return null;
	}
	
	public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
