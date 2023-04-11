package package_3
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_170 implements IMessageComposer
   {
       
      
      private var var_20:Array;
      
      public function class_170(param1:String, param2:int)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
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
