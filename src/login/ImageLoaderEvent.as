package login
{
   import flash.display.Loader;
   import flash.events.Event;
   
   public class ImageLoaderEvent extends Event
   {
       
      
      private var var_16:Loader;
      
      private var var_90:String;
      
      public function ImageLoaderEvent(param1:String, param2:Loader, param3:String)
      {
         var_16 = param2;
         var_90 = param3;
         super(param1,false,false);
      }
      
      public function get loader() : Loader
      {
         return var_16;
      }
      
      public function get url() : String
      {
         return var_90;
      }
   }
}
