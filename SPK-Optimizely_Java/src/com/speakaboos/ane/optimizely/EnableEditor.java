package com.speakaboos.ane.optimizely;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.optimizely.Optimizely;

public class EnableEditor implements FREFunction {

	@Override
	public FREObject call(FREContext arg0, FREObject[] arg1) {
		// TODO Auto-generated method stub
		
		 log("calling Optimizely.enableEditor()");
		 
		 //tried this - had no apparent effect
		 //Optimizely.setVisualExperimentsEnabled(false);
		 
         Optimizely.enableEditor();
         
		return null;
	}
	
	public void log(String msg) {
        System.out.println("[ ANE Optimizely.java ] " + msg);
    }

}
