
package com.speakaboos.ane.optimizely
{
	
	import com.speakaboos.ane.OptimizelyANE;
	
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.InvokeEvent;
	import flash.events.MouseEvent;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.text.TextField;
	import flash.text.TextFormat;
		
	[SWF(width=1600,height=900)]
	public class OptimizelyTest extends Sprite
	{
		private static var _bg:MovieClip;
		private static var _console:TextField;
		private static var _tf:TextFormat;
		
		
		public static const STAGE_WIDTH:int = 1600;
		public static const STAGE_HEIGHT:int = 900;
		public static const TOP_MARGIN:int = 25;
		
		public static var deviceWidth:int;
		public static var deviceHeight:int;
		
		public static var visibleWidth:Number;
		public static var leftEdge:Number;
		public static var aspectRatio:Number;
		public static var stageScale:Number;
		
		private var file_ani:File;
		private var fs_ani:FileStream;
		
		//private var _aneController:ANEController;
		
		private var _buttonArray:Array;
		private var _buttonGrid:MovieClip;
		
		private var _spkANE:OptimizelyANE;
		private var _aneContext:ExtensionContext;
		
		
		
		
		public function OptimizelyTest()
		{
			super();
			
			log("CONSTRUCTOR");
			
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
			stage.quality = StageQuality.MEDIUM; // .LOW; // .HIGH; //
			stage.color = 0xcccccc;
			
			start();
		}
		
		
		private function start():void {
			log("start")
			
			_bg = getFilledMC(1000,840,0xFF6600);
			_bg.x = 10;
			_bg.y = TOP_MARGIN;
			stage.addChild(_bg);
			
			_console = new TextField();
			_console.wordWrap = true;
			_console.multiline = true;
			_console.width = 1000;
			_console.height = 840;
			_console.border = true;
			_console.selectable = false;
			//_console.mouseEnabled = false;
			_console.x = 10;
			_console.y = TOP_MARGIN;
			_tf = _console.getTextFormat();
			_tf.size = 24;
			_tf.bold = true;
			_tf.font = "_sans";
			_tf.leftMargin = 10;
			_console.setTextFormat(_tf);
			_console.text = "start";
			stage.addChild(_console);
			
			addEventListeners();
			handleResize();
			initializeANE();
		}
		
		private function addEventListeners():void{
			stage.addEventListener(Event.RESIZE, handleResize);
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,onInvoke);
			
		}
		
		private function onAddedToStage(e:Event):void{
			//try to dismiss soft keyboard
			log("onAddedToStage");
			stage.focus = stage;
			setupButtons();
			
		}
		
		
		private function initializeANE():void{
			log("initializeANE");
			_spkANE = OptimizelyANE.getInstance();
			
			_aneContext = ExtensionContext(_spkANE.getContext());
			if (_aneContext){
				_aneContext.addEventListener(StatusEvent.STATUS,statusHandle);
			}
			
			log("_aneContext");
			log(_aneContext);
		}
		
		//****************************************************
		// Resize event happens after app has launched
		// when screen size details have been received
		//***************************************************
		
		private function handleResize(e:Event = null) :void { 
			deviceWidth = stage.stageWidth;
			deviceHeight = stage.stageHeight;
			stageScale = deviceHeight / STAGE_HEIGHT;
			aspectRatio = deviceWidth/deviceHeight;
			visibleWidth = STAGE_HEIGHT * aspectRatio;
			leftEdge = (STAGE_WIDTH - visibleWidth) / 2;
			
			log("***************************************");
			log("handleResize(e)");
			log("***************************************");
			log("DEVICE_SCREEN: "+stage.stageWidth + " x " + stage.stageHeight);
			log("ASPECT_RATIO: "+aspectRatio);
			log("stageScale: "+stageScale);
			log("***************************************");
			log("waiting for message from ANE...");
			log("***************************************");
		}
		
		
		//****************************************************
		// Create Buttons, Assign Functions
		// Handle with MouseEvents
		//***************************************************
		
		private function setupButtons():void{
			log("setupButtons");
			
			_buttonArray = new Array();
			
			_buttonArray.push(getTextButton("initOptimizely"));
			_buttonArray.push(getTextButton("getUserId"));
			_buttonArray.push(getTextButton("requestVersion"));
			_buttonArray.push(getTextButton("getAllExperiments"));
			_buttonArray.push(getTextButton("enableEditor"));
			_buttonArray.push(getTextButton("startOptimizely"));
			
			_buttonGrid = getButtonGrid(1);
			_buttonGrid.mouseEnabled = false;
			_buttonGrid.x = 1025;
			_buttonGrid.y = TOP_MARGIN;
			log("addChild(_buttonGrid);");
			addChild(_buttonGrid);
		}
		
		
		private function getButtonGrid(cols:int):MovieClip{
			log("getButtonGrid");
			var mc:MovieClip = new MovieClip();
			
			//log("getMCGrid gap:"+gap);
			var gap:int = 5;
			var cellWidth:int = 275;
			var cellHeight:int = 75;
			
			for (var i:int=0;i<_buttonArray.length;i++){
				_buttonArray[i].x = int(i%cols*(cellWidth+gap));
				_buttonArray[i].y = int(int(i/cols)*(cellHeight+gap));
				mc.addChild(_buttonArray[i]);
			}
			
			return mc;
		}
		
		
		public function getFilledMC(w:Number,h:Number,color:Number = 0x0000FF):MovieClip {
			var mc:MovieClip = new MovieClip();
			var rect:Shape = new Shape();
			rect.graphics.beginFill(color);
			rect.graphics.lineStyle(0,color,0);
			rect.graphics.drawRect(0, 0, w, h);
			rect.graphics.endFill();
			mc.addChild(rect);
			return mc;
		}
		
		private function getTextButton(label:String):MovieClip{
			var button:MovieClip = new noClassButton();
			button.text.label.text = label;
			button.text.mouseEnabled = false;
			button.width = 250;
			button.addEventListener(MouseEvent.CLICK, onMouseEvent);
			
			return button;
		}
		
		
		private function onMouseEvent(e:MouseEvent):void{
			log("onMouseEvent: "+e.currentTarget);
			
			switch(e.currentTarget.text.label.text){
				case "initOptimizely":
					log("init Optimizely with AppsFlyerTest projectID");
					var projectId:String = "5a789ae426f832277e7dc1e12b3a656f";
					_spkANE.initOptimizely(projectId);
					break;
				case "enableEditor":
					_spkANE.enableEditor();
					break;
				case "startOptimizely":
					_spkANE.startOptimizely();
					break;
				case "requestVersion":
					_spkANE.requestVersion();
					break;
				case "getUserId":
					_spkANE.getUserId();
					break;
				case "getAllExperiments":
					_spkANE.getAllExperiments();
					break;
				
			}
		}
		
		
		public static function getFormattedDay(date:Date):String{
			var intDay:int = date.getDay();
			var stringDay:String;
			switch(intDay){
				case 0:
					stringDay = "Sunday";
					break;
				case 1:
					stringDay = "Monday";
					break;
				case 2:
					stringDay = "Tuesday";
					break;
				case 3:
					stringDay = "Wednesday";
					break;
				case 4:
					stringDay = "Thursday";
					break;
				case 5:
					stringDay = "Friday";
					break;
				case 6:
					stringDay = "Saturday";
					break;
				
			}
			return stringDay;
		}
		
		public static function getFormattedDate(date:Date):String{
			return date.getMonth()+"/"+date.getDate()+"/"+date.getFullYear();
		}
		
		public static function getFormattedTime(date:Date):String{
			return two(date.hours) + ":" + two(date.minutes) + ":" +two(date.seconds);
		}
		
		public static function two(x:Number):String {return ((x>9)?"":"0")+x}
	
		
		// listener function
		public function statusHandle(e:StatusEvent):void{
			
			log("***************************************");
			log(new Date());
			log("statusHandle event: "+e.toString());
			log("***************************************");
		}
		
		public static function replaceChars(origStr:String, replace:String, withStr:String):String {
			while(origStr.indexOf(replace) > -1){
				origStr = origStr.replace(replace, withStr);
			}
			return origStr;
		}
		
		
		private function onInvoke(event:InvokeEvent):void{
			log("onInvoke() event.type: "+event.type);
			log("onInvoke() event.arguments: "+event.arguments);
			log("onInvoke() event.arguments.length: "+event.arguments.length);
				
		}
		
		
		private function log(msg:*):void{
			trace("[ OptimizelyTest ] " + msg);
			try{
				if (_console){
					_console.text = _console.text + "\r" + msg ;
					_console.setTextFormat(_tf);
					_console.scrollV = _console.maxScrollV;
				}
				
			}catch(e:Error){
				trace("log error :: "+e.message);
			}
		}
		
	}
}