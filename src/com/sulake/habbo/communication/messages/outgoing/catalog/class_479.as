package package_23
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_479 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_479(param1:int, param2:int, param3:int, param4:String, param5:Boolean, param6:String, param7:int)
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
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
      }
   }
}
