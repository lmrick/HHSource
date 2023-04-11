package package_31
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_163 implements IMessageComposer, class_13
   {
      
      public static var var_1425:Boolean = true;
      
      public static var var_1426:Boolean = false;
       
      
      private var var_20:Array;
      
      public function class_163(param1:int, param2:Boolean, param3:String)
      {
         var_20 = [];
         super();
         var_20.push(param1);
         var_20.push(param2);
         var_20.push(param3);
      }
      
      public function getMessageArray() : Array
      {
         return var_20;
      }
      
      public function dispose() : void
      {
         var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
