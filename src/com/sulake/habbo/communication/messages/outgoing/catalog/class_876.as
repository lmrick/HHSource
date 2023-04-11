package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_876 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_876(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int, param7:int, param8:int, param9:Boolean)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
         var_45.push(param5);
         var_45.push(param6);
         var_45.push(param7);
         var_45.push(param8);
         var_45.push(param9);
      }
      
      public function dispose() : void
      {
         var_45 = [];
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
   }
}
