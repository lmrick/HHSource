package login
{
   import com.sulake.habbo.communication.login.class_32;
   import com.sulake.habbo.communication.login.class_34;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.LocationChangeEvent;
   import flash.geom.Rectangle;
   import flash.media.StageWebView;
   
   public class WebCaptchaView extends Sprite implements class_34
   {
      
      private static var var_111:StageWebView;
      
      private static const CAPTCHA_ENDPOINT:String = "/api/public/captcha";
      
      private static const TOKEN_KEY:String = "token=";
       
      
      private var var_282:class_32;
      
      public function WebCaptchaView(param1:class_32)
      {
         super();
         var_282 = param1;
         addEventListener("addedToStage",onAddedToStage);
      }
      
      private static function resolveToken(param1:String) : String
      {
         var _loc2_:int = int(param1 != null ? param1.indexOf("token=") : -1);
         if(_loc2_ < 0)
         {
            return null;
         }
         return param1.substr(_loc2_ + 6);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         var _loc2_:String = var_282.getProperty("web.api") + "/api/public/captcha";
         class_14.log("[WebCaptchaView] Initialize url: " + _loc2_);
         this.width = stage.stageWidth;
         this.height = stage.stageHeight;
         if(var_111 == null)
         {
            var_111 = new StageWebView(true);
            var_111.stage = this.stage;
            var_111.viewPort = new Rectangle(0,100,stage.width,-100);
            var_111.loadURL(_loc2_);
            var_111.addEventListener("locationChange",onLocationChange);
         }
      }
      
      public function dispose() : void
      {
         var_282 = null;
         if(var_111)
         {
            var_111.removeEventListener("locationChange",onLocationChange);
            var_111.dispose();
         }
      }
      
      private function onLocationChange(param1:LocationChangeEvent) : void
      {
         var _loc2_:String = resolveToken(param1.location);
         if(_loc2_ != null)
         {
            var_282.handleCaptchaResult(_loc2_);
         }
      }
   }
}
