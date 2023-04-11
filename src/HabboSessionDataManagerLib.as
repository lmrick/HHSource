package
{
   import com.sulake.bootstrap.SessionDataManagerBootstrap;
   import com.sulake.iid.IIDSessionDataManager;
   import mx.core.SimpleApplication;

   public class HabboSessionDataManagerLib extends SimpleApplication
   {
      
      public static var requiredClasses:Array = new Array(SessionDataManagerBootstrap,IIDSessionDataManager);
      
      public static var manifest:Class = class_2602;
      
      public static var loading_icon:Class = class_2587;
       
      
      public function HabboSessionDataManagerLib()
      {
         super();
      }
   }
}
