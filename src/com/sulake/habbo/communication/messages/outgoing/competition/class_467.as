package package_3
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_467 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_467(param1:String)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
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
