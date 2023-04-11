package package_40
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.communication.util.Byte;
   import com.sulake.core.runtime.class_13;

   public class class_923 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_923(param1:int)
      {
         var_20 = [];
         super();
         var_20.push(new Byte(param1));
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
