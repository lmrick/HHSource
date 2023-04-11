package package_59
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.class_13;
   
   [SecureSWF(rename="true")]
   public class class_779 implements IMessageComposer, class_13
   {
      
      public static const const_311:int = 0;
      
      public static const const_91:int = 1;
      
      public static const const_400:int = 3;
      
      public static const const_402:int = 4;
       
      
      private var var_20:Array;
      
      public function class_779(param1:int, param2:String, param3:String)
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
