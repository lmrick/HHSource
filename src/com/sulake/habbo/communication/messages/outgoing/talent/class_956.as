package package_80
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   public class class_956 implements IMessageComposer, class_13
   {
       
      
      private var var_45:Array;
      
      public function class_956(param1:String)
      {
         var_45 = [];
         super();
         var_45.push(param1);
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
      
      public function get disposed() : Boolean
      {
         return var_45 == null;
      }
   }
}
