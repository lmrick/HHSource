package
{
   import com.sulake.bootstrap.HabboCommunicationManagerBootstrap;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import mx.core.SimpleApplication;

   public class HabboCommunicationCom extends SimpleApplication
   {
      
      public static var requiredClasses:Array = new Array(HabboCommunicationManagerBootstrap,IIDHabboCommunicationManager);
      
      public static var manifest:Class = manifest;
       
      
      public function HabboCommunicationCom()
      {
         super();
      }
   }
}
