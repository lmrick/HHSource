package package_45
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_196 implements IMessageComposer, class_13
   {
      
      public static const const_5:int = -1;
       
      
      private var var_20:Array;
      
      public function class_196()
      {
         var_20 = [];
         super();
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
