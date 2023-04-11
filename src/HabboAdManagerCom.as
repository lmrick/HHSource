package
{
   import com.sulake.bootstrap.AdManagerBootstrap;
   import com.sulake.iid.IIDHabboAdManager;
   import mx.core.SimpleApplication;
   
   public class HabboAdManagerCom extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(AdManagerBootstrap,IIDHabboAdManager);
       
      
      public function HabboAdManagerCom()
      {
         super();
      }
   }
}
