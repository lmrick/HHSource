package package_7
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_1032 implements IMessageComposer
   {
      
      public static const const_306:int = 0;
      
      public static const const_97:int = 1;
      
      public static const const_218:int = 2;
       
      
      private var var_45:Array;
      
      public function class_1032(param1:int, param2:int, param3:String, param4:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
         var_45.push(param3);
         var_45.push(param4);
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
