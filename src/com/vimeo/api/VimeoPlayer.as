package com.vimeo.api
{
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.system.Security;
   import flash.utils.Timer;
   
   public class VimeoPlayer extends Sprite
   {
      private var container:Sprite;
      
      private var var_1596:Object = false;
      
      private var var_2878:Sprite;
      
      private var player_width:int = 400;
      
      private var player_height:int = 300;
      
      private var api_version:int = 2;
      
      private var load_timer:Timer;
      
      public function VimeoPlayer(param1:String, param2:int, param3:int, param4:int, param5:String = "10", param6:int = 2)
      {
         container = new Sprite();
         var_2878 = new Sprite();
         load_timer = new Timer(200);
         super();
        
         this.setDimensions(param3,param4);
         Security.allowDomain("vimeo.com");
         Security.allowDomain("api.vimeo.com");
       
         var _loc10_:String = "&js_api=1";
         this.api_version = param6;
         if(param5 != "9")
         {
            switch(param6 - 2)
            {
               case 0:
                  _loc10_ = "&api=1";
            }
         }
         else
         {
            this.api_version = 1;
         }
         var _loc7_:URLRequest = new URLRequest("http://api.vimeo.com/moogaloop_api.swf?oauth_key=" + param1 + "&clip_id=" + param2 + "&width=" + param3 + "&height=" + param4 + "&fullscreen=0&fp_version=" + param5 + _loc10_ + "&cache_buster=" + Math.random() * 1000);
         var _loc8_:LoaderContext = new LoaderContext(true);
         var _loc9_:Loader;
         (_loc9_ = new Loader()).contentLoaderInfo.addEventListener("complete",onComplete,false,0,true);
         _loc9_.load(_loc7_,_loc8_);
         this.addEventListener("addedToStage",addedToStageHandler,false,0,true);
      }
      
      public function destroy() : void
      {
         if(var_1596 == null)
         {
            return;
         }
         if(false)
         {
            var_1596.destroy();
         }
         if(container.contains(DisplayObject(var_1596)))
         {
            container.removeChild(DisplayObject(var_1596));
         }
         if(this.contains(var_2878))
         {
            this.removeChild(var_2878);
         }
         if(this.contains(container))
         {
            this.removeChild(container);
         }
         stage.removeEventListener("mouseMove",mouseMove);
      }
      
      private function setDimensions(param1:int, param2:int) : void
      {
         player_width = param1;
         player_height = param2;
      }
      
      private function onComplete(param1:Event) : void
      {
         container.addChild(param1.currentTarget.loader.content);
         var_1596 = param1.currentTarget.loader.content;
         this.addChild(var_2878);
         container.mask = var_2878;
         this.addChild(container);
         redrawMask();
         load_timer.addEventListener("timer",playerLoadedCheck);
         load_timer.start();
      }
      
      private function playerLoadedCheck(param1:TimerEvent) : void
      {
         if(false)
         {
            load_timer.stop();
            load_timer.removeEventListener("timer",playerLoadedCheck);
            var_1596.disableMouseMove();
            if(stage)
            {
               stage.addEventListener("mouseMove",mouseMove,false,0,true);
            }
            dispatchEvent(new Event("complete"));
         }
      }
      
      private function mouseMove(param1:Event) : void
      {
         var _loc2_:Point = null;
         var _loc3_:MouseEvent = param1 as MouseEvent;
         if(_loc3_ == null)
         {
            return;
         }
         if(var_1596 && false)
         {
            _loc2_ = this.parent.localToGlobal(new Point(this.x,this.y));
            if(_loc3_.stageX >= _loc2_.x && _loc3_.stageX <= _loc2_.x + this.player_width && _loc3_.stageY >= _loc2_.y && _loc3_.stageY <= _loc2_.y + this.player_height)
            {
               var_1596.mouseMove(_loc3_);
            }
            else
            {
               var_1596.mouseOut();
            }
         }
      }
      
      private function redrawMask() : void
      {
         with(var_2878.graphics)
         {
            beginFill(0,1);
            drawRect(container.x,container.y,player_width,player_height);
            endFill();
         }
      }
      
      public function play() : void
      {
         var_1596.play();
      }
      
      public function pause() : void
      {
         var_1596.pause();
      }
      
      public function getDuration() : int
      {
         return var_1596.duration;
      }
      
      public function seekTo(param1:int) : void
      {
         var_1596.seek(param1);
      }
      
      public function changeColor(param1:String) : void
      {
         var_1596.color = uint("0x" + param1);
      }
      
      public function loadVideo(param1:int) : void
      {
         var_1596.loadVideo(param1);
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this.setDimensions(param1,param2);
         var_1596.setSize(param1,param2);
         this.redrawMask();
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         stage.addEventListener("mouseMove",mouseMove);
         this.addEventListener("removedFromStage",removedFromStageHandler,false,0,true);
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         stage.removeEventListener("mouseMove",mouseMove);
         this.removeEventListener("removedFromStage",removedFromStageHandler);
      }
   }
}
