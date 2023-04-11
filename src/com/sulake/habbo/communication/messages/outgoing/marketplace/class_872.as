package package_9
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_872 implements IMessageComposer, class_13
   {
      
      public static const const_31:int = 1;
      
      public static const const_187:int = 2;
       
      
      private var var_20:Array;
      
      public function class_872(param1:int, param2:int, param3:int)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
         this.var_20.push(param3);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_20;
      }
      
      public function dispose() : void
      {
         this.var_20 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
