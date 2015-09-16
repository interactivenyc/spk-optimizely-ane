package com.speakaboos.ane.optimizely;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class SpeakaboosANE implements FREExtension {
    /*
	 * Creates a new instance of ANESampleContext when the context is created 
	 * from the actionscript code.
	 */

    public static SpeakaboosANEContext context;
    public static String projectID;

    public FREContext createContext(String extId) {
        log("CONSTRUCTOR timestamp - 9:20");
        return context = new SpeakaboosANEContext();
    }

    /*
     * Called if the extension is unloaded from the process. Extensions
     * are not guaranteed to be unloaded; the runtime process may exit without
     * doing so.
     */
    @Override
    public void dispose() {
    }

    /*
      * Extension initialization.
      */
    public void initialize() {
    }

    public void log(String msg) {
        System.out.println("[ SpeakaboosANE.java ] " + msg);
    }
}
