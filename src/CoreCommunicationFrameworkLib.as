package
{
   import com.sulake.bootstrap.CoreCommunicationManagerBootstrap;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import mx.core.SimpleApplication;
   
   public class CoreCommunicationFrameworkLib extends SimpleApplication
   {
      
      public static var manifest:Class = manifest;
      
      public static var requiredClasses:Array = new Array(CoreCommunicationManagerBootstrap,IIDCoreCommunicationManager);
       
      
      public function CoreCommunicationFrameworkLib()
      {
         super();
      }
   }

}
