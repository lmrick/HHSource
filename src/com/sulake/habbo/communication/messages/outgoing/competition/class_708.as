package package_3
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   [SecureSWF(rename="true")]
   public class class_708 implements IMessageComposer
   {
      
      public static const const_266:int = 0;
      
      public static const const_257:int = 1;
      
      public static const const_89:int = 2;
      
      public static const const_240:int = 3;
       
      
      private var var_45:Array;
      
      public function class_708(param1:String, param2:int)
      {
         var_45 = [];
         super();
         var_45.push(param1);
         var_45.push(param2);
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
