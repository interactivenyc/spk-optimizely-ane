package com.speakaboos.ane
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class OptimizelyANE extends EventDispatcher
	{
		private static var _instance:OptimizelyANE;
		public static var extContext:ExtensionContext = null;
		
		//stores data from event
		private var eventData:Object = new Object;
		
		private var _isSupported:Boolean = false;
		
		public function OptimizelyANE(enforcer:SingletonEnforcer, target:IEventDispatcher=null){
			super(target);
			//log("CONSTRUCTOR");
//			if (!extContext) {
//				log("Creating extension context.");
//				
//				try{
//					extContext = ExtensionContext.createExtensionContext("com.speakaboos.ane.OptimizelyANE", "");
//				}catch(error:Error){
//					log("Failed to create extension context - caught in try/catch.");
//				}
//				
//				if (extContext){
//					
//					log("ExtensionContext:");
//					log(extContext);
//					
//					_isSupported = true;
//					
//					extContext.addEventListener(StatusEvent.STATUS, onStatusEvent);
//				}else{
//					log("Failed to create extension context.");
//				}
//			}
		}
		
		public static function getInstance():OptimizelyANE{
			
			if(!_instance) {
				_instance = new OptimizelyANE( new SingletonEnforcer());
			}
			
			return _instance;
		}
		
		public function getContext():ExtensionContext {
			//log("getContext");
			return null;
		}
		
		public function isSupported():Boolean{
			return _isSupported;
		}
		
		//****************************************************
		// Main Event Handler 
		// receives event from Android, 
		// dispatches through ANE to be received by AIR app
		//***************************************************
		
		public function onStatusEvent(e:StatusEvent):void{
			// Any data being passed from this event will be in e.level
			
//			try{
//				log(e.toString());
//				
//				var data:String = e.level;
//				eventData[e.code] = e.level;
//				
//				log("data saved for "+e.code);
//				log(data);
//				
//			}catch(e:Error){
//				//log("Error: "+e.type);
//			}
//			
//			dispatchEvent(e);
		}
		
		public function getDataFromEvent(eventType:String):String{
			var dataString:String = "";
//			log("retrieve data for "+eventType);
//			if (eventData[eventType]){
//				dataString = eventData[eventType]; 
//				eventData[eventType] = null;
//			}
			return dataString;
		}
		
		
		
		//****************************************************
		// Native System Functions
		// testing basic functionality
		//***************************************************
		
		public function helloWorld():String {
			//log("helloWorld");
			return null;
		}
		
		
		public function requestVersion():String {
			//log("helloWorld");
			//var str:String = extContext.call("getVersion") as String;
			return null;
		}
		
		private function log(msg:*):void{
			trace("[ OptimizelyANE ] " + msg);
		}
		
	}
}
class SingletonEnforcer {
	public function SingletonEnforcer():void {}
}