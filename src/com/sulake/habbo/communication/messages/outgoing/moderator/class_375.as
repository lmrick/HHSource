package package_59
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_375 implements IMessageComposer, class_13
   {
      
      public static const const_5:int = -1;
       
      
      private var var_20:Array;
      
      public function class_375(param1:int, param2:String, param3:int, param4:int, param5:int)
      {
         var_20 = [];
         super();
         this.var_20.push(param1);
         this.var_20.push(param2);
         this.var_20.push(param3);
         this.var_20.push(param4);
         if(param5 != -1)
         {
            this.var_20.push(param5);
         }
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
