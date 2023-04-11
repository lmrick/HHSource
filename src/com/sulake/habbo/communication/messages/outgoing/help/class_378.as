package package_69
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_378 implements IMessageComposer, class_13
   {
       
      
      private var var_20:Array;
      
      public function class_378(param1:int, param2:int, param3:int, param4:int, param5:String)
      {
         var_20 = [];
         super();
         this.var_20 = [param1,param2,param3,param4,param5];
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
