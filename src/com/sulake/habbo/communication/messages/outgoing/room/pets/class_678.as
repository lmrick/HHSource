package package_76
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_678 implements IMessageComposer
   {
      
      public static const const_250:int = 0;
      
      public static const const_11:int = 1;
      
      public static const const_15:int = 2;
       
      
      private var var_45:Array;
      
      public function class_678(param1:int, param2:int, param3:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
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
