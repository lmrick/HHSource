package package_27
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_160 implements IMessageComposer
   {
       
      
      private var var_45:Array;
      
      public function class_160(param1:int, param2:int, param3:Array)
      {
         var _loc4_:int = 0;
         super();
         var_45 = [param1,param2];
         var_45.push(param3.length);
         _loc4_ = 0;
         while(_loc4_ < param3.length)
         {
            var_45.push(String(param3[_loc4_]));
            _loc4_++;
         }
      }
      
      public function getMessageArray() : Array
      {
         return var_45;
      }
      
      public function dispose() : void
      {
         var_45 = null;
      }
   }
}
