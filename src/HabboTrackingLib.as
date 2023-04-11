package
{
   import com.sulake.bootstrap.HabboTrackingBootstrap;
   import com.sulake.iid.IIDHabboTracking;
   import mx.core.SimpleApplication;
   
   public class HabboTrackingLib extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(HabboTrackingBootstrap,IIDHabboTracking);
       
      
      public function HabboTrackingLib()
      {
         super();
      }
   }
}
